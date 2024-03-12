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











 










