
# MI PRIMER SCRIPT

rm(list=ls())
gc()


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

x<-c("a","b","c")

datos<-data.frame(ID=c(23,45,65),peso=c(50,55,100))

mi.lista <- list(datos,x) # una lista que quiero

ls()

# Salvo todos los objetos en formato R (formato mac o linux)
save.image("/Users/pfernandezn/Desktop/mi_workspace1.RData")

# Salvo todos los objetos en formato R (formato windows)
save.image("C:\\Users\\pfernandezn\\Desktop\\mi_workspace1.RData")

# Salvo algunos objetos en formato R (formato mac) Ruta relativa al modificar el setwd
save(x,mi.list,file="mi_workspace2.RData")

##############
# ATRIBUTOS
##############

# Vectores (variables)

x<-c("a","b","c")

length(x) # numero de elementos
class(x)  # tipo de variable (numerica, caracter...)
is.character(x) # check(TRUE o FALSE) de si la variable es caracter
is.numeric(x) # check(TRUE o FALSE) de si la variable es numerica

y<-c("1","2","3")
class(y)
mean(y)
y_new <- as.numeric(y)
class(y_new)

# Data.frame

dim(datos)
str(datos) # Cuidado si la base de datos es muy grande en variables

head(datos)# Cuidado si la base de datos es muy grande en variables
# Por si encontrais este comando: fix(datos)


######################
# Importacion
######################

?read.csv

datos_gabriela <- read.csv(file="/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.csv", header = TRUE,sep=";")

dim(datos_gabriela)
str(datos_gabriela)
head(datos_gabriela)

install.packages("openxlsx")

library("openxlsx")

?read.xlsx  # ver la ayuda de la funcion
datos_excel <- read.xlsx (xlsxFile="/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.xlsx",
  sheet=1)
head(datos_excel)
ls()

# datos.curso1.txt
?read.table
datos1<-read.table(file="datos.curso1.txt", header=TRUE) 

# Stata (.dta)
library("readstata13")
datos_stata <- read.dta13("datos.curso3.dta")
head(datos_stata)

# SPSS (.sav)
library("foreign")
datos_spss <- read.spss("datos.curso2.sav",
to.data.frame=TRUE)





