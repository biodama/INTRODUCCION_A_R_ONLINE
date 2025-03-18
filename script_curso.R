
#######################################################
#######################################################
#######################################################
# SCRIPT DEL CURSO
#######################################################
#######################################################
#######################################################




#######################################################
#######################################################
#  AYUDA
#######################################################
#######################################################

# ?

?rnorm


#######################################################
#######################################################
# PAQUETES
#######################################################
#######################################################


# Solo se tiene que hacer una vez en la version de R Software que tenga

install.packages("openxlsx")

# Los paquetes que estan en nuestra version que vienen de install.packages para poder utilizar 
# las funciones de ese paquete necesito siempre cargar el paquete

library("openxlsx")


sessionInfo()


ls("package:openxlsx") # para buscar las funciones en un archibo en local distinto

?read.xlsx


library("openxlsx")
library("xlsx")

openxlsx::read.xlsx
xlsx::read.xlsx


#######################################################
#######################################################
#  WORKSPACE (ESPACIO DE TRABAJO)
#######################################################
#######################################################

rm(list = ls()) # borrar todos los objetos del workspace
gc()  # Ayuda a resetear la memoria cache 

ls() # nos da los nombres de los objetos que hemos cargado (importado) o creado en la session


#######################################################
#######################################################
#  OBJETOS
#######################################################
#######################################################

# Creacion de objetos

# 1. Vector o variable


x <- c(1,2,3,3,4)
y <- c("a","1","r","4")
z <- c(TRUE,FALSE,TRUE)

x2 <- c(1,2,"3",4) # vector de edades


# 2. Data.frame

tabla_pedro <- data.frame(ID = c("gen0", "genB","genZ"),
subj1 = c(10,25,33),
subj2 = c(NA, 34,15),
oncogen = c(TRUE, TRUE,FALSE),
loc = c(1,30,125))

tabla <- data.frame(ID = c("gen0", "genB",NA),
                    subj1 = c(10,25,33), 
                    subj2 = c(NA, 34,15), 
                    oncogen = c(NA, TRUE,FALSE),
                    loc = c(1,30,125))

tabla2 <- data.frame(ID = c("gen1", "gen2","gen3"),
           subj1 = c(14,26,37))

tabla3 <- data.frame(subj1 = c(10,25,33),
					 subj2 = c(NA, 34,15),
					 oncogen = c(TRUE, TRUE,FALSE),
					 loc = c(1,30,125))

ls()

rm(tabla3)
gc()



tabla
tabla2
tabla3


# Comandos variados
# ;

datos.estudio <- c(1,2,3);datos.estudio2<-c("A", "B", "C")


datos.estudio <- c(1,2,3)
datos.estudio2<-c("A", "B", "C")


# Atributos

# Vectores:
class(x)   # tipo de vector
length(x)

x <- c(1,2,3,3,4)
class(x)
x_char <- as.character(x)

y <- c("a","1","r","4")
class(y)
y_num<-as.numeric(y)
class(y_num)
y_num

# Data.frame:
class(tabla)
dim(tabla) # numero de filas (registros) y numero de columnas (variables)
str(tabla) # cuidado con bases de datos muy grandes en variables (>50 variables)


#Importacion txt 
bbdd <- read.table(file="/Users/pfernandezn/Desktop/datos.curso1.txt",header=TRUE, sep="\t")
head(bbdd) # muestra por defecto 6
tail(bbdd, 3) # muestra 3 registros

getwd()
setwd("/Users/pfernandezn/Desktop/")


#install.packages("openxlsx")

rm(list = ls()) 
gc()

library("openxlsx")

setwd("/Users/pfernandezn/Desktop/")

datos <- read.xlsx(xlsxFile = "curso_intro_r/datos/datos.curso1.xlsx",sheet=1)
# datos_xlsx <- openxlsx::read.xlsx(xlsxFile = "curso_intro_r/datos/datos.curso1.xlsx",sheet=1)

# load("curso_intro_r/datos/datos.curso1.RData")

# Review inical
class(datos)
dim(datos) 
str(datos)

# Visualizacion data.frames (cuidado con el numero de variables y de registros)

str(datos)
head(datos) # se visualizan las seis primera filas y todas las columnas

######################
# Acceso a elementos
######################

datos$"sexo"
datos$sexo

datos[  , c(3)]
datos[  ,   3]


# 1. hacer sub-bases de datos

datos_peques <- datos[ c(5,2,4) , c(1,2,3)] # hago esta base porque quiero


class(datos$"sexo")
length(datos$"sexo")
table(datos$"sexo",exclude=NULL)

datos_m <- datos [datos$"sexo"=="Mujer"  ,     ] # TENGO QUE ESTUDIAR MUY BIEN datos$"sexo"



datos_m2 <- datos [datos$"sexo"=="Mujer"  ,  c(1,8,3)   ]
datos_m3 <- datos [datos$"sexo"=="Mujer"  ,  c("ID","fumador","sexo")  ]


class(datos$"estado.civil")
length(datos$"estado.civil")
table(datos$"estado.civil",exclude=NULL) # Casado Divorciado    Soltero

datos_casados <- datos[ datos$"estado.civil"=="Casado"  ,        ]


# Combinacion de dos criterios

datos_m_casadas <- datos[ datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado" ,        ]

criterio <- c(datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado")
datos_m_casadas <- datos[ criterio ,        ]


# Cuidado con lo missing values en las varibles de seleccion
# Cuando hay missin NO PONER == y SI PONER %in% (es lo mismo pero no tiene en cuenta los missing)

datos [datos$"sexo"%in%"Mujer" & datos$"estado.civil"%in%"Casado" , c(1:10) ]



table(datos$"nivel.estudios",exclude=NULL) # Alto  Bajo Medio

datos_nivel_bajo <- datos [ datos$"nivel.estudios"=="Bajo"    ,     ]

dim(datos_nivel_bajo)
str(datos_nivel_bajo)
datos_nivel_bajo[ ,c("nivel.estudios") ]
table(datos_nivel_bajo$"nivel.estudios",exclude=NULL)




# 2. Recodificar valores

datos.new<-datos

datos.new[ c(1) , c(3) ]  <- "Hombre quizas"
datos.new[ c(1) , c(3) ] <- "Mujer"


# Me han dicho que el registro con ID 200 es Mujer, ¿tengo que recodificarlo???

class(datos$"ID") # numerica

datos.new[ datos.new$"ID"==200  ,c("sexo") ] <- "Mujer"
head(datos.new)




















