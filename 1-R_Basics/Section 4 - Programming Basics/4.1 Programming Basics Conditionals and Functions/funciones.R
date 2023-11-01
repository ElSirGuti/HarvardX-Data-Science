# Funciones (Estructura)
avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}
x <- 1:100
avg(x)
# > [1] 50.5
identical(mean(x),avg(x))
# > [1] TRUE

# Las variables definidas en una funcion no se guardan en el espacio de trabajo
s <- 3
avg(1:10)
# > [1] 5.5
s
# > [1] 3

# Una funcion puede tener varios argumentos
avg <- function(x, arithmetic=TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}
avg(1:10)
# [1] 5.5
avg(1:10,TRUE)
# > [1] 5.5
avg(1:10,FALSE)
# > [1] 4.53