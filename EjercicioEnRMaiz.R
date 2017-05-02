# Mi script explorando maiz
# Arturo Morales Lopez

# 1) Cargar en una df llamada fullmat el archivo 'Prac_uni6/maices/meta/maizteocintle_SNP50k_meta_extende.txt'.
fullmat <- read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt", header = TRUE, sep="\t")

# 2) ¿Que tipo de objeto creamos al cargar la base?
class(fullmat)

# 3) ¿Cómo se ven las primeras 6 líneas del archivo?
head(fullmat[1:6])

# 4) ¿Cuántas muestras hay?
nrow(fullmat)

# 5) ¿De cuántos estados se tienen muestras?
length(levels(fullmat$Estado))

# 6) ¿Cuántas muestras fueron colectadas antes de 1980?
sum(fullmat$A.o._de_colecta<1980, na.rm = TRUE)

# 7) ¿Cuántas muestras hay de cada raza?
table(fullmat$Raza)

# 8) En promedio, ¿a qué altitud fueron colectadas las muestras?
mean(fullmat$Altitud)

# 9) ¿y a quá altitud máxima y mínima fueron colectadas?
range(fullmat$Altitud)

# 10) Crea una nueva df de datos sólo con las muestras de la raza Olotillo
Olotillo<-fullmat[fullmat$Raza == "Olotillo",]

# 11) Crea una nueva df de datos sólo con las muestras de la Raza Reventador, Jala y Ancho.
TresRazas<- subset(fullmat, Raza == "Reventador"|Raza == "Jala"|Raza == "Ancho")

# 12) Escribe la matriz anterior en un archivo llamado "submat.cvs en /meta.
write.csv(TresRazas, "../meta/submat.csv") 

