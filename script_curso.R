################################################################################
################################################################################
################################################################################
################################################################################
################################################################################

####################       MI PRIMER SCRIPT                 ####################

################################################################################
################################################################################
################################################################################
################################################################################

# R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"

ls() # nos da los nombres de los objetos creados o importados

# Creacion de objetos

# 1. vector o variable

x <- c(1,2,3,3,4)
y <- c("a","1","r","4")
z <- c(TRUE,FALSE,TRUE)

variable<-c("TRUE","FALSE") # Este vector es de tipo caracter           


# 2. data.frame

tabla <- data.frame(ID = c("gen0", "genB","genZ"),
                    subj1 = c(10,25,33), 
                    subj2 = c(NA, 34,15), 
                    oncogen = c(TRUE, TRUE,FALSE),
                    loc = c(1,30,125))

tabla2 <- data.frame(ID = c("gen1", "gen2","gen3"),
           subj1 = c(14,26,37))


# Borrar objetos creados o importados

ls()

rm(tabla2,x)

ls()

rm(list=ls()) # borar todos los objetos del workspace


# Atributos

# Vectores:
class(x) 
length(x)

x <- c(1,2,3,3,4)

x_char <- as.character(x)

y <- c("a","1","r","4")
class(y)
y_num<-as.numeric(y)
class(y_num)
y_num

# Data.frame:
class(tabla)
dim(tabla) # numero de filas y numero de columnas
str(tabla) # cuidado con bases de datos muy grandes 


# instalar paquete en R

install.packages("foreign")
install.packages("openxlsx")


# cargar paquete en R para que las funciones y ayuda esten disponibles

library("foreign")
library("openxlsx")

#Mostrar información de la versión de R y de los paquetes instalados
SessionInfo()

#Insertar en mi script la información de las versiones utilizadas
#R version 4.1.0 (2021-05-18)
# openxlsx_4.2.5.2 foreign_0.8-84

#Cuidado al cargar varios paquetes que puedan tener el mismo nombre de funcion
#Ejemplo read.xlsx del paquete xlsx y openxlsx
install.packages("xlsx")
library("xlsx")

#Fuerzo a R a utilizar la funcion del paquete que yo quiera
xlsx::read.xlsx()
openxlsx::read.xlsx()


datos2 <- data.frame(id = c(x), nombre= c(y), id_12= c(z))
datos2 <- data.frame(x = x, y= y,z= z)

ls("package:openxlsx")
ls("package:xlsx")

########################
# Cargar un workspace
########################

ls()

rm(list=ls())

ls()

# Cargar el workspace que me ha dicho Pablo

getwd()

setwd("/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/")

getwd()

load("datos.curso1.RData")

ls()

class(datos)
dim(datos)
str(datos)


# Variable sexo

# datos [ FILAS  , COLUMNAS  ]


 
datos [  c(1,2) ,    ]

datos [  c(1:5)  , c(1:2)   ]

vector <- c(1,2)
datos [ vector ,    ]

datos$"sexo"
datos[     ,  c(3)   ]
datos[   , c("sexo") ]

variables <- c("ID","sexo","edad")
datos[   , variables ]
datos_nuevos <- datos[   , variables ]

# Seleccion de registros (filas) concretas

class(datos$sexo)
table(datos$"sexo",exclude=NULL)

criterio <- datos$"sexo"=="Mujer"
#datos[ , c(3)]
#datos[,c("sexo")]
#datos$"sexo"
datos_mujeres1 <- datos[ criterio ,  ]

datos_mujeres2<- datos[ datos$"sexo"=="Mujer" ,     ]

datos_mujeres3<- datos[ datos[,c("sexo")]=="Mujer" ,  ] # version extra-matricial



criterio2 <- datos$"sexo"=="Mujer"   & datos$"estado.civil"=="Casado" 

criterio3<-  datos$"sexo"%in%"Mujer" & datos$"estado.civil"%in%"Casado"  
# EL %in% es recomendable cuando las variables que utilizo para el criterio de seleccion
# tienen missing values.

criterio4 <- datos$"sexo"=="Mujer" | datos$"estado.civil"=="Casado" 


datos_mujeres_crit2 <- datos[ criterio2 ,  ]
datos_mujeres_crit3 <- datos[ criterio3 ,  ]
datos_mujeres_crit4 <- datos[ criterio4 ,  ]

datos_exportar <- datos_mujeres_crit2[  , c("edad","peso","ID") ]

datos[1:6,1:6]
datos$sexo[c(1,3,6)] <- NA
datos[1:6,1:6]

criterio_con_missing<- datos$"sexo"=="Mujer"   & datos$"estado.civil"=="Casado" 

datos[ criterio_con_missing ,  ]

criterio_sin_missing<- datos$"sexo"%in%"Mujer"   & datos$"estado.civil"%in%"Casado" 
datos[ criterio_sin_missing ,  ]


# Recodificaciones

datos.new <- datos

datos.new[c(1:6) , c(1:6)]

datos.new[c(2) , c(3)]
# datos.new[c(2) , c("sexo")] 

datos.new[c(2) , c(3)] <- c("Hombre")
datos.new[c(2,4,5,6) , c(3)] <- c("Hombre","Mujer","no se","no se")
datos.new[c(2,4,5,6) , c(3)] <- "DIOS MIO DE MI VIDA"


datos.new$"sexo"[2]
datos.new$"sexo"[2] <- "Hombre"
datos.new$"sexo"[c(2,4,5,6)]<-"DIOS MIO DE MI VIDA"


criterio_id <- datos.new$"ID"==c(200)
datos.new[criterio_id ,  ]

datos.new[criterio_id , "estado.civil" ] <- "NO LO SE"


criterio_id<-datos.new$"ID"%in%c(200,30)


# Fumadores y de edad >=40 del objeto datos
table(datos$"fumador",exclude=NULL)
table(datos$edad,exclude=NULL)
class(datos$"fumador")
class(datos$edad)

criterio <- datos$"fumador"%in%"Si" & datos$"edad">=40

datos_filtrado <- datos[criterio ,  ]

mean(datos$"edad")
mean(datos[,c("edad")])
quantile(datos$"edad")

dim(datos_filtrado)
table(datos_filtrado$"fumador",exclude=NULL)
range(datos_filtrado$edad)

# Eliminar registros o variables

# 1.Acceso a elementos
datos[-c(1,2,3),]

# 2. Que hago con esto

# a. Creo una nueva base de datow
datos_2 <- datos[-c(1,2,3),]

# b. Machacamos la original
datos <- datos[-c(1,2,3),]

datos <- datos[,-c(4,5)]

datos_nuevos<-datos[c(4:200),c(3:6)]

# Crear una variale nueva

datos$"pablo" <- 1

datos$"sexo_new" <- NA
head(datos)
criterio<-datos$"sexo"=="Mujer"
datos$"sexo_new"[criterio]<-"M"
datos[criterio ,"sexo_new"]<-"M"

criterio<-datos$"sexo"=="Hombre"
datos$"sexo_new"[criterio]<-"H"

datos[,c("sexo","sexo_new")]

#Importacion
?read.table

#Miramos los argumentos que queramos cambiar
tabla_1 <- read.table(file="/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.txt", header = TRUE, sep= "\t")

#Visualizar tabla 6 primeros registros
head(tabla_1)

#Visualizar tabla 6 primeros registros
head(tabla_1,12)


tabla_2 <- read.table(file="/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.modificado.txt", skip= 2,
                      header = TRUE, sep= "\t", stringsAsFactors = FALSE)


tabla_3 <- read.table(file="/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.csv", sep=";", header = TRUE)

#install.packages("openxlsx")
library("openxlsx")
tabla_xlsx <- openxlsx::read.xlsx(xlsxFile ="/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.xlsx", sheet=1)







  
  








