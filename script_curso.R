
# SCRIPT DEL CURSO

#R version 4.5.2 (2025-10-31 ucrt)

# ayuda
?rnorm

# Instalar paquetes adicionales

?install.packages
install.packages(pkgs="openxlsx")

# Cargar paquetes adicionales para poder utilizar la ayuda y sus funciones
library("openxlsx")

# Una vez cargados los paquetes que vayamos a utilizar, vemos las versiones de los paquetes.
sessionInfo

# Listar nombres de objetos creados o importados

ls()

# Creacion de vectores (numericos)

x=c(1,2,5) # esto es mejor no ponerlo asi

x <- c(1,4,3)

x<-c(1,2,3)

# Borrar objetos del workspace

ls()
rm(x)
ls()

# Creacion de vectores logicos, caracteres, factor

z <- c(TRUE, FALSE, TRUE, TRUE) # esto es vector logico

z.char <- c("TRUE", "FALSE", "TRUE", "TRUE") # Esto es vector de caracteres
y <- c("Low","Low","Medium","High")
y1<-c(1,2,3,"Low","High")  # "1", "2" , "3" , "Low" , "High"

y.factor <- factor(c("Low","Low","Medium","High"))

ls()

# Crear data.frame (objetivo de momento, generar tablas)

tabla <- data.frame(    ID=c("gen0", "genB","genZ"),
subj1 = c(10, 25, 33), 
subj2 =c(NA, 34, 15), 
oncogen = c(TRUE, TRUE,FALSE),
loc = c(1,30, 125) ,
nivel.estudios=factor(c("Low","Low","Medium"))   )

# Crear un listado (para almacenar varios objetos)

saco <- list( una.tabla=tabla,
vector.numeric=x,
vector.caracter=y,
y.factor=y.factor,
y1=y1,
z=z,
z.char=z.char )

ls()

rm(tabla,x,y,y.factor,y1,z,z.char)

ls()

# Concatenar ejecuciones

datos.estudio <- c(1,2,3)
datos.estudio2<-c("A","B","C")

datos.estudio <- c(1,2,3) ; datos.estudio2<-c("A","B","C") # dos lineas de codigo

#############
# Atributos
#############
x <- c(1,4,3)

y <- c("Low","Low","Medium","High")

y.factor <- factor(c("Low","Low","Medium","High"))

z <- c(TRUE, FALSE, TRUE, TRUE) 
tabla <- data.frame(    ID=c("gen0", "genB","genZ"),
subj1 = c(10, 25, 33), 
subj2 =c(NA, 34, 15), 
oncogen = c(TRUE, TRUE,FALSE),
loc = c(1,30, 125) ,
nivel.estudios=factor(c("Low","Low","Medium"))   )

# Vectores
length(x)
length(y)

# Data.frames
dim(tabla)
str(tabla)


# Para vectors y data.frames
class(x)
class(y)
class(tabla)

# Cambios de formato entre variables (cuidado......)

x_char <- as.character(x)
y_factor_new<-as.factor(y)


#############################################
## DATA FRAME
#############################################

rm(list=ls())
gc()

# getwd() para saber donde esta ubicado el directorio de trabajo
setwd("/Users/pfernandezn/Desktop/INTRODUCCION_A_R/DATOS")

# Importar un workspace
load("datos.curso1.RData")
# load("/Users/pfernandezn/Desktop/INTRODUCCION_A_R/DATOS/datos.curso1.RData")

ls()

# Checks (atributos)

class(datos)

dim(datos)
str(datos)

# Acceso a elementos para posterior manipulacion $

datos$"sexo"

sexo.mirar <- datos$"sexo"

# Acceso a elementos MATRICIAL para posterior manipulacion
# datos[ FILAS  , COLUMNAS  ]

datos[           ,    c( 3 )       ] # si no pongo nada significa que quiero todo

sexo.mirar <- datos[ ,  c( 3 ) ]

datos[  c(1,2,3,4)  , c(1,6,7)    ] # ver las cuatro primeras filas y las variables ID, peso y altura

datos[  c(4,6,1)  , c(1,7,6)    ] 

datos[1 , 3 ]

c(1,2,3)
c(1:3)


table(datos$"sexo",exclude=NULL) # Para conocer los valores de las variables
table(datos$"estado.civil",exclude=NULL)

datos$"sexo"=="Mujer" 
datos[   datos$"sexo"=="Mujer"    ,       ]

#datos$"sexo"=="Mujer" 
#datos$"estado.civil"=="Casado"
#&

datos[ datos$"sexo"=="Mujer"  &  datos$"estado.civil"=="Casado"     ,         ]

#  %in% es igual a == cuando no hay missing

datos[ datos$"sexo"%in%"Mujer"  &  datos$"estado.civil"%in%"Casado"     ,         ]

# Crear un objeto a partir de este acceso concreto

muj_cas <- datos[ datos$"sexo"=="Mujer"  &  datos$"estado.civil"=="Casado"   ,    ]

class(muj_cas)


# Recodificacion basada en acceso a elementos

datos[2  ,  5 ] <- "Bajisimo"
datos[1:3,   ]


datos[datos$"ID"==174 , 5] <- "Bajisimo pero bajisimo"
datos[1:3,   ]

##############################################################

# Anadir nueva variable
datos$"caso.cancer" <- NA
datos$"caso.cancer" <- datos$"cancer.mama" # esto copia los valores de la variable cancer.mama

# datos$"bmi" <- operacion entre variables pero esto lo vemos luego


# Eliminar variables

datos[   , -c(3,5)  ]

# datos$"peso" <- NULL

# Eliminar registros

datos[ -c(15,20)  ,   ]

# Eliminar variables y registros

datos[ -c(15,20)  ,   -c(3,5) ]

# La manera de eliminar registros con una condicion logica
indice <- which(datos$"sexo"=="Mujer")
datos.nuevos <-datos[-indice, ] # esto es una base solo de hombres

# Visualizacion de datos

fix(datos)
str(datos)

head(datos)
tail(datos)

head(datos,n=3)
tail(datos,n=3)

datos[1:3 , 1:10]


# Como borrar los indices de trazabilidad de posicion de fila
muj_cas <- datos[ datos$"sexo"=="Mujer"  &  datos$"estado.civil"=="Casado"   ,    ]
head(muj_cas)
row.names(muj_cas)<-NULL
head(muj_cas)


names(datos)
names(datos)[     c(5)     ] <- "study.level"
names(datos)[     c(2,3,4)     ]<- c("age","sex","marital_status") 

names(datos)[   which(names(datos)=="diabetes")       ] <- "diab"
names(datos)[   c(8)       ] <- "diab"

# Operaciones aritmeticas
datos$"altura2" <- datos$"altura"*2
datos$"ratio_edad_altura" <- datos$"age" / datos$"altura"

# Condiciones logicas (un poco mas)

muj_cas_altas<- muj_cas[ muj_cas$"altura">=150  ,   ]
row.names(muj_cas_altas)<-NULL


muj_cas_altas <- datos[ datos$"sexo"=="Mujer"  &  datos$"estado.civil"=="Casado"  & datos$"altura">=150 ,    ]


# Operaciones de conjuntos

ID1 <-1:5
ID2 <-c(1, 3, 7:10)

union(ID1, ID2)
intersect(ID1, ID2)
setdiff(ID1, ID2)
setdiff(ID2, ID1)

# Secuencias aleatorias

sample(datos$ID)


# Secunecias No aleatorias

c(1,2,3)
c(1:3)

seq(from=1,to=3,by=1)
seq(from=1,to=100,by=2)

rep(1,10)
datos$"ID_REP"<- 1
datos$"ID_REP"<- rep(1,200)

# identificar Missing

datos$"sex"==NA # NOOOOOOOOOOOOOOO
is.na(datos$"sex") # esta es la condicion logica para ver si un elemento es missing
which(is.na(datos$"sex"))

# Recodificar los missing values

datos$"sex"[  is.na(datos$"sex")         ] <- "NO SE QUE SEXO TENGO"
datos$"sex"[   which(is.na(datos$"sex"))         ] <- "NO SE QUE SEXO TENGO"

datos$"sex"[ datos$"sex"=="Mujer"         ] 
datos$"sex"[ which(datos$"sex"=="Mujer" )        ] 

# Ordenar

muj_cas_altas <- datos[ datos$"sex"=="Mujer"  &  datos$"marital_status"=="Casado"  & datos$"altura">=150 ,    ]

muj_cas_altas_ordenada <- muj_cas_altas[order(muj_cas_altas$"ID",muj_cas_altas$"age") ,  ]

muj_cas_altas_ordenada <- muj_cas_altas[order(muj_cas_altas$"study.level",muj_cas_altas$"age") ,  ]


datos$"ID"[nchar(datos$ID)==3]


####################################################
# Repaso de importacion de datos contenidos en un paquete
####################################################

install.packages("airqualityES")

library("airqualityES")

data(package="airqualityES")

data(airqES)

head(airqES)


####################################################
# Exportacion de estos datos (hace una copia) a un fichero txt llamado
# datos.contaminacion.txt con separacion de tabulacion entre columnas
# y quitando comillas en los valores y los row.names del data.frame 
# (que vienen por defecto)
####################################################

write.table(airqES,file="datos_contaminacion.txt",
sep="\t",row.names=F,quote=F)






