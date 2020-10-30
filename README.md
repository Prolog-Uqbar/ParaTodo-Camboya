# ¡Asia! allá vamos

![](camboya.png)

**¿Saben qué se conmemora en esta fecha? Ni más ni menos que el día nacional de Camboya. Sí, ese lejano país asiático que no clasifica para mundiales, no es destino top de turismo ni fue escenario -al menos en los últimos años- de ninguna guerra de interés para la potencias mundiales. Sin embargo, existe y millones de camboyanos consideran que es un lugar maravilloso y único.**

Tenemos información sobre los lugares típicos de este país, por ejemplo, el Templo de Angkor, el río Mekong, Nom pen que es su ciudad capital. Se conocen muchos otros templos, más ríos y ciudades, y puede haber otros tipos de lugares como museos, montañas, etc. Asumimos que los nombres de lugares son únicos. Si mekong es el nombre del río, no puede haber una ciudad u otro sitio de igual nombre.  
De cada uno de ellos se conoce además la cantidad de visitantes en el último año, y el costo de la entrada (que puede ser 0 en algunos lugares)

Elegir la forma de modelar la información, incluyendo algunos datos de ejemplo, desarrollar los predicados necesarios para resolver lo pedido y mostrar un par de casos de cómo utilizarlos, con la correspondiente respuesta. 

### Lugares más visitados

Se quiere averiguar cuál es el lugar más visitado de camboya, dentro de su tipo, en el último año (no preocuparse por si hay "empate" en la máxima cantidad). Por ejemplo, el templo más visitado, la ciudad más visitada, etc. 

Explicar la utilidad del concepto de inversibilidad para resolver el problema planteado.

### Impuestos y recaudación

El gobierno de camboya incorpora impuestos según el tipo de lugar. Para ello se agrega a la base de conocimiento la siguiente información.

~~~prolog
impuestoPorcentual(templo, 10). % Se incrementa en dicho porcentaje el precio de la entrada.
impuestoFijo(montania, 100). %Se suma el cargo fijo al precio de la entrada 
impuestoRango(museo, 100,200,5). %Se incrementa un 5% a las entradas a museos que cuestan entre 100 y 200, el resto queda igual.
~~~

Las ciudades no tienen impuestos, por lo que su costo es el original. 
1. Averiguar cuánto cuesta entrar a un lugar, considerando los impuestos. 
2. Averigar la recaudación total de cada lugar teniendo en cuenta la cantidad de visitantes.

