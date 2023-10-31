library(tidyverse)
library(dplyr)
# summarize(): Provee una forma para computar resumenes estadisticos con
# codigo legible e intuitivo.

# Pasemos con un ejemplo
library(dslabs)
data(murders)
murders <- mutate(murders,rate=total/population * 10^5)
# Calculemos el minimo, la mediana y la taza maxima de asesinatos para estados
# en la region del oeste.
s <- murders %>%
  filter(region == "West") %>%
  summarize(minimun = min(rate),
            median = median(rate),
            maximun = max(rate))
s
# Supongamos que queremos computar la taza de homicidios para el pais entero
mean(murders$rate) # >>> [1] 2.779125
# Sacar la media asi no da la respuesta correcta porque algunos estados tienen
# mayor poblacion que otros entonces necesitan tener mas peso, entonces usamos
# lo siguiente:
us_murder_rate <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^5)
us_murder_rate
# >>>      rate
# >>> 1 3.034555

# quantile(): Podemos calcular tambien el minimo,mediana y maximo con una sola 
# linea de codigo con esta funcion.

# Ejemplo
quantile(murder_rate, c(0,0.5,1))

murders %>%
  filter(region == "West") %>%
  summarize(range = quantile(rate, c(0,0.5,1)))
range
# >>> 1 0.514592
# >>> 2 1.292453
# >>> 3 3.629527

# Si lo queremos tener en columnas como hicimos previamente, necesitamos
# escribir una funcion que devuelva un data frame en vez de un vector
my_quantile <- function(x){
  r <- quantile(x, c(0,0.5,1))
  data.frame(minimum = r[1], median = r[2], maximum = r[3])
}
murders %>%
  filter(region == "West") %>%
  summarize(my_quantile(rate))
#    minimum   median  maximum
# 1 0.514592 1.292453 3.629527

# La mayoria de las funciones de dplyr siempre suelen devolver un dataframe
# Esto puede ser problematico si quieres usar el resultado con funciones que
# requieran un valor numerico. Para obtener valores numericos o vectores, 
# se usa el signo de dolar o la funcion pull() de dplyr

us_murder_rate %>% pull(rate)

# Si queremos guardar el numero con una sola linea de codigo
us_murder_rate <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^5) %>%
  pull(rate)
us_murder_rate
# Ahora podemos ver que si es un valor numerico
class(us_murder_rate)
# >>> [1] "numeric"

# Una forma para acceder al data frame que va a ser "piped" usamos el punto .
# Ejemplo
us_murder_rate <- murders %>%
  summarize(rate = sum(total)/sum(population) * 10^5) %>%
  .$rate
us_murder_rate
# >>> [1] 3.034555
class(us_murder_rate)
# >>> [1] "numeric"

# group_by(): Una operacion comun en la exploracion de datos es primero dividir
# la informacion en varios grupos y luego computar resumenes para cada grupo.
# Si queremos hacerlo con la media de homicidios por region en los EE.UU
# esta funcion nos permite hacerlo
murders %>% group_by(region)
# El resultado es nuevo dataframe llamado data frame agrupado

# Mira lo que pasa cuando resumimos la informacion luego de agrupar
murders %>%
  group_by(region) %>%
  summarize(median = median(rate))

# A tibble: 4 × 2
#   region        median
#   <fct>          <dbl>
# 1 Northeast       1.80
# 2 South           3.40
# 3 North Central   1.97
# 4 West            1.29

# arrange():Ya sabemos usar funciones como order() y sort(), pero para ordenar
# tablas enteras la funcion arrange es muy util.
# Aqui ordenamos los estados por cantidad de poblacion
murders %>% arrange(population) %>% head()
# Ordenar por taza de homicidios
murders %>% arrange(rate) %>% head()

# desc(): Si queremos ordenar de forma descendente la tabla
# Aqui ordenamos los estados por cantidad de poblacion
murders %>% arrange(desc(population)) %>% head()
# Ordenar por taza de homicidios
murders %>% arrange(desc(rate)) %>% head()
# aunque usando -population o -rate tambien hacemos lo mismo

# Si estamos ordenando una tabla y hay empates podemos usar una segunda
# o tercera columna para romper estos empates
# Ordenar por region y taza
murders %>% arrange(region, rate) %>% head()

# top_n(): Hemos usado head() para evitar que muestre una lista tan amplia
# pero con esta funcion podemos indicar cuantos registros queremos ver.
# Para el top 10
murders %>% top_n(10,rate)
# Para el top 10 ordenados por taza de asesinatos
murders %>% arrange(desc(rate)) %>% top_n(10)
