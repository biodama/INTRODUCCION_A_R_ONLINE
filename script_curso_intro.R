

####################################
####################################
###  Mi primer script de R       ###
####################################
####################################

# Packages


install.packages("openxlsx")

library("read.xlsx")

?read.xlsx

# Otras cosas de paquetes

require()

ls("package:openxlsx")

sessionInfo()


########################################

# Inicio de sesion

rm(list=ls()) # para borrar todo
gc()


rm(list=ls());gc() # otra forma


library("openxlsx")
library("readstata13")
library("accumulate")

ls()  # listar objetos creados/cargados


# Creacion objetos

x <- c(7,10,3)

z <- c(TRUE,FALSE,TRUE)
z_esp<-c("TRUE","FALSE","TRUE")

y <- c("Low","Low","Medium","High")
y_esp<-c(2,1,"Medium")

y_esp<-c(2,2)

Y_esp<-c(4,6,7)

matrix1 <- matrix(c(10,6,23,44),ncol=2)

"y_esp"%in%ls()
"matrix1"%in%ls()

mi_data_frame <- data.frame(ID=c("gen0",
"genB","genZ"),
subj1 = c(10, 25, 33), 
subj2 = c(NA, 34, 15), 
oncogen = c(TRUE, TRUE,FALSE),
loc = c(1,30,125),
chr = c("X","4","6"))




