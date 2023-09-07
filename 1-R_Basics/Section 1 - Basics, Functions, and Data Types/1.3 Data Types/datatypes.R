# Asi se puede ver la clase de una variable
a <- 2
class(a)
# >>> [1] "numeric"
class(ls)
# >>> [1] "function"

# Para almacenar grandes cantidades de informacion
# se usan los datasets que son tablas con datos
library(dslabs)
data("murders")
# para revisar si es un data frame
class(murders)
# >>> [1] "data.frame"
# Si queremos saber mas usamos str() que es structure of
# an object
str(murders)
# Podemos ver que tiene 51 filas (observations)
# La columna de la izquierda contiene los nombres de las variables
#
# Para ver las 6 primeras lineas usamos head()
head(murders)
# Para acceder a una variable en especifico usamos $
# que se le conoce como accessor
murders$population
# Para saber que variables hay tambien se puede usar names()
names(murders)
# Para conocer la cantidad de espacios en un vector
pop <- murders$population
length(pop)
# >>> [1] 51
class(pop)
# >>> [1] "numeric"

# USAR comillas para distinguir variables de strings
a <- 1
a
# >>> [1] 1
"a"
# >>> [1] "a"

# EL accessor tambien se puede usar para cadenas de caracteres
class(murders$state)
# [1] "character"

# Vectores logicos
z <- 3 == 2
z
# >>> [1] FALSE
class(z)
# >>> [1] "logical"
#
# == Es un operador relacional diferente de =

# Factores: Se usan para guardar data categorizada
# Las regiones estan categorizadas, solo hay 4
class(murders$region)
# >>> [1] "factor"
#
# Para ver los niveles usamos levels()
levels(murders$region)
# >>> [1] "Northeast"     "South"         "North Central" "West"
# Almacenar datos de forma categorica es mas eficiente en terminos de memoria
# Es recomendable evitar usar factors pero para ciertos modelos estadisticos
# son necesarios