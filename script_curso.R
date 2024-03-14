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

# Subsets

criterio <- c(1,2,3)
datos_nuevos <- datos[ criterio , ]

criterio <- datos$"sexo"=="Mujer"
datos_mujeres1 <- datos[ criterio ,  ]

# Recodificaciones

datos.new$"sexo"[2]
datos.new$"sexo"[2] <- "Hombre"
datos.new$"sexo"[c(2,4,5,6)]<-"DIOS MIO DE MI VIDA"

criterio_id <- datos.new$"ID"==c(200)
datos[criterio_id , "sexo" ]<- "Mujer"


# Cargar un workspace

load("workspace.RData")

# Importar un archivo txt, csv, xlsx,dta...

datos_importados <- read.table()
datos_importados <- read.csv()

library(openxlsx)
datos_importados <- read.xlsx()



 
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


names(datos)
names(datos)[c(3)]
names(datos)[c(3)]<-"sex"

nombres.variables<-names(datos)

names(datos)=="sexo"
names(datos)[names(datos)=="sexo"]<-"sexo"

criterio<-names(datos)=="sexo"
names(datos)[criterio]<-"sexo"

# Cuando hagais subsets 
datos_mujeres<-datos[datos$"sexo"=="Mujer" ,  ]
row.names(datos_mujeres)
row.names(datos_mujeres)<-NULL
row.names(datos_mujeres)


# Visualizacion

head(datos,n=3)
datos[c(1:3),c("ID","sexo")]
head(datos[,c(1:8)],n=3)

tail(datos,n=10)

fix(datos) # NO LO UTILIZO
View(datos) # NO LO UTILIZO AUNQUE NO ESTA MAL


# Operaciones aritmeticas

class(datos$"peso")
class(datos$"altura")

range(datos$"peso")
range(datos$"altura")

datos$"ratio" <- NA
head(datos)

datos$"ratio" <- datos$"peso" / datos$"altura"
head(datos)
  
datos$"peso_new"<-datos$"peso"/sqrt(2)  


# Operaciones logicas

< 
> 
<= 
>= 
== 
!=

criterio<- datos$"peso">=70 
datos_pesados <- datos[criterio ,  ]  


ids_buscar<-c(1,40,137,3000)
length(ids_buscar)
intersect(datos$"ID",ids_buscar)
length(intersect(datos$"ID",ids_buscar))

# Repetidos
length(datos$"ID")
length(unique(datos$"ID"))
table(datos$"ID")>1


# Secuencias no aleatorias seq y rep

x <- c(1,2,3,4)
x <- c(1:4)

x <- seq(from = 1, to = 4, by=1)
x <- seq(1, 4, 1)

y<-c(1,1,1,1,1)
y <-rep(x=1,times=5)
z<-c(rep(1,5),rep(2,100))

ccaa <- c(rep("Andalucia",100),rep("Canarias",50))


# Missing

datos$"peso"==NA    # NUNCAAAAAAAAAAAAAAAAAAAAAAAAAA

datos$peso[datos$"peso"==NA]<- 1  # NUNCAAAAAAAAAAAA

datos[datos$"peso"==NA, c("peso")]<- 1 # NUNCAAAAAAAAAAAA


class(datos$"peso")
length(datos$"peso")

# is.na(datos$"peso")
# which(is.na(datos$"peso"))
sum(is.na(datos$"peso"))


datos$"sexo"[c(1,2,3)]<-NA

sum(is.na(datos$"sexo"))
which(is.na(datos$"sexo"))

datos$"sexo"[is.na(datos$"sexo")]<-"NO LO SE"

criterio<-is.na(datos$"sexo")
datos$"sexo"[criterio]<-"NO LO SE"


# Ordenacion

sort(datos$"ID")  # Para visualizar
sort(datos$"ID",decreasing=T)


datos_ordenados <- datos[order(datos$"ID",decreasing=T) , ]
row.names(datos_ordenados)<-NULL  # Cada vez que ordeneis


datos_ordenados<-datos[order(datos$"estado.civil",datos$"edad"),]
row.names(datos_ordenados)<-NULL
head(datos_ordenados)

# Exportacion

write.table(        )
write.csv()
write.xlsx()

save("xxxx.RData")
save.image("xxxxxx.RData")


# Distintos ejemplos añadiendo argumentos a la función, en este caso mi base de datos se llama ariquality

write.table(x=airquality, file = "C:/Users/FGM/Desktop/air_exportado.txt")
write.table(x=airquality, file = "C:/Users/FGM/Desktop/air_exportado.txt",quote=FALSE, row.names=FALSE)
write.table(x=airquality, file = "C:/Users/FGM/Desktop/air_exportado.txt",quote=FALSE, row.names=FALSE,sep="\t")
write.table(x=airquality, file = "C:/Users/FGM/Desktop/air_exportado.txt",quote=FALSE, row.names=FALSE,sep="\t",na = "NO ESTÁ")



#En el caso de exportar a Stata, SAS, SPSS o excel, instalar el paquete y cargarlo para acceder a la ayuda y a sus funciones.

#install.packages("foreign")
#install.packages("openxlsx")

library("foreign")
library("openxlsx")

Excel
write.xlsx(x=datos, file= "C:/Users/FGM/Desktop/fichero_excel.xlsx")

#STATA
save.dta13(data=datos.curso1, file="C:/Users/FGM/Desktop/datos_stata.dta")

#Varios objetos
save(tabla, airquality, file=""C:/Users/FGM/Desktop/objetos.RData")

#Workspace
save.image(file="C:/Users/FGM/Desktop/todo.RData")










