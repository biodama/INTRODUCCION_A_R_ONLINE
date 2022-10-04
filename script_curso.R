

install.packages("openxlsx")


####################################################
##    CREACION DE UN DATA.FRAME
####################################################

rm(list=ls())

# Datos del analisis

dades <- data.frame(ID=c("gen0", "genB","genZ"),
                    subj1 = c(10, 25, 33), 
                    subj2 =c(NA, 34, 15), 
                    oncogen = c(TRUE, TRUE,FALSE),
                    loc = c(1,30, 125))

# me cuesta entender esto

datos.estudio <- c(1,2,3)

datos.estudio2 <- c("A", "B", "C")

datos.estudio <- c(1,2,3);datos.estudio2 <- c("A", "B", "C")

# Analisis 1


datos.estudio2 <- c("A", "B", "C","B", 
                    "C","B", "C","B", "C","B", "C","B", 
                    "C","B", "C","B", "C","B", "C","B", 
                    "C","B", "C")

# Borramos todo, no quiero ser un cochino

rm(list=ls())


# GRAFICO

peso <- c(10,15,66,33)
altura <- c(145,150,177,160)

par(mfrow=c(1,2))

plot(x=altura,y=peso)

plot(x=altura,y=peso,main="Peso vs Altura",xlab="ALTURA",ylab="PESO")

# recordatorio sobre packages adicionales

# install.packages("openxlsx")
library("openxlsx")

# install.packages("acc")
library("acc")

###########################################################
##################### PROYECTO 1 ##########################
###########################################################

rm(list=ls())


# Establezco el directorio de trabajo

setwd("/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/INTRODUCCION_A_R_ONLINE-main/datos/proyecto1/datos")


load("datos.curso1.RData")


datos$sexo

datos$"sexo"

datos_selec <- datos [c(33,10,100), c(3,1,2) ]

table(datos$"sexo",exclude=NULL)
unique(datos$"sexo")

# Una manera
datos_mujeres <- datos [datos$"sexo"=="Mujer", ]

# Otra manera
criterio <- datos$"sexo"=="Mujer"
class(criterio)
length(criterio)
datos_mujeres <- datos [criterio ,  ]

# Criterio multiple
table(datos$"estado.civil",exclude=NULL)
criterio2 <- datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado"
datos_mujeres_casadas <- datos [criterio2 , ]


# RECODIFICACIONES 

datos[datos$"ID"==200 , "sexo" ] <- "NO LO SE"


# Creamos una variable nueva de edad (cod_edad)

datos$"cod_edad"<-NA

criterio_edad1 <- datos$edad>=50
table(criterio_edad1)

datos[criterio_edad1,"cod_edad"]<-"mayores"

criterio_edad2 <- datos$edad<50
table(criterio_edad2)

datos[criterio_edad2,"cod_edad"]<-"menores"

table(datos$cod_edad)

#datos$"cod_edad"[criterio_edad1]<-"mayores"
#datos$"cod_edad"[criterio_edad2]<-"menores"



datos.new2[datos.new2$"ID"==200 , "sexo" ]
datos.new2[datos.new2$"ID"==200 , 3 ]
datos.new2[datos.new2$"ID"==200 , c(3) ]



datos.new2[datos.new2$"ID"==200 , sexo ]




<-"Mujer"





#setwd("C:/Users/patricia.garciar/xxxxxxxxx")


library("openxlsx")

datos<-read.xlsx("datos.curso1.xlsx",sheet=1)



datos2<-read.table("datos.curso1.txt",sep="\t",header=T)

# Establezco el directorio de trabajo

setwd("/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/INTRODUCCION_A_R_ONLINE-main/datos/proyecto1/results")

