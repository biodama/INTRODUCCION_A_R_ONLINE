
rm(list=ls())
gc()

# Paquetes


# Datos

setwd("/Users/pfernandezn/Desktop/")

load("workspace_datos_depurados.RData")

# Graficas

plot(x=datos$"altura",y=datos$"peso",xlab="ALTURA",ylab="PESO")

# Modelo de asocacion

modelo<-lm(peso~altura,data=datos)

summary(modelo)

modelo2<-lm(peso~ altura + sexo,data=datos)

summary(modelo2)


modelo_mujeres<-lm(peso~altura,data=datos_mujeres)
modelo_mujeres<-lm(peso~altura,data=datos[datos$"sexo"=="Mujer",])





