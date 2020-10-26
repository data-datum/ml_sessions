# Machine learning y moléculas

### Tutorial de 2hs durante la RIIAA 2020
### Expone: Benjamín Sanchez-Langeling

#### Link: https://bit.ly/ml-moleculas

#### Link de Google Colab: https://github.com/beangoben/ML_DL_con_moleculas 

## Objetivo del tutorial
Entender el estado del arte de ML en moleculas. Pero nos enfocamos en prediccion de propiedades químicas. Lo vamos a conectar con todos los demás problemas, mediante la REPRESENTACIÓN MOLECULAR. 

**¿Cómo podemos representar una molécula de tal forma que podamos obtener información que querramos de esa molécula?**

También podemos pensar en materiales, proteínas, etc. 

Algo que pasa en ML con moléculas es que si hago una predicción después la puedo medir en un laboratorio, es decir, si una GAN (red generativa adversarial) de moléculas, podemos usar esa molécula en el mundo material. Es un generador de ideas, y eso es valioso.

## Situación química y contexto

Un problema de la quimica es el **diseño inverso.** 


Imaginémonos que queremos digitalizar el olor, esto significa que buscamos q un dispositivo electrónico pueda detectar un determinado olor-aroma. El olor es un sentido químico.
 
La vainillina es muy cara, concentrándose su producción en Madagascar. 

Para ello **debemos pensar en la funcionalidad que queremos replicar.** Es decir, vamos a tener unos rótulos (o labels) como ser: vainillina, dulce, chocolatoso, etc. 

Nuestro objetivo va a ser buscar moléculas similares que tengan ese mismo olor, en otras palabras vamos a buscar moléculas que se correspondan a ese conjunto de rótulos. 
Como restricciones podemos mencionar, que deseamos que nuestra molécula no sea tóxica. 

Vamos a buscar un modelo que nos pueda producir esas etiquetas, y que nos puedan predecir. 

Muchas veces tenemos moléculas de origen natural, por ejemplo, una planta, y queremos llegar a otra molécula (de síntesis), ese es otro problema de ML, en la cual queremos llegar al producto deseado con el mínimo numero de pasos. Eso lo podemos extrapolar a baterias, farmacos, etc. 
**Esto es diseño inverso.** 

Tenemos un espacio funcional, de propiedades q nos interesan y tenemos moleculas en 1 lado y queremos llegar a la molecula menos toxica, la menos cara, es decir, queremos llegar al máximo o al mínimo de este espacio. 

No conocemos ese espacio funcional, la forma de aproximarnos es haciendo experimentos. Ese experimento nos va a dar un punto de este espacio. Lo que podemos proponer es un espacio de moleculas y a partir de ahi, movernos al espacio de funciones, ese es el paso directo. Diseño inverso es a partir del espacio de funciones nos movemos al espacio de moléculas. Partimos de la propiedad y vamos a las moléculas. 


Tenemos un input y tratamos de llevarlo a un vector. Podemos calcular estadisticas y hacer feature engineering. Tomo mis representaciones y hago ML. Lo que ha cambiado ahora con deep learning, que en vez de traajar en esa represntacion, tenemos una serie de maquinaria q nos permite crear represntaciones q estan ajustadas a los datos. Lo neuvo de deep learning es trabajar con redes neuronales (RN), las podemos pensar en RN como operaciones parametrizables y optimizables. Son operaciones q les ponemos en pie y les damos datos estan procesando los datos.  Optimizable quiere decir q los podemos ir mejorando a medida q le damos mas y mas datos. Esto va a crear una nueva representación de las moléculas ajustada a nuestros datos. 
Al final tenemos un modelo lineal, la unica diferencia es que ahora tenemos un PIPELINE (serie de operaciones concatenadas) que nos produce representacion vectorizada q se ajusta a nuestros datos. 
Lo que si ahora vamos a necesitar mas datos porque hacemos menos asunciones sobre el problema, por ende, necesitamos mas datos, para generalizar mejor. 

Lo que ha cambiado es el **cómputo barato**, **código libre** (frameworks más amigables). 

### ¿Cuántos datos se necesitan mínimo?
Eso depende del contexto y del problema. No hay una fórmula, es todo empírico. No hay teoremas o bounds. Una forma de pensarlo es algebra lineal + datos. Las algoritmos si tienen teoremas pero los datos no. Siempre que más tengamos va a ser mejor. 
Si tenemos menos de 1000 datos, hacemos ML con random forest o procesos gausianos. Son buenos, super rapidos y te dan una idea de donde estas parado. 

#### ¿Puede automatizar la seleccion de features?

Sí, la idea es que con deep learning eso es automático. 
Entre mejores datos tengamos de input, mejor van a ser las predicciones. 

#### ¿De qué naturaleza son los datos?

Son de cualquier tipo q sean medibles en el mundo natural. Pueden ser propiedades fisico-quimicas, todo lo q se pueda relacionar con la estructura química. Incluso datos que son más cuanticos, también pueden usarse. 
Los inputs también pueden ser simulaciones computacionales. 






 
