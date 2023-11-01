# Aqui esta el data frame de homicidios agrupados por region
murders %>% group_by(region)

# A tibble: 51 × 7
# Groups:   region [4]
#   state                abb   region    population total  rate  rank
#   <chr>                <chr> <fct>          <dbl> <dbl> <dbl> <dbl>
# 1 Alabama              AL    South        4779736   135  2.82    29
# 2 Alaska               AK    West          710231    19  2.68     5
# 3 Arizona              AZ    West         6392017   232  3.63    36
# 4 Arkansas             AR    South        2915918    93  3.19    20
# 5 California           CA    West        37253956  1257  3.37    51
# 6 Colorado             CO    West         5029196    65  1.29    30
# 7 Connecticut          CT    Northeast    3574097    97  2.71    23
# 8 Delaware             DE    South         897934    38  4.23     7
# 9 District of Columbia DC    South         601723    99 16.5      2
# 10 Florida              FL    South       19687653   669  3.40    49
# ℹ 41 more rows
# ℹ Use `print(n = ...)` to see more rows

#  Aqui podemos ver la clase
murders %>% group_by(region) %>% class()
# > [1] "grouped_df" "tbl_df"     "tbl"        "data.frame"
#                                   ^
#                           Eso es un tibble

# Comparemos las diferencias en los prints de data frames y los tbls
# Data Frame:
gapminder
# Si lo convertimos en tibble es mas legible
as_tibble(gapminder)

# Si subagrupamos las columnas de un dataframe podemos obtener un objeto que 
# no es un data frame.
# Si tomamos la primera columna del data set de homicidios
class(murders[,1])
# > [1] "character"
# Con tbl esto no pasa
class(as_tibble(murders)[,1])
# > [1] "tbl_df"     "tbl"        "data.frame"
# Esto es muy util ya que algunas funciones requieren data.frames como inputs

# Con los tbls si quieres acceder a un vector que define a una columna y que
# no devuelva un data frame necesitas usar el accessor:$
class(as_tibble(murders)$state)
# > [1] "character"

# Los tbls te alertaran si intentas acceder a una columna que no existe
# Normalmente retorna null lo que lo hace dificil de resolver
murders$State
# > NULL
as_tibble(murders)$State
# > NULL
# > Warning message:
# > Unknown or uninitialised column: `State`.

# Mientras en los data frames las columnas tienen que ser vectores de strings,
# o booleanos, los tbls pueden tener listas o funciones.

# Para crear un tbl, tienes que usar la funcion tibble()
tibble(id = c(1, 2, 3), func = c(mean, median, sd))
# A tibble: 3 × 2
#     id  func  
#   <dbl> <list>
# 1     1 <fn>  
# 2     2 <fn>  
# 3     3 <fn>

# La funcion group_by() retorna un tibble especial, un grouped tibble
# La clase almacena información que le permite saber qué filas están en qué 
# grupos.
# Las funciones tidyverse, en particular, la función de resumen, conocen la 
# información del grupo. Pero tenga en cuenta que, en general, otras funciones
# de R no lo son. Una solución general a este problema es poner la función 
# dentro de un resumen (summarize()).