

####################################
####################################
###  Mi primer script de R       ###
####################################
####################################

# Packages


# install.packages("openxlsx") # instalar

library("openxlsx") # cargar 

?read.xlsx

# Otras cosas de paquetes

require() # lo mismo que library

ls("package:openxlsx")

sessionInfo()


########################################

# Inicio de sesion

rm(list=ls()) # para borrar todo
gc()

rm(list=ls());gc() # otra forma


library("openxlsx")
library("readstata13")
library("accumulate")

ls()  # listar objetos creados/cargados


# Creacion objetos

x <- c(7,10,3)

z <- c(TRUE,FALSE,TRUE)
z_esp<-c("TRUE","FALSE","TRUE")

y <- c("Low","Low","Medium","High")
y_esp<-c(2,1,"Medium")

y_esp<-c(2,2)

Y_esp<-c(4,6,7)

matrix1 <- matrix(c(10,6,23,44),ncol=2)

"y_esp"%in%ls()
"matrix1"%in%ls()

mi_data_frame <- data.frame(ID=c("gen0",
"genB","genZ","genA"),
subj1 = c(10, 25, 33,NA), 
subj2 = c(NA, 34, 15,NA), 
oncogen = c(TRUE, TRUE,FALSE,NA),
loc = c(1,30,125,NA),
chr = c("X","4","6",NA))



#############################
# Importar base de datos
#############################

# Miro cual es el directorio de trabajo
getwd() 

# cambio el directorio de trabajo
setwd("/Users/pfernandezn/Desktop/datos") 


# read.table
datos1 <- read.table(
file="datos.curso1.txt",
header=TRUE,
sep="\t", # otros separadores: ";", "[.]",",", " ", "	"
stringsAsFactors=FALSE)


# read.xlsx
library("xlsx")
library("openxlsx")
datos2<-read.xlsx("datos.curso1.xlsx",sheet=1)
datos2 <- openxlsx::read.xlsx("datos.curso1.xlsx",sheet=1)


# Cargar workspace
load("datos.curso1.RData")


# Cargar datos incluidos en paquetes
library("ISwR")
data("bcmort")
?bcmort # Breast cancer mortality

library("maptools")
data("wrld_simpl")
?wrld_simpl # Simplified world country polygons
plot(wrld_simpl)

####  ####  ####  ####  #### 
# Remove objects

rm(x,y)

####  ####  ####  ####  #### 


################################################
# Atributos
################################################

ls()

rm(z,z_exp)

#rm(list=ls())

class(datos1) # que tipo de objeto eres
class(z)

dim(datos1) # data_frame (numero de filas y columnas)
length(z)   # vector (numero de elementos)

str(datos1) # data_frame (resumen de estructura)

names(datos1) # data_frame (nombres de las variables)

is.numeric(z) # eres vector numerico
is.character(z)
is.data.frame(datos1)

x <- c(1,2,"a")
x_new <- as.numeric(x)
x_new2 <- as.character(x)

x<-c(1,2,"3")
x_new <- as.numeric(x)

x<-c("Alto","Bajo","Alto")
x_new<-as.factor(x)

# Graficos basicos

plot(x=c(4,2,6,1,6),y=c(10,63,214,545,53))

# Funciones

mi_funcion <- function(entrada){
	
	salida<-as.character(entrada)
	
	salida
}

resultado <- mi_funcion(entrada=c(3,2,5,"f"))


########################################
########################################
########################################
#             DATA.FRAME               #
########################################
########################################
########################################

rm(list=ls());gc() 

# Librerias


getwd() 

setwd("/Users/pfernandezn/Desktop/datos")

load("datos.curso1.RData") 

ls()

class(datos)

dim(datos)

str(datos)
names(datos)

"cancer_colon"%in%names(datos)


# Variable sexo

# datos [ FILAS  , COLUMNAS  ]

datos [  c(1:2)  ,    ]

datos [  c(1:5)  , c(1:2)   ]

datos$"sexo"
datos[ , c(3)]

datos$"sexo"[c(1,2,3,4,5,6,7,8,9,10)]
datos[c(1,2,3,4,5,6,7,8,9,10) , c(3)]

c(1,2,3,4,5)
c(1:5)

datos$"sexo"[c(1:10)]
datos[c(1:10) , c(3)]

datos$"sexo"[1:10]
datos[1:10 , 3]


table(datos$"sexo",exclude=NULL)

criterio <- datos$"sexo"=="Mujer"
datos[ criterio ,  ]

datos[ datos$"sexo"=="Mujer" ,  ]


criterio2 <- datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado" 
criterio2_esp<-datos$"sexo"%in%"Mujer" & datos$"estado.civil"%in%"Casado"

criterio3 <- datos$"sexo"=="Mujer" | datos$"estado.civil"=="Casado" 


# Recodificaciones y sub-bases de datos

datos.new<-datos

datos.new$"sexo"[2] <- "Hombre"
datos.new[2 , 3] <- "Mujer"
datos.new$"sexo"[2]

criterio4<-datos.new$"ID"%in%200
datos.new[criterio4 ,  ]
datos.new[criterio4 , 3 ]<-"Mujer"

# Fumadores y de edad >=40
table(datos$"fumador",exclude=NULL)
table(datos$edad,exclude=NULL)
class(datos$"fumador")
class(datos$edad)

criterio5<-datos$"fumador"%in%"Si" & datos$"edad">=40
datos_filtrado <- datos[criterio5 ,  ]

dim(datos_filtrado)
table(datos_filtrado$"fumador",exclude=NULL)
range(datos_filtrado$edad)

# Anadir variables

datos$"edad_new" <- datos$"edad"+1

datos [c(1:10), c(2,12)]
datos [c(1:10), c("edad","edad_new")]

# Quitar variables

#datos <- datos[ , -c(12)]
datos$"edad_new"<-NULL

# Quitar registros

datos<-datos[-c(7,9,20),  ]


# Visualizacion data.frame

str(datos)

# fix(datos)

head(datos,n=6) 

tail(datos,n=6)


datos[ c(1:10) , c(1:4) ]

########################################

my.data.frame <- data.frame(ID = c("paciente1", "paciente2","paciente3"),
edad= c(10, 25, 33), altura = c(NA, 150, 180),
cancer = c(TRUE, TRUE, FALSE),
bmi = c(22,25, 20),stringsAsFactors=FALSE)


# a. Sustituye el valor missing de la variable altura por el valor 192

my.data.frame_new<-my.data.frame

# NO SE PUEDE HACER criterio1<- my.data.frame_new$"altura"==NA

my.data.frame_new[ c(1) , c(3) ] <- 192


#b. Crea otro data frame con el nombre de my.data.frame.new que 
#contenga los registros cuya
#altura sea superior a 160.

my.data.frame_new <- my.data.frame_new[ my.data.frame_new$"altura">160  ,   ]
my.data.frame_new


# c. Crea una variable nueva en my.data.frame llamada “ratio” que sea igual a altura/bmi

my.data.frame$"ratio" <- my.data.frame$"altura" / my.data.frame$"bmi"
my.data.frame

