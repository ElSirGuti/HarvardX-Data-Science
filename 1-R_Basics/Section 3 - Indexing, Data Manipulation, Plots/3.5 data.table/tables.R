library(data.table)
library(dslabs)
data(murders)

# El primer paso para usar data.table es convertir el data frame en un objeto
# data.table usando la funcion setDT
murders <- setDT(murders)

# Con data table usamos una notacion similar a dplyr para seleccionar columnas
murders[,c("state","region")] |> head()
# Tambien podemos hacerlo de esta forma para que R sepa que son titulos y no
# objetos usando .()
murders[,.(state,region)] |> head()

# Con data.table se usa un acercamiento que evita una nueva asignacion y esto
# se llama actualizacion por referencia
# Y esto se hace con :=
murders[, rate := total / population * 100000]
# Para definir varias columnas nuevas usamos la funcion ":="
murders[, ":="(rate = total / population * 100000, rank = rank(population))]

# Data.table se usa para evitar malgastar memoria
# en este caso
x <- data.table(a = 1)
y <- x
# y no es un nuevo objeto sino una referencia a x
# sin embargo := cambia por referencia, asi que si cambias x, un nuevo objeto
# no se crea y "y" sigue siendo un nuevo nombre para x
x[,a:=2]
y
#    a
# 1: 2
# Tambien se puede cambiar a x asi
y[,a :=1]
x
#    a
# 1: 1
# Para evitar esto podemos usar copy() que fuerza que se cree una copia del
# data set, asi:
x <- data.table(a = 1)
y <- copy(x)
x[,a := 2]
y

# Filtrar columnas
murders[rate <= 0.7]
# Podemos filtrar y seleccionar a la vez
murders[rate <= 0.7, .(state, rate)]

# Podemos usar tambien data.table para subagrupar y resumir informacion

library(dslabs)
data(heights)
heights <- setDT(heights)

# Podemos llamar funciones dentro de .() asi:
s <- heights[, .(average = mean(height), standard_deviation = sd(height))]
s
# o asi:
s <- heights[sex == "Female",
             .(average = mean(height), standard_deviation = sd(height))]
s

# Ahora computemos varios resumenes
median_min_max <- function(x){
  qs <- quantile(x, c(0.5, 0, 1))
  data.frame(median = qs[1],minimun = qs[2], maximum = qs[3])
}
heights[, .(median_min_max(height))]

# Computemos resumenes de varios grupos
heights[, .(average = mean(height), standard_deviation = sd(height)), by = sex]


# Podemos ordenar la data de homicidios basado en la poblacion de cada estado
murders[order(population)] |> head()

# Para ordenar de forma decreciente podemos usar "-" o decreasing
murders[order(population, decreasing = TRUE)]

# Tambien podemos anidar el orden, en este caso por region y taza
murders[order(region,rate)]