# Para organizar datos en forma ascendente usamos sort()
library(dslabs)
data(murders)
sort(murders$total)

# order() toma el vector y nos dice el indice de cada valor
x <- c(31,4,15,92,65)
x
sort(x)
index <- order(x)
x[index]

# Probemos con los estados
murders$state[1:10]
murders$abb[1:10]
index <- order(murders$total)
murders$abb[index]
# Si queremos saber cual es el valor mayor usamos max()
max(murders$total)
# >>> [1] 1257
# which.max nos da el indice donde esta este dato
i_max <- which.max(murders$total)
i_max
# >>> [1] 5
murders$state[i_max]
# >>> [1] "California"
#
# Para el minimo el procedimiento es el mismo con min()
min(murders$total)
# >>> [1] 2
# which.min nos da el indice donde esta este dato
i_min <- which.min(murders$total)
i_min
# >>> [1] 46
murders$state[i_min]

# rank() the da el rank de la primera entrada, segunda, etc
x <- c(31,4,15,92,65)
x
rank(x)
# >>> [1] 3 1 2 5 4
# 31 es el tercer valor mas chico (3) 
# 4 es el valor mas chico (1)
# 15 es el segundo mas chico (2)

# Tabla para entender mejor
# +--------+----+-----+----+
# |original|sort|order|rank|
# +--------+----+-----+----+
# |   31   |  4 |  2  |  3 |
# |    4   | 15 |  3  |  1 |
# |   15   | 31 |  1  |  2 |
# |   92   | 65 |  5  |  5 |
# |   65   | 92 |  4  |  4 |
# +--------+----+-----+----+
