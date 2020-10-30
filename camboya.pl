%lugar(nombre,tipo,personas,entrada).
lugar(temploAgnkor,templo,1500,200).
lugar(temploNom,templo,1000,100).
lugar(rioNom,rio,250,0).
lugar(rioChico,rio,250,0).
lugar(rioMekong,rio,100,0).
lugar(museoCamboya,museo,2000,150).
lugar(museoDeCera,museo,100,50).
lugar(museoDeArte,museo,100,500).
lugar(montaniaSolitaria,montania,500,0).
lugar(camboya,ciudad,5000,0).

impuestoPorcentual(templo, 10).
impuestoFijo(rio, 25).
impuestoFijo(montania, 100). 
impuestoRango(museo, 100,200,5). 

%%Solución usando not
lugarMasVisitado1(Tipo,Nombre):-
    lugar(Nombre,Tipo,Visitantes,_),
    not((lugar(_,Tipo, NuevosVisitantes,_),NuevosVisitantes>Visitantes)).

%%Solución usando forall
lugarMasVisitado2(Tipo,Lugar):-
    lugar(Lugar,Tipo,Visitantes,_),
    forall(lugar(_,Tipo,OtrosVisitantes,_), Visitantes >= OtrosVisitantes).

%%Variante para buscar el lugar más visitado de cualquier tipo
lugarMasVisitado3(Lugar):-
    lugar(Lugar,_,Visitantes,_),
    forall(lugar(_,_,OtrosVisitantes,_), Visitantes >= OtrosVisitantes).


%% Precio de la entrada con impuesto. 
%% Solución inicial, se puede mejorar.

cuantoCuestaEntrar(Lugar,Precio):-
    lugar(Lugar,Tipo,_,Entrada),
    impuestoPorcentual(Tipo,Porc),
    Precio is Entrada + Entrada * Porc / 100.

cuantoCuestaEntrar(Lugar,Precio):-
    lugar(Lugar,Tipo,_,Entrada),
    impuestoFijo(Tipo,Adicional),
    Precio is Entrada + Adicional.

cuantoCuestaEntrar(Lugar,Precio):-
    lugar(Lugar,Tipo,_,Entrada),
    impuestoRango(Tipo,Min,Max,Porc),
    between(Min,Max,Entrada),
    Precio is Entrada + Entrada * Porc/100. 

cuantoCuestaEntrar(Lugar,Entrada):-
    lugar(Lugar,Tipo,_,Entrada),
    impuestoRango(Tipo,Min,Max,_),
    not(between(Min,Max,Entrada)). 


%% Nuevo requerimiento, buscar la recaudación total,
%% considerando la cantidad de visitantes y el precio unitario con impuesto.

%% podría usar directamente como auxiliar la anterior
recuadacionTotal(Lugar,Recaudacion):-
    cuantoCuestaEntrar(Lugar,Precio),
    lugar(Lugar,_,Visitantes,_),
    Recaudacion is Precio * Visitantes.

%% Refactorización de la solución, delegando más, con predicados diferentes,
%% y evitando lógica repetida

recuadacionTotal2(Lugar,Recaudacion):-
        lugar(Lugar,Tipo,Visitantes,Entrada),
        precioUnitario(Tipo,Entrada,Precio),
        Recaudacion is Precio * Visitantes.
    

precioUnitario(Tipo,Entrada,Precio):-
    impuestoPorcentual(Tipo,Porc),
    porcentaje(Entrada,Porc,Precio).

precioUnitario(Tipo,Entrada,Precio):-
    impuestoFijo(Tipo,Adicional),
    Precio is Entrada + Adicional.

precioUnitario(Tipo,Entrada,Precio):-
    impuestoRango(Tipo,Min,Max,Porc),
    between(Min,Max,Entrada),
    porcentaje(Entrada,Porc,Precio).

precioUnitario(Tipo,Entrada,Entrada):-
    impuestoRango(Tipo,Min,Max,_),
    not(between(Min,Max,Entrada)). 

porcentaje(Base,Porc,Total):-
    Total is Base * (1 + Porc) / 100.