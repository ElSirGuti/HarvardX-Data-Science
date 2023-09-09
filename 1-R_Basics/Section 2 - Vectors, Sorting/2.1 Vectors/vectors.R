# Crear un vector usando c() (c es concatenate)
codes <- c(380,124,818)
country <- c("italy","canada","egypt")
# Si no se usan comillas R buscara variables con esos nombres y si no las hay 
# se generara una condicion de error
#
# Tambien podemos asignarle los codigos a cada valor para que se muestren como
# si fuera una tabla
codes <- c(italy=380,canada=124,egypt=818)
codes
# Y si vemos que clase es observaremos que es de tipo numerico
class(codes)
# Tambien se pueden usar comillas para los nombres, el resultado sera el mismo
codes <- c("italy"=380,"canada"=124,"egypt"=818)
codes

# Esto tambien hace lo mismo pero usamos la funcion names()
codes <- c(380, 124, 818)
country <- c("italy","canada","egypt")
names(codes) <- country
codes

# Otra funcion para crear vectores es seq()
seq(1,10)
# >>> [1]  1  2  3  4  5  6  7  8  9 10
# Un tercer argumento indica la secuencia
seq(1,10,2)
# >>> [1] 1 3 5 7 9

# Subsetting: Nos permite acceder a partes especificas de un vector y para esto 
# se usa [] 
codes[2]
# para varios elementos
codes[c(1,3)]
# de un elemento hasta otro
codes[c(1:2)]
# tambien podemos buscarlos por sus nombres
codes["canada"]
codes[c("egypt","italy")]

# Coercion de Vectores: Cuando una entrada no coincide con la esperada,
# R intenta adivinar que queriamos decir antes de arrojar un error.
# Se tiene entendido que solo se pueden introducir en un vector cosas de la
# misma clase, pero si tenemos el siguiente vector
x <- c(1,"canada",3)
# no ocurre ningun error
x
# >>> [1] "1"      "canada" "3"  
# Los demas valores se convierten en strings
class(x)
# >>> [1] "character"
# Asume que porque hay un string los demas tambien

# R ofrece funciones para forzar la coercion
# as.character sirve para convertir numeros en strings
x <- 1:5 
y <- as.character(x)
y
# x <- as.character(1:5) es una opcion viable tambien
as.numeric(y)
# as.numeric los convierte en numeros de vuelta
#
# Esto es muy util ya que en muchos datasets los numeros aparecen como strings

# Valores Perdidos: NA (Not Available)
# Cuando R falla al coercionar algo retorna NA
x <- c("1","b","3")
as.numeric(x)
# >>> [1]  1 NA  3
# >>> Warning message:
# >>> NAs introduced by coercion

# En la ciencia de datos es comun recibir NAs constantemente y es un problema
# comun en datasets de la vida real 