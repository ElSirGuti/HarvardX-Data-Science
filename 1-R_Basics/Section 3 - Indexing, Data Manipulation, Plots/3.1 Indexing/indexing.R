# Indexando

library(dslabs)
data(murders)

# Definimos la tasa de homicidios
murder_rate <- murders$total/murders$population*100000
murder_rate

# Creamos un vector logico que nos indique cuales estados tienen una tasa
# menor/menor o igual a 0.71

index <- murder_rate < 0.71
index
index <- murder_rate <= 0.71
index

# En la salida los valores que sean TRUE es porque son los que tienen una tasa
# menor a 0.71

# Para saber que estados son usamos lo siguiente
murders$state[index]
# >>> [1] "Hawaii"        "Iowa"          "New Hampshire"
# >>> [4] "North Dakota"  "Vermont"   

# Usamos sum() para sumar el acumulado de los valores que sean TRUE en el vector
# Por cada TRUE se suma 1 y por cada FALSE 0
sum(index)
# >>> [1] 5
# Solo 5 estados tienen una tasa menor a 0.71

# Operadores Logicos
# +----------+-------------------+
# | Operador |    Descripcion    |
# +----------+-------------------+
# |    <     |     Menor que     |
# |    <=    | Menor o igual que |
# |    >     |     Mayor que     |
# |    >=    | Mayor o igual que |
# |    ==    |     Igual que     |
# |    !=    |   Diferente que   |
# |    !     |        NOT        |
# |    |     |        OR         |
# |    &     |        AND        |
# +----------+-------------------+

# Usando & (AND) podemos buscar en el vector logico que estados cumplen ambas
# condiciones

# Queremos que este en el Oeste
west <- murders$region == "West"
# Y que la tasa de homicidios sea menor o igual a 1
safe <- murder_rate <= 1
# Ahora juntemos estas dos para ver que estados cumplen las condiciones
index <- safe & west
# Solo sera TRUE cuando ambas entradas sean TRUE
# Asi que busquemos que estados cumplen estas condiciones
murders$state[index]
# >>> [1] "Hawaii"  "Idaho"   "Oregon"  "Utah"    "Wyoming"

# Indexando funciones

# which: Nos devuelve las entradas de un vector logico que sean TRUE
x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)
# >>> [1] 2 4 5
# Esos son los indices de x que son TRUE
# Esto se puede usar cuando el vector a indexar es muy largo, con esto tenemos
# solo los indices y no el vector completo
# Supongamos que queremos averiguar la tasa de homicidios en Massachusetts
index <- which(murders$state == "Massachusetts")
index
# >>> [1] 22
# El indice es 22 porque es la unica entrada con ese valor
# Y para obtener la tasa de homicidios
murder_rate[index]
# >>> [1] 1.802179
# No necesariamente habia que usar which para lo que hicimos anteriormente
# pudimos hacer solo esto
index <- murders$state == "Massachusetts"
murder_rate[index]
# >>> [1] 1.802179

# match: Busca las entradas de un vector y devuelve el indice necesario para
#        acceder a el
# Supongamos que en vez de un estado, queremos hallar la tasa para varios
# estados como New York, Florida y Texas, para eso usamos match
# Esta funcion nos dice cuales indices del segundo vector corresponde a las 
# entradas del primer vector
index <- match(c("New York","Florida","Texas"),murders$state)
index
# >>> [1] 33 10 44
# Para confirmar que lo hicimos bien
murders$state[index]
# >>> [1] "New York" "Florida"  "Texas" 
murder_rate[index]
# >>> [1] 2.667960 3.398069 3.201360

# %in%: Si en vez de un indice queremos saber si un elemento de un primer vector
# esta o no en un segundo vector, usamos esta funcion
x <- c("a","b","c","d","e")
y <- c("a","d","f")
y %in% x
# >>> [1]  TRUE  TRUE FALSE
# Supongamos que no estas seguro si Boston, Dakota y Washington son estados y'
# queremos averiguarlo
c("Boston","Dakota","Washington") %in% murders$state
# >>> [1] FALSE FALSE  TRUE
# Podemos ver que Boston y Dakota no son estados pero Washington si