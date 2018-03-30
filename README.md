# Globant Converge 2018
## Workshop "Maximizando el ROI de los datos mediante Imputación de valores perdidos con Ensamble Learning"
### Germán Rosati

### Presentación
El presente workshop fue realizado por primera vez el 22 de Marzo de 2018 en el contexto del Globant Converge 2018.

La generación de datos es una operación que requiere elevadas inversiones de dinero, tiempo y trabajo. Un problema habitual es la existencia de "datos perdidos", es decir, datos que carecen de información en alguna de las variables. Dichos datos pueden convertirse en inutilizables. 

Este taller tiene como objetivo introducir algunas técnicas de imputación de datos perdidos. La imputación consiste en la operación que reemplaza los datos perdidos por algún valor estimado en base a los datos completos. Particularmente, veremos cómo potenciar las posibilidades de tratar dichos datos con algunas técnicas de Machine Learning y extraer el máximo valor posible de los datos generados.

### Materiales
En este repositorio se encontrará la presentación utilizada en el evento y materiales de para replicar el ejercicio realizado en lenguaje R. En el mismo se evalúa la performance de un modelo simple de imputación (Hot Deck) y la de uno de los modelos de Ensamble Learning más simples: Random Forest. 

Se muestra que sin un proceso demasiado exhaustivo de tunning de los hiperparámetros del Random Forest muestra una performance notablemente superior a Hot Deck.

Se dispone del siguiente material de replicación:

* `code_imputation.R` código para replicar
* `data_eph.csv` dataset proveniente de la Encuesta Permanente de Hogares (2do. semestre de 2015)
* `WS_code_imputation.RData` Workspace con los modelos pre-entrenados.

### Dependencias
Para correr el código será necesario tener instaladas las siguientes librerías de R

* caret
* randomForest
* ranger
