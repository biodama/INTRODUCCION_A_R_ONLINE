


install.packages("rio")
install_formats()


library("rio")

export(mtcars, "mtcars.csv") # comma-separated values
export(mtcars, "mtcars.rds") # R serialized
export(mtcars, "mtcars.sav") # SPSS



export(mtcars, "mtcars.tsv.zip")

x <- import("mtcars.csv")
y <- import("mtcars.rds")
z <- import("mtcars.sav")

# confirm data match
all.equal(x, y, check.attributes = FALSE)


convert("mtcars.sav", "mtcars.dta")

# https://github.com/leeper/rio

library("rio")

install_formats()

datos_curso_stata<-import("/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso3.dta")

library("readstata13")

datos_curso_stata_otro<-read.dta13("/Users/pfernandezn/Desktop/INTRODUCCION_A_R_ONLINE-main/datos/datos.curso3.dta")


sum(datos_curso_stata$"Fertility"==datos_curso_stata_otro$"Fertility") # 47
dim(datos_curso_stata) # 47

