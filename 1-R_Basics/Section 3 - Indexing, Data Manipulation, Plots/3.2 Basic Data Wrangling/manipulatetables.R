# Ya hemos aprendido varias formas para ordenar tablas
# Ahora toca introducir la libreria dplyr

# Instalamos
install.packages("dplyr")
# Cargamos la libreria dplyr
library(dplyr)

# Este paquete introduce funciones que realizan las operaciones mas comunes en 
# manipulacion de datos y las funciones tienen nombres faciles de recordar.

# mutate(): Para cambiar una tabla de datos agregando una columna o para cambiar
# una existente usamos mutate()

# filter(): Para filtrar la data por subconjuntos de filas, usamos la funcion 
# filter()

# select(): Y para subconjuntos de datos seleccionando columnas específicas, 
# usamos select()

# Podemos tambien realizar series de operaciones, por ejemplo select() para esto
# y luego filter() para enviar los resultados de una funcion a otra funcion 
# usando lo que se conoce como 'pipe operator' %>%

# Volviendo a nuestro ejemplo vamos a añadir la tasa de asesinatos al dataframe.
#
# La funcion mutate toma el dataframe como primer argumento y el nombre y valor
# de la variable en el segundo argumento.
# Usaremos la forma name = value

# Para agregar la tasa de homicidios hacemos lo siguiente
murders <- mutate(murders,rate=total/population*100000)
# Notese que se esta usando total y population variables las cuales no estan
# definidas en este espacio de trabajo. Lo que pasa es que la funcion mutate()
# sabe buscar estas variables en el dataframe en vez del espacio de trabajo.
# Podemos ver la nueva columna escribiendo:
head(murders)
# (si volvemos a cargar la tabla murders del paquete dslabs se sobreescribira
# esta nueva columna).

# Pasemos a la funcion filter(). Supongamos que queremos que se filtre en la
# tabla de tal manera que solo se muestre las entradas para las cuales la 
# taza de homicidios es menor a 0.71, para esto se usa la funcion filter() que
# toma la tabla de datos como primer argumento y la sentencia condicional
# como el siguiente argumento.
# Como en la funcion mutate() podemos utilizar los nombres de las variables de
# la tabla dentro de la funcion y sabremos que nos referimos a las columnas y
# no a los objetos en el espacio de trabajo.
filter(murders,rate <= 0.71)

# Y por ultimo la funcion select(). A pesar que nuestra tabla solo tiene 6
# columnas algunas tablas tienen cientos de columnas, asi que usualmente util
# seleccionar solo las columnas con las que queremos trabajar
new_table <- select(murders,state,region,rate)
# Una vez definimos este nuevo objeto lo filtramos
filter(new_table,rate <= 0.71)

# Ahora vamos a unirlas usando %>%. Con dplyr podemos ahorrarnos lo hecho
# anteriormente, podemos escribir codigo que se parezca mas a la descripcion
# de lo que queremos que haga, tomar la data original, seleccionar algunas
# columnas y luego filtrar unas filas
# data -> select -> filter
# Para operaciones asi usamos el pipe 
murders %>% select(state,region,rate) %>% filter(rate <= 0.71)

# Para muchos de los analisis que vamos a hacer con dplyr vamos a necesitar
# crear dataframes en R, esto se puede hacer usando la funcion data.frame()
grades <- data.frame(names=c("John","Juan","Jean","Yao"),
                     exam_1 = c(95, 80, 90, 85),
                     exam_2 = c(90, 85, 85, 90))
grades
# En versiones anteriores de R data.frame toma los caracteres como factors y 
# para evitar esto se usa lo siguiente
grades <- data.frame(names = c("John", "Juan", "Jean", "Yao"), 
                     exam_1 = c(95, 80, 90, 85), 
                     exam_2 = c(90, 85, 85, 90),
                     stringsAsFactors = FALSE) 
grades
class(grades$names)
