# Inicializar variables. Se puede con <- ó = 
a <- 1
b <- 1
c <- -1

# Ecuación cuadrática
(-b + sqrt(b^2 - 4*a*c)) / (2*a)
(-b - sqrt(b^2 - 4*a*c)) / (2*a)

# Logaritmos
log(8)
log(a)

# exp() se refiere al número e
exp(1)
log(2.718)

log(exp(1))

# con help() abre una ventana con la información
# de cierta función al igual que ?func
help("log")
?log

# args() te muestra los argumentos que requiere
# cierta función
args(log)

log(8,base=2)
log(x=8,base=2)
log(8,2)

2^3
?"+"

# Esto muestra los datasets que hay predefinidos
data()
CO2

# Pi e infinito
pi
Inf

# Reglas para nombres de variables en R
# 1- Tienen que empezar con letras
# 2- No pueden contener espacios
# 3- Evita usar nombres de objetos ya definidos 
#    en R. EJ: install.packages
# 4- Usa palabras descriptivas y minusculas