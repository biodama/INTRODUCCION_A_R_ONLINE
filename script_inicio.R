

rm(list=ls())
gc()

# Paquetes

library("openxlsx")



# Info versiones software



# Datos

setwd("/Users/pfernandezn/Desktop/")

datos <- read.xlsx(xlsxFile = "curso_intro_r/datos/datos.curso1.xlsx",sheet=1)


# Quality control, recodificaciones y sub-base

class(datos)
str(datos)
head(datos)
dim(datos)


class(datos$"sexo")
table(datos$"sexo",exclude=NULL)
sum(is.na(datos$"sexo"))

datos$"sexo_new" <- datos$"sexo"
datos$"sexo_new"[datos$"sexo_new"=="Mujer"] <- 1
datos$"sexo_new"[datos$"sexo_new"=="Hombre"] <- 0

datos$"fumador"<-NULL
head(datos)

datos$"ratio"<-datos$"altura"/datos$"peso"
range(datos$"ratio")

# Sub-base de mujeres

datos_mujeres <- datos[datos$"sexo"=="Mujer", ]

# Ordenacion
class(datos$"edad")
range(datos$"edad")

# datos_mirar<-datos_mujeres[datos_mueres$"edad">=200,]

datos_mujeres <- datos_mujeres[order(datos_mujeres$"edad") , ]
row.names(datos_mujeres) <- NULL

# Exportamos

save(datos,datos_mujeres,file="workspace_datos_depurados.RData")




