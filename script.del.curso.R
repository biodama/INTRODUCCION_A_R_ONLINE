
# MI PRIMER SCRIPT

ls() # con esto veo los nombres de los objetos que hay en el workspace

x<-c("a","b","c")

datos<-data.frame(ID=c(23,45,65),peso=c(50,55,100))

mi.lista <- list(datos,x) # una lista que quiero

ls()

# Salvo todos los objetos en formato R (formato mac o linux)
save.image("/Users/pfernandezn/Desktop/mi_workspace1.RData")

# Salvo todos los objetos en formato R (formato windows)
save.image("C:\\Users\\pfernandezn\\Desktop\\mi_workspace1.RData")

# Salvo algunos objetos en formato R (formato mac)
save(x,mi.list,file="/Users/pfernandezn/Desktop/mi_workspace2.RData")

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










