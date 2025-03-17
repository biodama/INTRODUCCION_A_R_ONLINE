
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


#######################################################
#######################################################
#  WORKSPACE (ESPACIO DE TRABAJO)
#######################################################
#######################################################

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
tabla
tabla2
tabla3


# Comandos variados
# ;

datos.estudio <- c(1,2,3);datos.estudio2<-c("A", "B", "C")


datos.estudio <- c(1,2,3)
datos.estudio2<-c("A", "B", "C")




