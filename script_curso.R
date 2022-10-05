

install.packages("openxlsx")


####################################################
##    CREACION DE UN DATA.FRAME
####################################################

rm(list=ls())

# Datos del analisis

dades <- data.frame(ID=c("gen0", "genB","genZ"),
                    subj1 = c(10, 25, 33), 
                    subj2 =c(NA, 34, 15), 
                    oncogen = c(TRUE, TRUE,FALSE),
                    loc = c(1,30, 125))

# me cuesta entender esto

datos.estudio <- c(1,2,3)

datos.estudio2 <- c("A", "B", "C")

datos.estudio <- c(1,2,3);datos.estudio2 <- c("A", "B", "C")

# Analisis 1


datos.estudio2 <- c("A", "B", "C","B", 
                    "C","B", "C","B", "C","B", "C","B", 
                    "C","B", "C","B", "C","B", "C","B", 
                    "C","B", "C")

# Borramos todo, no quiero ser un cochino

rm(list=ls())


# GRAFICO

peso <- c(10,15,66,33)
altura <- c(145,150,177,160)

par(mfrow=c(1,2))

plot(x=altura,y=peso)

plot(x=altura,y=peso,main="Peso vs Altura",xlab="ALTURA",ylab="PESO")

# recordatorio sobre packages adicionales

# install.packages("openxlsx")
library("openxlsx")

# install.packages("acc")
library("acc")

###########################################################
##################### PROYECTO 1 ##########################
###########################################################

rm(list=ls())


# Establezco el directorio de trabajo

setwd("/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/INTRODUCCION_A_R_ONLINE-main/datos/proyecto1/datos")


load("datos.curso1.RData")


datos$sexo

datos$"sexo"

datos_selec <- datos [c(33,10,100), c(3,1,2) ]

table(datos$"sexo",exclude=NULL)
unique(datos$"sexo")

# Una manera
datos_mujeres <- datos [datos$"sexo"=="Mujer", ]

# Otra manera
criterio <- datos$"sexo"=="Mujer"
class(criterio)
length(criterio)
datos_mujeres <- datos [criterio ,  ]

# Criterio multiple
table(datos$"estado.civil",exclude=NULL)
criterio2 <- datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado"
datos_mujeres_casadas <- datos [criterio2 , ]


# RECODIFICACIONES 

datos[datos$"ID"==200 , "sexo" ] <- "NO LO SE"


# Creamos una variable nueva de edad (cod_edad)

datos$"cod_edad"<-NA

criterio_edad1 <- datos$edad>=50
table(criterio_edad1)

datos[criterio_edad1,"cod_edad"]<-"mayores"

criterio_edad2 <- datos$edad<50
table(criterio_edad2)

datos[criterio_edad2,"cod_edad"]<-"menores"

table(datos$cod_edad)

#datos$"cod_edad"[criterio_edad1]<-"mayores"
#datos$"cod_edad"[criterio_edad2]<-"menores"



datos.new2[datos.new2$"ID"==200 , "sexo" ]
datos.new2[datos.new2$"ID"==200 , 3 ]
datos.new2[datos.new2$"ID"==200 , c(3) ]



datos.new2[datos.new2$"ID"==200 , sexo ]




# Eliminar registros

datos_nuevos <- datos[-c(2,3,4), ]

criterio<-datos$ID%in%c(174,200,23)
datos_nuevos2 <- datos[-which(criterio),]

datos_nuevos3<-datos[!criterio,]


# Hacer una base de datos solo con los IDs 174, 200 y 23


criterio<-datos$ID%in%c(174,200,23)
# dos maneras de hacer lo mismo
datos_nuevos4<-datos[which(criterio),]
datos_nuevos5<-datos[criterio,]


# Eliminamos columnas/variables

datos_nuevos6 <- datos[  ,-c(2,3)]


# Quiero quiter la última fila de la base de datos

dim(datos)

dim(datos)[c(1)]
dim(datos)[c(2)]

dim(datos)[1:2]
dim(datos)[c(1,2)]

datos_nuevos7 <- datos[ -c(200)  ,  ]
datos_nuevos7 <- datos[ -dim(datos)[c(1)]  ,  ]



datos.mujer1 <- datos[datos$"sexo"%in%"Mujer", -c(6,7) ]

datos.mujer2 <- subset(datos, sexo=="Mujer",select= -c(peso, altura))



# Nombres de los datos

names(datos)[c(2,3)]

criterio<-names(datos)%in%"nivel.estudios"
names(datos)[criterio] <- "STUDY_LEVEL"

criterio_pos<-which(names(datos)%in%"nivel.estudios")
names(datos)[criterio_pos] <- "STUDY_LEVEL"




# Row.names


datos2<-datos[c(44,45,46,47,48),]
row.names(datos2) <- NULL


# Recodificar valores de una variable (Divorciado se ponga en divor)

criterio <- datos$"estado.civil"%in%"Divorciado"
datos$"estado.civil"[criterio] <- "divor"
head(datos)

datos$"estado.civil2" <- datos$"estado.civil"
criterio2 <- datos$"estado.civil2"%in%"Divorciado"
datos$"estado.civil2"[criterio2] <- "divor"


# Sustituir el valor “Bajo” en la variable nivel.estudios por el valor de “Low”

table(datos$"nivel.estudios")
criterio<-datos$"nivel.estudios"%in%"Bajo"
datos$"nivel.estudios"[criterio] <- "Low"

# Identificar IDs


rm(criterio)
criterio<-datos$"ID"%in%c(22,137,340)
datos_mirar <- datos[criterio,]



# Crea otro data frame con el nombre de my.data.frame.new que contenga los registros cuya altura sea superior a 160.

criterio <- datos$"altura">160
my.data.frame.new <- datos[criterio,]


# Otras formas
table(criterio)
my.data.frame.new<-datos[datos$"altura">160,]
my.data.frame.new<-datos[which(datos$"altura">160),]


# Operaciones aritmeticas

datos$peso_new <- datos$peso + 3
datos$peso_new2<- datos$peso + datos$altura
datos$peso_new3 <- exp(datos$peso)

datos$peso_new4 <- datos$peso/sqrt(2)

# Operaciones comparativa vs logicas

datos$peso>90
datos$peso<90
datos$peso>=90
datos$peso<=90
datos$peso==90 # igual
datos$peso!=90 # distinto

datos$peso>=90 & datos$altura>100  # y
datos$peso>=90 | datos$altura>100  # o


# Operaciones de conjuntos

conj1 <- datos$"ID"
conj2 <- c(22,137,340)

intersect(conj1, conj2)


# Secuencias
dim(datos)# 200 11

datos$ID_new <- c(1:200)

datos$ID_new <- seq(from = 1, to = 200, by = 1)

datos$ID_new2<-c(rep(2,100),rep(3,100))


# Missing

is.na(datos$ID) # vector logico
which(is.na(datos$ID)) # vector numerico de posiciones


datos$"ID"[c(3,4,45)]<-NA

datos[c(3,4,45) , c("ID")]<-NA

is.na(datos$ID) # vector logico
which(is.na(datos$ID)) # vector numerico de posiciones

# Recodificar missing

datos$"ID"[ which(is.na(datos$ID)) ] <- 9999

datos[ which(is.na(datos$ID)) , c("ID") ] <- 9999


# Recodificar missing con otros formatos

datos$"ID"[c(3,4,45)]<-"."
which(is.na(datos$ID))

criterio<-datos$ID%in%"."
datos$"ID"[ criterio ]<-NA

which(is.na(datos$ID))

# Cambiar formato de variable

datos$"ID"<-as.numeric(datos$"ID")

#setwd("C:/Users/patricia.garciar/xxxxxxxxx")


# Ordenar



datos$"ID_new" <- sort(datos$"ID")

datos<-datos[order(datos$"ID") , ]

datos<-datos[order(datos$"estado.civil",datos$"edad") , ]


library("openxlsx")

datos<-read.xlsx("datos.curso1.xlsx",sheet=1)



datos2<-read.table("datos.curso1.txt",sep="\t",header=T)

# Establezco el directorio de trabajo

setwd("/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/INTRODUCCION_A_R_ONLINE-main/datos/proyecto1/results")


#Exportación de datos txt
write.table(x=datos, file="/Users/pfernandezn/Desktop/datos.txt", sep="\t", row.names=F, quote=F)
getwd()
write.table(x=datos, file="datos.txt", sep="\t", row.names=F, quote=F)

load("/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso1.RData")

write.table(x=datos.curso1,file="/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/datos.curso.exportado.txt", sep="\t")

write.csv2(x=datos.curso1,file="/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/datos.curso.exportado.csv", sep=";", na=".")

write.table(x=datos.curso1,file="/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/datos.curso.exportado.txt", sep=";")


################################################################################
################################################################################
# EJEMPLO CASO EVALUACION
################################################################################
################################################################################

############################################################
# Borramos todo los objetos del workspace
############################################################

rm(list=ls())


############################################################
# Establezco el directorio de trabajo
############################################################


setwd("/Users/pfernandezn/Desktop/INTRO_R_DOCTORADO/INTRODUCCION_A_R_ONLINE-main/datos/proyecto1/datos")


############################################################
# Importacion
############################################################

# install.packages("openxlsx")
library("openxlsx")

datos<-read.xlsx("datos.curso1.xlsx",sheet=1)

dim(datos)
str(datos)
head(datos)
tail(datos)

#2. Realizar las siguientes recodificaciones
#2.1. Sustituir los valores missing en la variable edad por el valor de 120


is.na(datos$"edad")
which(is.na(datos$"edad"))

criterio <- is.na(datos$"edad")
datos$"edad"[criterio]<- 120



#2.2. Sustituir el valor de “mujer” por “Mujer” en la variable Sexo

names(datos)

table(datos$"sexo",exclude=NULL)

is.na(datos$"sexo")
which(is.na(datos$"sexo"))


criterio<-datos$"sexo"%in%"Mujer"
datos$"sexo"[criterio]<-"mujer"

table(datos$"sexo",exclude=NULL)


#2.3 Sustituir los valores missing en la variable estado.civil por el valor de “Divorciado”


igual que el 2.1

#2.4 Sustituir el valor “Bajo” en la variable nivel.estudios por el valor de “Low”


igual que el 2.2


#3. Crear las siguiente variables
#3.1. Crea una variable dentro los datos del estudio llamada “cod_edad” que tenga dos posibles
#valores: Old (cuando la variable edad toma valores >=60 años) y Young (cuando la
#variable edad toma los valores <60 años). 
#Asignar a los valores missing en la variable edad el valor de 120

!CUIDADOOO LA VARIABLE EDAD PUEDE TENER MISSING!!!!!!!!!!!!!!!!!!

criterio <- is.na(datos$"edad")
datos$"edad"[criterio]<- 120

datos$"cod_edad"<-NA

criterio1 <- datos$"edad">=60
datos$"cod_edad"[criterio1] <- "Old"

criterio2 <- datos$"edad"<60
datos$"cod_edad"[criterio2] <- "Young"

table(datos$"cod_edad",exclude=NULL)


# OTRO ANALISIS

criterio <- is.na(datos$"edad")
datos$"edad"[criterio]<- 9999

datos$"cod_edad"<-NA

criterio1 <- datos$"edad">=60
datos$"cod_edad"[criterio1] <- "Old"

criterio2 <- datos$"edad"<60
datos$"cod_edad"[criterio2] <- "Young"

criterio3 <- datos$"edad"%in%9999
datos$"cod_edad"[criterio3] <- NA

table(datos$"cod_edad",exclude=NULL)



#3.2. Crea una variable numerica dentro de los datos del estudio llamada “multi” que sea igual
#a la multiplicacion entre altura y el peso

names(datos)

datos$"multi" <- datos$"altura" * datos$"peso"



#4. Identificar cuales de los siguientes identificadores de registro
#están en la base de datos del estudio: 33,55,170
#para realizar la comprobación se ha de revisar la variable ID de los datos del estudio

names(datos)

conj1<-c(33,55,170)
conj2<-datos$"ID"

intersect(conj1,conj2)


#5. Crear una variable llamada ID_casa en la base de datos
#del estudio cuyos valores correspondan a una secuencia numérica
#contínua no aleatorio desde el 1 hasta el número total de registros.

dim(datos)

datos$"ID_casa" <- c(1:dim(datos)[1]) 

# seq(from=1,to=dim(datos)[1],by=1)



#6. Ordena la base de datos del estudio de forma descendente atendiendo
#primero a la variable “peso” y después a la variable “sexo”.


# order()
# CUIDADO CON LOS MISSING

datos_ordenado<- datos[order(datos$"peso",datos$"sexo")  ,      ]
head(datos_ordenado)


#7.Crear una base de datos llamada “datos_peticion” que contenga
#sólo aquellos registros pertenecientes al grupo de edad de los
#“Old” atendiendo a la variable creada anteriormente llamada
#“cod_edad”

table(datos$"cod_edad")

rm(criterio)
criterio<-datos$"cod_edad"%in%"Old"

datos_peticion <- datos[  criterio  ,    ]

table(datos_peticion$"cod_edad")



#8.Exporta la base de datos llamada “datos_peticion” en formato
#de R y en formato de excel con el nombre base_mayores.


save(datos_peticion,file="base_mayores.RData")

library("openxlsx")

write.xlsx(datos_peticion,file="base_mayores.xlsx")




