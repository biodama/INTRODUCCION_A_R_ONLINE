

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




