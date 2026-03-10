
# SCRIPT DEL CURSO

# ayuda
?rnorm

# Instalar paquetes adicionales

?install.packages
install.packages(pkgs="openxlsx")

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


