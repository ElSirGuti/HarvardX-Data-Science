library(dslabs)
data(murders)

# Para saber cual es el estado con mas poblacion
murders$state[which.max(murders$population)]
# >>> [1] "California"
# Para solo saber la maxima poblacion
max(murders$population)
# >>> [1] 37253956

# Para que sea mas justo hay que computar los asesinatos per capita

# Supongamos que tenemos varias alturas en pulgadas y queremos pasarlas a cm
heights <- c(69,62,66,70,73,67,73,67,70)
# Fijate en lo que pasa cuando multiplicamos el objeto heights por 2.54
heights * 2.54
# >>> [1] 175.26 157.48 167.64 177.80 185.42 170.18 185.42 170.18 177.80

# Supongamos que queremos saber que tan por encima o por debajo estan las
# medidas del promedio (suponiendo que es 69 pulgadas)
heights - 69
# >>> [1]  0 -7 -3  1  4 -2  4 -2  1

# Si tenemos dos vectores del mismo tamaño estas operaciones son mas poderosas
# a     e     a+e
# b     f     b+f
# c  +  g  =  c+g
# d     h     d+h
# Se va sumando entrada por entrada y lo mismo para otras operaciones

# Esto implica que para computar la tasa de asesinatos, asesinatos por cada
# 100,000 habitantes simplemente escribimos
murder_rate <- (murders$total / murders$population) * 100000
murder_rate
# Con esto vemos que ya california no esta en el tope de nuestra lista
murders$state[order(murder_rate,decreasing = TRUE)]
# California esta fuera del top 10 y el que tiene la tasa de asesinatos
# mas alta es District of Columbia
