#####################################################
############# WORKSHOP MISSING DATA #################
#############     CONVERGE 2018     #################
#####################################################

#Modificar al path correspondiente
setwd('/media/grosati/Elements/PEN/KINGSTON/Digital House/Charla Contenidos/Converge 2018/Workshop Converge//')

data<-read.csv('data_eph.csv', sep=";")

library(caret)
library(HotDeckImputation)

# Hacemos la partición de los datos en Train y Test
set.seed(998)
inTraining <- createDataPartition(data$p21, p = .75, list = FALSE)
training <- data[ inTraining,]
testing  <- data[-inTraining,]


# Seteamos el esquema de remuestreo para el entrenamiento
fitControl <- trainControl(## 3-fold CV
        method = "cv",
        number = 3,
        #repeats = 1,
        verboseIter = TRUE )

# Generamos el tunning grid para los hiperparámetros
rfGrid <- expand.grid(mtry = seq(1,26,3),
                      splitrule = "variance",
                      #n.trees = (0.5:15)*50,
                      min.node.size = c(50, 100, 200, 500))

# Entrenamos el modelo
set.seed(825)
t0<-proc.time()
rfFit <- train(p21 ~ ., data = training, 
                 method = "ranger", 
                 trControl = fitControl, 
                 tuneGrid = rfGrid)
proc.time() - t0


# Entrenamos una imputación rápida con HotDeck
data2 <- data
data2$p21[-inTraining]<-NA
q<-impute.SEQ_HD(data.matrix(data2))

q2<-impute.CPS_SEQ_HD(DATA=data.matrix(data2),
                     covariates=c(1:17,19:27),
                     initialvalues=0, 
                     navalues=NA, 
                     modifyinplace = TRUE)



## Comparación de resultados


preds <- predict(rfFit, testing)
preds_hd = q[-inTraining,18]
preds_hd2 = q2[-inTraining,18]

paste('RMSE RF', as.character(sqrt(mean((testing$p21 - preds)**2))),sep="=")
paste('RMSE HD1', as.character(sqrt(mean((testing$p21 - preds_hd)**2))),sep="=")
paste('RMSE HD2', as.character(sqrt(mean((testing$p21 - preds_hd2)**2))),sep="=")
