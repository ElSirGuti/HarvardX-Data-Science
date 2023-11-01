#================================Assessment 10==================================

# Conditionals
# What will this conditional expression return? Run it from the console.
x <- c(1,2,-3,4)
if(all(x>0)){
  print("All Positives")
} else{
  print("Not All Positives")
}
# > [1] "Not All Positives"

# Conditional continued
# Which of the following expressions is always FALSE when at least one entry of 
# a logical vector x is TRUE? You can try examples in the R console.
x <- c(TRUE, FALSE)
x <- c(TRUE, TRUE)
x <- c(FALSE, FALSE)
all(!x)

# ifelse
# The function nchar tells you how many characters long a character vector is. 
# For example:
#
# char_len <- nchar(murders$state)
# head(char_len)
#
# The function ifelse is useful because you convert a vector of logicals 
# into something else. For example, some datasets use the number -999 to 
# denote NA. A bad practice! You can convert the -999 in a vector to NA 
# using the following ifelse call:
#
# x <- c(2, 3, -999, 1, 4, 5, -999, 3, 2, 9)
# ifelse(x == -999, NA, x)
#
# If the entry is -999 it returns NA, otherwise it returns the entry.

# Assign the state abbreviation when the state name is longer than 8 characters 
library(dslabs)
data(murders)

# Solucion correcta
new_names <- ifelse(nchar(murders$state) > 8, murders$abb, murders$state)
new_names

# Otra solucion (correcta pero no es la que pide)
new_names <- murders %>%
  select(state, abb)

ifelse(nchar(new_names$state) > 8, murders$abb, murders$state)

# Defining functions
# You will encounter situations in which the function you need does not already
# exist. R permits you to write your own. Let's practice one such situation, 
# in which you first need to define the function to be used. The functions 
# you define can have multiple arguments as well as default values.
# 
# To define functions we use function. For example the following function 
# adds 1 to the number it receives as an argument:
#
# my_func <- function(x){
#   y <- x + 1
#   y
# }
#
# The last value in the function, in this case that stored in y, gets returned.
#
# If you run the code above R does not show anything. This means you defined 
# the function. You can test it out like this:
#
# my_func(5)
#

# Create function called `sum_n`
sum_n <- function(x){
  n <- c(1:x)
  sum(n)
}
# Use the function to determine the sum of integers from 1 to 5000
sum_n(5000)

# Defining functions continued...
# We will make another function for this exercise. We will define a function 
# altman_plot that takes two arguments x and y and plots the difference y-x
# in the y-axis against the sum x+y in the x-axis.
# You can define functions with as many variables as you want. For example, 
# here we need at least two, x and y. The following function plots log 
# transformed values:
# 
# log_plot <- function(x, y){
#   plot(log10(x), log10(y))
# }
#
# This function does not return anything. It just makes a plot.

# Create `altman_plot` 
altman_plot <- function(x,y){ 
  plot(x+y,y-x)
}

# asignando valores random
altman_plot(5,10)

# Lexical scope
# Lexical scoping is a convention used by many languages that determine when an 
# object is available by its name. When you run the code below you will see 
# which x is available at different points in the code.
#
# x <- 8
# my_func <- function(y){
#  x <- 9
#  print(x)
#  y + x
# }
# my_func(x)
# print(x)
#
# Note that when we define x as 9, this is inside the function, but it is 8 
# after you run the function. The x changed inside the function but not outside.

# Run this code 
x <- 3
my_func <- function(y){
  x <- 5
  y+5
}

# Print the value of x 
print(x)

# For loops
# In the next exercise we are going to write a for-loop. In that for-loop we 
# are going to call a function. We define that function here.

# Here is an example of a function that adds numbers from 1 to n
example_func <- function(n){
  x <- 1:n
  sum(x)
}

# Here is the sum of the first 100 numbers
example_func(100)

# Write a function compute_s_n with argument n that for any given n computes 
# the sum of 1 + 2^2 + ...+ n^2
compute_s_n <- function(n) {
  # Inicializamos la variable sum como 0
  sum <- 0
  
  # iteramos los numeros de 1 a n
  for (i in 1:n) {
    # sumamos el cuadrado de i a la suma
    sum <- sum + i^2
  }
  
  # imprimimos sum
  print(sum)
}
# Report the value of the sum when n=10
compute_s_n(10)

# For loops continued...
# Now we are going to compute the sum of the squares for several values of n 
# We will use a for-loop for this. Here is an example of a for-loop:
#
# results <- vector("numeric", 10)
# n <- 10
# for(i in 1:n){
#  x <- 1:i
#  results[i] <- sum(x)
# }
#
# Note that we start with a call to vector which constructs an empty vector 
# that we will fill while the loop runs.

# Define a function and store it in `compute_s_n`
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Create a vector for storing results
s_n <- vector("numeric", 25)

# write a for-loop to store the results in s_n
for (i in seq(1, 25, 1)) {
  # call compute_s_n with i and store in s_n[i]
  s_n[i] <- compute_s_n(i)
}


# Checking our math
# If we do the math, we can show that
#
# S_n = 1^2 + 2^2 + 3^2 + \dots + n^2 = n(n+1)(2n+1)/6 
# 
# We have already computed the values of S_n from 1 to 25 using a for loop.
# If the formula is correct then a plot of S_n versus n should look cubic.
#
# Let's make this plot.

# Define the function
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Define the vector of n
n <- 1:25

# Define the vector to store data
s_n <- vector("numeric", 25)
for(i in n){
  s_n[i] <- compute_s_n(i)
}

#  Create the plot 
plot(n,s_n)

# Checking our math continued
# Now let's actually check if we get the exact same answer.

# Define the function
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Define the vector of n
n <- 1:25

# Define the vector to store data
s_n <- vector("numeric", 25)
for(i in n){
  s_n[i] <- compute_s_n(i)
}

# Check that s_n is identical to the formula given in the instructions.
identical(s_n, n*(n+1)*(2*n+1)/6)
