#=================================Assessment 1=================================
# 
# Using Variables 1
#
# What is the sum of the first n
# positive integers?
# We can use the formula 
# n(n+1)/2
# to quickly compute this quantity.
#
# Here is how you compute the sum for the first 20 integers
20*(20+1)/2 

# However, we can define a variable to use the formula for other values of n
n <- 20
n*(n+1)/2

n <- 25
n*(n+1)/2

# Below, write code to calculate the sum of the first 100 integers
n <- 100
n*(n+1)/2

# Using variables 2
#
# What is the sum of the first 1000 positive integers?
# 
# We can use the formula
# n(n+1)/2
# to quickly compute this quantity.
#
# Below, write code to calculate the sum of the first 1000 integers 
#
n <- 1000
n*(n+1)/2

# Functions
#
# Run the following code in the R console:
#
# n <- 1000
# x <- seq(1,n)
# sum(x)
#
# Based on the result, what do you think the functions seq and sum do? 
# You can use the help system.
#
# Answer: seq creates a list of numbers and sum adds them up.

# Nested function calls 1
#
# In math and programming we say we evaluate a function when we replace 
# arguments with specific values. So if we type log2(16) we evaluate the log2 
# function to get the log base 2 of 16 which is 4.
# In R it is often useful to evaluate a function inside another function. 
# For example, sqrt(log2(16)) will calculate the log to the base 2 of 16 and 
# then compute the square root of that value. So the first evaluation gives a 4 
# and this gets evaluated by sqrt to give the final answer of 2.
#
# log to the base 2 
log2(16)

# sqrt of the log to the base 2 of 16:
sqrt(log2(16))

# Compute log to the base 10 (log10) of the sqrt of 100. Do not use variables.
log10(sqrt(100))

# Nested functions call 2
#
# Which of the following will always return the numeric value stored in x? 
# You can try out examples and use the help system in the R console.
#
# Answer: log(exp(x))
#
#==============================End of Assessment 1==============================





