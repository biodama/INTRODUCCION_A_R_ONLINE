############################################################################################################
############################################################################################################
############################################################################################################
############################################################################################################
############################################################################################################
############################################################################################################

##########################################
# Compruebo que el WORKSPACE esta vacio
##########################################

rm(list=ls())

ls() 

##########################################
# Version de R y librerias
##########################################

sessionInfo()

# R version 3.6.1 (2019-07-05)

##########################################
# Cargo las librerias que necesito
##########################################

# install.packages("openxlsx")

library("openxlsx")


##########################################
# Importo unos datos
##########################################

# ?read.xlsx

datos <- read.xlsx(xlsxFile="/Users/pfernandezn/Desktop/MI_ANALISIS/data/originals/datos.curso1.xlsx",
sheet = 1)

# PARA WINDOWS HAY QUE CAMBIARLO A MANO:
#   C:\\pfernandezn\\Desktop\\datos.curso1.xlsx
#   C:/pfernandezn/Desktop/datos.curso1.xlsx

# La importacion esta mal, hay que chequear

class(datos) # Pregunto que tipo de objeto es
is.data.frame(datos) # Pregunto si es un data.frame
dim(datos) # Dimensiones (filas, columnas)
head(datos) # Ver los 6 primeros registros
str(datos) # Descripcion general (tipo de variables)
names(datos) # nombres de las variables

# Chequear variables

datos$"sexo"

datos[ ,c(3)]

datos[,c("sexo")]

# Crear un objeto que es una copia de una variable
sexo <- datos$"sexo"

# Recodificacion
datos$"sexo"[3]<-"no se"

# Crear una base de datos seleccionando registos / columnas

condicion <-datos$sexo=="Mujer" 
datos_mujeres <- datos[condicion,  ]


datos_mujeres <- datos[datos$"sexo"=="Mujer",  ]


datos_mujeres <- datos[datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado",  ]


datos_mujeres<- datos[datos$"sexo"=="Mujer",  ]
datos_mujeres_casadas <- datos_mujeres[datos_mujeres$"estado.civil"=="Casado", ]


datos_mujeres_especial <- datos[datos$"sexo"=="Mujer", c("sexo","ID") ]
datos_mujeres_especial <- datos[datos$"sexo"=="Mujer", c(3,4) ]


datos[c(4,5) , c(1) ]<-c("NO SE")

datos[datos$"sexo"=="Mujer" , c(1) ]<-c("NO SE")

datos[c(4,5), c("sexo") ]<-c("NO SE")


head(datos)
datos[datos$"ID"%in%c(200,23), c("sexo") ]<-c("NO SE")
head(datos)


datos[datos$"peso"<=60 , c("peso")]<-60/2 # Version bidimensional
datos$"peso"[datos$"peso"<=60]<-60/2 # Version vectorial 

#valores<-c("123,5435","43242,4234","4234421,545")
#valores_buenos<-gsub(",",".",valores)

datos_mujeres<- datos[datos$"sexo"=="Mujer",]
datos_mujeres[c(4,5),c("sexo")]<-c("NO SE")



# Creacion de nuevas variables

# datos$"hg"<-c(NA)
datos$"hg"<-c(0)

datos$"bmi" <- c(0)


# Eliminacion de variables

head(datos)

datos<-datos[,-c(5,13)] # eliminamos las variables (columnas 5 y 13)

head(datos)

# Creacion de registros

registro_nuevo<-datos[c(15),]

datos <- rbind(datos,registro_nuevo)


# Eliminacion de registros

datos<-datos[-c(4,7),] 


# Operaciones con variables

# a. Aritmeticas

datos$"resultado" <- c(datos$peso - datos$altura) / c(100)
incidencia<-c(10,15,17,22,50,67,55,23,10,7,2,1)
incidencia_acumulada <- cumsum(incidencia)

# b. Logicas

datos_mujeres <- datos[datos$"sexo"=="Mujer",]

datos_ob <- datos[datos$"peso">=60,]


# c. Conjuntos

id_COVID<-c(200,20432)
ids_datos <- datos$"ID"
intersect(ids_datos,id_COVID)
setdiff(ids_datos,id_COVID)
setdiff(id_COVID,ids_datos)


datos_covid_isciii<-data.frame(ID=c(45,179,200,20550),
Nombre=c("Pablo","Mario","Beatriz","Jose Pablo"))
intersect(datos$"ID",datos_covid_isciii$"ID")


# Missing

is.na(datos$peso) 

datos$"cancer.mama"[is.na(datos$cancer.mama)]<-c("NO VALORADO")

# Otra manera: datos[is.na(datos$cancer.mama) , c("cancer.mama") ]<-c("NO VALORADO")
 
 
datos$"cancer.prostata"[which(is.na(datos$cancer.prostata))]<-c("NO VALORADO")

# Otra manera: datos[which(is.na(datos$cancer.prostata)), c("cancer.prostata")]<-c("NO VALORADO")
  


#datos [   ,  ]
#datos$"peso" [ ] 

################
# Exportacion
################

datos_consorcio<-datos[,c("edad","sexo","estado.civil","ID")]
names(datos_consorcio)
names(datos_consorcio)<-c("Age","Sex","Civil_status","ID")
names(datos_consorcio)

library("openxlsx")
?write.xlsx

# ordenamos

datos_consorcio <- datos_consorcio[order(datos_consorcio$"Age",datos_consorcio$"Sex") ,  ]

head(datos_consorcio)

# Ordenamos las variables por orden alfab.

datos_consorcio <- datos_consorcio[ ,order(names(datos_consorcio)) ]


write.xlsx(x=datos_consorcio,file="/Users/pfernandezn/Desktop/spain_data.xlsx",row.names=F)





