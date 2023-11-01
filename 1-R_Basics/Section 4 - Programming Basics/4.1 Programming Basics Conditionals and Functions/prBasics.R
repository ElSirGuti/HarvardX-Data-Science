# Condicionales (Estructura)
a <- 2
if(a!=0){
  print(1/a)
} else {
  print("No reciprocal for 0.")
}

# Hagamos un ejemplo con los homicidios
library(dslabs)
data("murders")
murder_rate <- murders$total/murders$population * 10^5

ind <- which.min(murder_rate)
if(murder_rate[ind] < 0.5){
  print(murders$state[ind])
} else {
  print("No state has murder rate that low")
}
# > [1] "Vermont"

# ifelse: Toma 3 argumentos, uno logico y dos respuestas posibles
# Si el logico se cumple se devuelve la primera respuesta sino la segunda
a <- 0
ifelse(a > 0, 1/a, NA)
# > NA
a <- c(0,1,2,-4,5)
result <- ifelse(a > 0, 1/a, NA)
result
# > [1]  NA 1.0 0.5  NA 0.2

# Tratemos de rellenar los huecos de NAs con otro valor
data("na_example")
sum(is.na(na_example))
# > [1] 145
# Lo que haremos es crear un vector que reemplace los NAs con 0
no_nas <- ifelse(is.na(na_example), 0, na_example)
sum(is.na(no_nas))
# > [1] 0

# any(): Toma un vector de valores logicos y devuelve TRUE si alguna de las
# entradas es true
z <- c(TRUE, TRUE, FALSE)
any(z)
# > [1] TRUE
z <- c(FALSE, FALSE, FALSE)
any(z)
# > FALSE

# all(): Toma un vector de valores logicos y devuelve TRUE si todos los valores
# son TRUE
z <- c(TRUE, TRUE, FALSE)
all(z)
# > [1] FALSE
z <- c(TRUE, TRUE, TRUE)
all(z)
# > [1] TRUE