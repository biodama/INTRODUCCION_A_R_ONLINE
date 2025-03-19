
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


#Importacion txt (ver siempre ayuda de la función)
bbdd <- read.table(file="/Users/pfernandezn/Desktop/datos.curso1.txt",header=TRUE, sep="\t")
head(bbdd) # muestra por defecto 6
tail(bbdd, 3) # muestra 3 registros

getwd() # donde se encuentra el directorio de trabajo
setwd("/Users/pfernandezn/Desktop/") # Establecemos el directorio de trabajo

#Importacion xlsx (ver siempre ayuda de la función) 
#install.packages("openxlsx")

rm(list = ls()) 
gc()

library("openxlsx")

setwd("/Users/pfernandezn/Desktop/")

datos <- read.xlsx(xlsxFile = "curso_intro_r/datos/datos.curso1.xlsx",sheet=1)
# datos_xlsx <- openxlsx::read.xlsx(xlsxFile = "curso_intro_r/datos/datos.curso1.xlsx",sheet=1)

# load("curso_intro_r/datos/datos.curso1.RData") Cuidado al importar un archivo de R a la sesión de trabajo, si un objeto se llama igual, lo sustituye y no da ningún tipo de aviso.

# Review inical
class(datos)
dim(datos) 
str(datos)

# Visualizacion data.frames (cuidado con el numero de variables y de registros)

str(datos)
head(datos) # se visualizan las seis primeras filas (por defecto) y todas las columnas
tail(datos) # se visualizan las seis ultimas filas (por defecto) y todas las columnas

# fix(datos) # CUIDADO QUE ALTERA LA FILOSOFIA DEL R; NO queda registro en el script de las cosas que hacemos. Lo cambios que hagais se quedan en el data.frame

head(datos)
tail(datos)

View(datos)


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


datos.new[ c(datos.new$"ID"==200)  ,  c("sexo") ]
datos.new[ c(datos.new$"ID"==200)  ,  c("sexo") ] <- "Mujer"
head(datos.new)



# Anadir/crear variables en un data.frame

datos.new$"fumador_0_1" <- NA
datos.new$"fumador_0_1" <- 1

datos.new$"fumador_new" <- NA
datos.new$"fumador_new" <- "NO FUMO"


# Eliminar variables de un data.frame

datos_sin_sexo <- datos.new[ , -c(3)]

datos.new$"sexo" <- NULL

# Eliminar variables o registros de un data.frame

datos_sin_sexo <- datos.new[-c(4,3) , -c(3)]

datos_sin_sexo <- datos.new[-c(datos.new$"sexo"=="Mujer") , -c(3)]


# cbind (unir columnas/variables) y rbind (unir filas o registros)

columnas_unir <- datos.new[ ,c(1,2,3)]

sum(columnas_unir$"ID"==datos.new$"ID")
dim(columnas_unir)
dim(datos.new)
datos_new_total<-cbind(datos.new,columnas_unir)


registros_unir <- datos.new[c(1,2,3) , ]
str(registros_unir)
str(datos.new)
datos_new_nuevo<- rbind(datos.new,registros_unir)


#################################################

# Condiciones logicos

datos.new$"sexo"=="Mujer" # TRUE, FALSE.......
which(datos.new$"sexo"=="Mujer") # 3 5 6

datos.new[datos.new$"sexo"=="Mujer" , ]
datos.new[which(datos.new$"sexo"=="Mujer") , ]

# Nombre de variables

names(datos.new)[  c(2)  ] <- "AGE"
names(datos.new)[  c(8)  ] <- "cancer.mama"

which(names(datos.new)=="fuma")

names(datos.new)[ which(names(datos.new)=="fumador")   ]
names(datos.new)[ which(names(datos.new)=="fumador")   ] <-"FUM"

datos.new$"fumador_new"<-1

# grep("fum",names(datos.new)) busquedas no literales, lo veremos en manejo avanzado


# Indicadores de filas (cuando se hacen sub-bases de datos pueden confundir y dar probleas en modelos)

row.names(datos.new) <- NULL # resetear los row.names

datos_mujeres <- datos.new[datos$"sexo"=="Mujer",]
row.names(datos_mujeres)<-NULL


# Operaciones aritmeticas

class(datos.new$"peso")
class(datos.new$"altura")

range(datos.new$"peso") # ver alguna de las funciones estadisticas de la presentacion
range(datos.new$"altura")

hist(datos.new$"peso")

datos.new$"ratio" <- NA # esto no seria necesario
head(datos.new)

datos.new$"ratio" <- datos.new$"peso" / datos.new$"altura"
head(datos.new)
  
datos.new$"peso_new" <- datos.new$"peso"/sqrt(2)  


# Operaciones logicas

< 
> 
<= 
>= 
== (%in% cuando hay missing)
!= (distinto de)
| (o)
& (y)

# Recodificaciones

datos.new$"peso">=70
criterio <- datos.new$"peso">=70

datos.new$"Peso_cat"<-0 # creo una variable en los datos con valor 0
datos.new$"Peso_cat"[criterio]<-1 # recodificacion



# Tres maneras de hacer lo mismo
datos.new[ datos.new$"nivel.estudios"=="Bajo"  ,  c("nivel.estudios") ] <- "LOW"
datos.new$"nivel.estudios"[datos.new$"nivel.estudios"=="Bajo"]<- "LOW"
datos.new$"nivel.estudios"[which(datos.new$"nivel.estudios"=="Bajo")]<- "LOW"



# Recodificacion de fumador

datos.new$"fumador"[which(datos.new$"fumador"=="No")]<- 0
datos.new$"fumador"[which(datos.new$"fumador"=="Si")]<- 1


table(datos.new$"diabetes",exclude=NULL)
datos.new$"diabetes.new" <- datos.new$"diabetes"

datos.new$"diabetes.new"[which(datos.new$"diabetes.new"=="No")]<- 0
datos.new$"diabetes.new"[which(datos.new$"diabetes.new"=="Si")]<- 1

table(datos.new$"diabetes.new",datos.new$"diabetes",exclude=NULL)
 

# Operaciones conjuntos
 
intersect(datos.new$"ID",c(300,200)) 
length(intersect(datos.new$"ID",c(300,200)))

setdiff(datos.new$"ID",c(300,200)) 
setdiff(c(300,200),datos.new$"ID") 
 
 
 
# Secuencias no aleatorias seq y rep

x <- c(1,2,3,4)
x <- c(1:4)

x <- seq(from = 1, to = 4, by=1)
x <- seq(1, 4, 1)


seq(from = 0.1, to = 0.9, by=0.01)


datos.new$"variable_new"<-rep(1,200)
datos.new$"variable_new"<-1

y<-c(1,1,1,1,1)
y <-rep(x=1,times=5)
z<-c(rep(1,5),rep(2,100))

ccaa <- c(rep("Andalucia",100),rep("Canarias",50))

datos.new$"CCAA"<-c(rep("Andalucia",100),rep("Madrid",100))


# Missing

datos.new$"peso"==NA    # NUNCAAAAAAAAAAAAAAAAAAAAAAAAAA

datos.new[datos.new$"peso"==NA, c("peso")]<- 1 # NUNCAAAAAAAAAAAA

datos.new$"peso"[datos.new$"peso"==NA]<- 1  # NUNCAAAAAAAAAAAA


class(datos.new$"peso")
length(datos.new$"peso")

# is.na(datos.new$"peso")
# which(is.na(datos.new$"peso"))
# sum(is.na(datos.new$"peso"))

class(datos.new$"peso")
length(datos.new$"peso")
sum(is.na(datos.new$"peso")) # cuantos missing tengo

class(datos.new$"sexo")
length(datos.new$"sexo")
table(datos.new$"sexo",exclude=NULL)
sum(is.na(datos.new$"sexo"))

datos.new$"sexo"[c(1,2,3)]<-NA

class(datos.new$"sexo")
length(datos.new$"sexo")
table(datos.new$"sexo",exclude=NULL)
sum(is.na(datos.new$"sexo")) # 3
which(is.na(datos.new$"sexo")) # 1 2 3

# Recodificacion de missing values

datos.new$"sexo"[is.na(datos.new$"sexo")]<-"NO LO SE"
datos.new$"sexo"[which(is.na(datos.new$"sexo"))]<-"NO LO SE"

table(datos.new$"sexo",exclude=NULL)


datos.new$"sexo"[c(1,2,3)]<-" "
datos.new$"sexo"[c(5,6)]<-"   "
class(datos.new$"sexo")
length(datos.new$"sexo")
table(datos.new$"sexo",exclude=NULL) # table en variables numericas NOOOOO
sum(is.na(datos.new$"sexo")) 
which(is.na(datos.new$"sexo")) 

names(table(datos.new$"sexo",exclude=NULL))
unique(datos.new$"sexo")


datos.new$"sexo"[ datos.new$"sexo"== " " ]<-NA
datos.new$"sexo"[ datos.new$"sexo"== "   " ]<-NA
table(datos.new$"sexo",exclude=NULL) # exclude contambiliza los missing
sum(is.na(datos.new$"sexo")) 
which(is.na(datos.new$"sexo")) 



# Ordenacion

sort(datos.new$"ID")  # Para visualizar
sort(datos.new$"ID",decreasing=T)


datos_ordenados <- datos.new[order(datos.new$"ID",decreasing=T) ,     ]
row.names(datos_ordenados)<-NULL  # Cada vez que ordeneis


datos_ordenados<-datos.new[order(datos.new$"estado.civil",datos.new$"edad"),]
row.names(datos_ordenados)<-NULL
head(datos_ordenados)


datos.new$"estado.civil.num"<-datos.new$"estado.civil"
table(datos.new$"estado.civil.num",exclude=NULL)
datos.new$"estado.civil.num"[datos.new$"estado.civil.num"=="Casado"]<-1
datos.new$"estado.civil.num"[datos.new$"estado.civil.num"=="Divorciado"]<-2
datos.new$"estado.civil.num"[datos.new$"estado.civil.num"=="Soltero"]<-3

class(datos.new$"estado.civil.num")
datos.new$"estado.civil.num"<-as.numeric(datos.new$"estado.civil.num")
class(datos.new$"estado.civil.num")

table(datos.new$"estado.civil.num",datos.new$"estado.civil")

#Exportación básica txt
write.table(x=datos.new,file="/Users/pfernandezn/Desktop/curso_intro_r/exportaciones/exp_datos_new.txt", sep="||", row.names=FALSE, quote=FALSE)

#Exportación a RData

save(criterio, datos, file="/Users/pfernandezn/Desktop/curso_intro_r/exportaciones/exportacion_2_objetos.RData") # uno o varios objetos
save.image(file="/Users/pfernandezn/Desktop/curso_intro_r/exportaciones/exportacion_todos_objetos.RData") # todos los objetos de la sesion




