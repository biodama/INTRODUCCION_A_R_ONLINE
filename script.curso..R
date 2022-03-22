
# MI PRIMER SCRIPT

rm(list=ls())
gc()


getwd()

setwd("/Users/pfernandezn/Desktop")

getwd()

#R version 4.1.0 (2021-05-18)
#Platform: x86_64-apple-darwin17.0 (64-bit)
#Running under: macOS Catalina 10.15.7


write.xlsx

#packages
install.packages("openxlsx")

#load packages
library("openxlsx")

write.xlsx



ls() # con esto veo los nombres de los objetos que hay en el workspace

x1 <- c(1,2,3,4)

x2 <- c(TRUE,FALSE,TRUE)

x3 <- c("a","b","c")

mis.datos <- data.frame( ID=c("A23","A45","A65"),
peso=c(50,55,100),
fumador=c(TRUE,FALSE,TRUE),
stringsAsFactors=FALSE )


######################
# Importacion
######################


load("~/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.RData")


######################
# Data.frame
######################


# Atributos data.frame

class(datos)
dim(datos)

head(datos)
tail(datos)

str(datos)

variables <- names(datos)
which(variables=="edad") # posicion que ocupa esa variable
which(variables%in%c("edad","peso"))


# Acceso a elementos de un data.frame

datos$"sexo"

datos$sexo

sexo_mirar <- c(datos$"sexo")

sexo_mirar <- datos$"sexo"

class(sexo_mirar)
class(datos$"sexo")


datos[  afecta a FILAS    ,   afectar a COLUMNAS  ]

datos$"sexo"

datos[  ,which(names(datos)==c("sexo")) ]

datos[ , c(3) ]


# Vectores de posicion

datos[  c(40,1,75)   ,  c(3,1,6)  ]

datos[              ,  c(3,6)    ]  

datos[  c(40,1,75)  ,            ]  

variables <- names(datos)
indice <- which(variables%in%c("edad","peso"))
indice
datos[  , indice ]

datos[    ,  which(names(datos)%in%c("edad","peso")) ]


# Vectores logicos (condiciones)

datos[c(datos$"sexo"=="Hombre") & c(datos$"peso">=80) , ]  

datos[c(datos$"sexo"=="Hombre") | c(datos$"peso">=80) , ] 

             

datos[c(datos$"sexo"=="Hombre") & c(datos$"peso">=80) & c(datos$"estado.civil"=="Divorciado") , ]

indice<-c(c(datos$"sexo"=="Hombre") & c(datos$"peso">=80) & c(datos$"estado.civil"=="Divorciado"))

datos[indice,]

datos2 <- datos[indice,]


# Recodificaciones

datos.new <- datos

datos.new[c(1) , c(3)] <- "Hombre"

datos.new$"sexo"[ c(1) ]<- "Hombre"

datos.new$"sexo"[datos.new$"ID"==200]<-"Mujer"

datos.new[ , c(3)] <- "Hombre"

datos.new[datos.new$"ID"==137 , c("sexo") ]<-"Hombre"

datos.new$"sexo" <- "Hombre"


# Anadir variables

datos$"covid" <- "NO"

head(datos)

datos$"covid"[c(datos$"sexo"=="Hombre")] <- "SI" # esta es la que yo haria

datos[ datos$"sexo"=="Hombre"  , c(12)   ] <-"SI"

datos[ datos$"sexo"=="Hombre"  , c("covid")  ] <-"SI"

indice<-which(names(datos)=="covid")
datos[ datos$"sexo"=="Hombre"  , indice  ] <- "SI"


indice1<-which(datos$"sexo"=="Hombre")
indice2<-which(names(datos)=="covid")
datos[ indice1  , indice2  ] <- "SI"


# Eliminar variables o registros

datos_svcovid <- datos[   ,  -c(12)   ]

datos_sin_solteros <- datos[-which(datos$"estado.civil"=="Soltero")  ,   ]

unique(datos$"estado.civil")

datos$"estado.civil"=="Soltero"















