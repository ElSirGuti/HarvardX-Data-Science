# Bucles FOR
# Hacemos una funcion que compute la suma de enteros de 1 hasta n
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
}
compute_s_n(3)
# > [1] 6
compute_s_n(100)
# > [1] 5050
compute_s_n(2023)
# > [1] 2047276

# Ejemplo sencillo usando for
for(i in 1:5){
  print(i)
}
# > [1] 1
# > [1] 2
# > [1] 3
# > [1] 4
# > [1] 5

m <- 25
# creamos un vector vacio
s_n <- vector(length = m)
for(n in 1:m){
  s_n[n] <- compute_s_n(n)
}

# Para saber si lo hicimos bien podemos hacer una grafica
n <- 1:m
plot(n, s_n)


# Podemos unir los puntos de la grafica usando lineas
plot(n, s_n)
lines(n, n*(n+1)/2)
