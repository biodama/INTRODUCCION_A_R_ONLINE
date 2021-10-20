
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



load("/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.RData")

load("C:\\Users\\pfernandezn\\Desktop\\datos\\datos.curso1.RData")

rm(list=ls())
gc()


load("C:\\Users\\beatriz.cano\\Desktop\\Curso R\\datos\\datos.curso1.RData")

load("C:\\Users\\Celmira Laza\\Dropbox\\CURSO EPIDEMIOLOGIA\\datos\\datos.curso1.RData")

load("C:\\Users\\beatriz.cano\\Desktop\\Curso R\\datos\\datos\\datos.curso1.RData") 

datos$"sexo"

# Posiciones
datos[   ,  c(3)  ]  # quiero ver la columna correspondiente al sexo

datos[   ,   ]

datos[  c(4)  , c(4)    ]
# Recodificacion
datos[  4  , 4  ] <- "MI PRIMER RECOD"

# Condiciones
datos[ datos$"sexo"=="Mujer"  ,       ]


datos[ FILAS  , COLUMNAS  ]


datos[c(1:10)   ,      ]

datos[ c(5,76,2,4)  ,  ]

# CREACION DE SUB-BASES DE DATOS

datos[ datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado" ,       ]

datos[ datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado" ,   c(3,2)  ]

datos_peticion<- datos[ datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado" & datos$"edad">15 & datos$"edad"<70,       ]

datos_muestra <- datos[ datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado" ,   c(3,2)  ]



# Sustituir el valor de “Hombre” por “Mujer” en la variable Sexo

head(datos)
datos[datos$"sexo"=="Hombre" ,  3  ] <- "Mujer"
head(datos)


datos$"sexo"[datos$"sexo"=="Hombre"] <- "Mujer" 


# El ID ==23 su estado civil es "Casado"

datos[datos$"ID"==23, c(4) ] <- "Casado"

table(datos$"estado.civil",exclude=NULL) # conocer los valores de una variable caracter
unique(datos$"estado.civil") # conocer los valores de una variable caracter


# Sustituir el valor “Bajo” en la variable nivel.estudios por el valor de “Escuela”

table(datos$"nivel.estudios")

datos[datos$"nivel.estudios"=="Bajo" ,  5  ] <- "Escuela"

table(datos$"nivel.estudios")

datos$"nivel.estudios"[datos$"nivel.estudios"=="Bajo"] <- "Escuela"

# Compruebo el numero de missing de una variable

sum(is.na(datos$"nivel.estudios")) 

which(is.na(datos$"nivel.estudios")) # Posiciones que ocupan los missing

# Recodifico los valores missing con "es un Missing"

datos[is.na(datos$"nivel.estudios"),  5  ] <- "es un Missing"

datos[which(is.na(datos$"nivel.estudios")),  5  ] <- "es un Missing"

datos$"nivel.estudios"[is.na(datos$"nivel.estudios")]<-"es un Missing"


# Sustituir los valores missing en la variable edad por el valor de 30

datos[is.na(datos$"edad"),  2  ] <- 30

datos$"edad"[is.na(datos$"edad")]<- 30


# Crear una variable nueva

head(datos)

datos$"nivel.estudios.new" <- datos$"nivel.estudios"

datos$"nivel.estudios.new" <- NA

head(datos)


# 3.1. Crea una variable dentro los datos del estudio llamada “nivel.estudios.new” que tenga dos posibles valores: Alto (cuando la variable nivel.estudios toma valores de “Alto”) y Bajo (cuando la variable nivel.estudios toma los valores de Medio o Escuela)

datos$"nivel.estudios.new" <- NA

datos$"nivel.estudios.new"[datos$"nivel.estudios"=="Alto"] <- "Alto"

datos$"nivel.estudios.new"[datos$"nivel.estudios"=="Medio"] <- "Bajo"

datos$"nivel.estudios.new"[datos$"nivel.estudios"=="Escuela"] <- "Bajo"

table(datos$"nivel.estudios.new")

table(datos$"nivel.estudios")

# notacion matricial

datos$"nivel.estudios.new" <- NA

datos[datos$"nivel.estudios"=="Alto"  , 12] <- "Alto"

datos[datos$"nivel.estudios"=="Medio" , 12] <- "Bajo"

datos[datos$"nivel.estudios"=="Escuela" , 12] <- "Bajo"

table(datos$"nivel.estudios.new")

table(datos$"nivel.estudios")


# OPERACIONES ARITMETICAS


datos$"edad.new"<-datos$"edad"+2

datos$"edad.new2"<-sqrt(datos$"edad") / 2



# Ratio entre peso y altura al cuadrado

datos$"IMC"<- c(datos$"peso") /  c(datos$"altura"/100)^2


4. Identificar cuales de los siguientes identificadores de registro están en la base 
de datos del estudio: 35,111,43,55,23,76,75,99 (1 punto)

# Busquedas de mas de un valor concreto

datos[datos$"ID"%in%c(35,111,43,55,23,76,75,99),]

# otra manera
id_buscar<-sort(c(35,111,43,55,23,76,75,99))
id_buscar
datos[datos$"ID"%in%id_buscar,]

# otra manera
datos[datos$"ID"%in%sort(c(35,111,43,55,23,76,75,99)),]


##############################
# Ordenar una base de datos
##############################

sort(c(4,6,1,45,43))
sort(datos$"ID")

?order

datos_ordenados <- datos[order(datos$"ID",decreasing = TRUE) , ]

datos_ordenados <- datos[order(datos$"ID",datos$"altura") , ]


#6. Ordena la base de datos del estudio de forma descendente atendiendo primero 
#a la variable “altura” y después a la variable “estado.civil”. (1 punto)

datos_ordenados <- datos[order(datos$"altura",datos$"estado.civil"), ]

datos_ordenados <- datos[order(datos$"altura",datos$"estado.civil",decreasing = TRUE), ]

datos_ordenados <- datos[order(datos$"estado.civil",datos$"altura",decreasing = TRUE), ]


datos_ordenados<-datos[order(datos$"altura",decreasing = FALSE) , ]
datos_ordenados<-datos_ordenados[order(datos_ordenados$"estado.civil",decreasing = TRUE) , ]

tail(datos)
tail(datos_ordenados)

# 7.Crear una base de datos llamada “datos_peticion” que contenga sólo aquellos registros con un nivel de estudios “Bajo” atendiendo a la variable creada anteriormente llamada “nivel.estudios.new”. (1 punto)

# datos[datos$"nivel.estudios.new"=="Bajo" , ]

table(datos$"nivel.estudios")

datos$"nivel.estudios"[datos$"nivel.estudios"=="Bajo"] <- "Escuela"

datos$"nivel.estudios.new" <- NA
datos$"nivel.estudios.new"[datos$"nivel.estudios"=="Alto"] <- "Alto"
datos$"nivel.estudios.new"[datos$"nivel.estudios"=="Medio"] <- "Bajo"
datos$"nivel.estudios.new"[datos$"nivel.estudios"=="Escuela"] <- "Bajo"

datos_peticion <- datos[datos$"nivel.estudios.new"=="Bajo" , ]

table(datos$"nivel.estudios.new")

dim(datos_peticion)


# 8.Exporta la base de datos llamada “datos_peticion” en formato de R y en formato de excel con el nombre base_depurada. (1 punto)

# PARA GUARDAR WORKSPACE
save(datos_peticion,file="/Users/pfernandezn/Desktop/base_depurada.RData")

save(datos_peticion,file="C:\\Users\\beatriz.cano\\Desktop\\base_depurada.RData")

save(datos_peticion,id_buscar,file="/Users/pfernandezn/Desktop/base_depurada.RData")

# PARA GUARDAR TODOS LOS OBJETOS QUE HAY EN EL WORKSPACE
save.image("/Users/pfernandezn/Desktop/base_depurada.RData")


# load("/Users/pfernandezn/Desktop/base_depurada.RData")

rm(datos)
gc()

# EXCEL

library("openxlsx")

setwd("/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/")

datos_estudio <- read.xlsx(xlsxFile="datos.estudio.xlsx",sheet=1)



# Exportar en formato xlsx

library("openxlsx")
write.xlsx(datos_peticion,file="/Users/pfernandezn/Desktop/base_depurada.xlsx")


library("xlsx")
write.xlsx(datos_peticion,file="/Users/pfernandezn/Desktop/base_depurada.xlsx")
 


























