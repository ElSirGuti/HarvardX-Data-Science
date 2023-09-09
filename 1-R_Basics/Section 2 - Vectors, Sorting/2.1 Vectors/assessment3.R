#=================================Assessment 3==================================

# Numeric Vectors
#
# A vector is a series of values, all of the same type. They are the most basic 
# data type in R and can hold numeric data, character data, or logical data. In 
# R, you can create a vector with the concatenate (or combine) function c(). 
# You place the vector elements separated by a comma between the parentheses. 
# For example a numeric vector would look something like this:
# cost <- c(50, 75, 90, 100, 150)

# # Here is an example creating a numeric vector named cost
cost <- c(50, 75, 90, 100, 150)

# Create a numeric vector to store the temperatures listed in the instructions 
# into a vector named temp
# Make sure to follow the same order in the instructions
temp <- c(Beijing=35,Lagos=88,Paris=42,Rio_de_Janeiro=84,San_Juan=81,Toronto=30)
temp

# Character Vectors
#
# As in the previous question, we are going to create a vector. Only this time, 
# we learn to create character vectors. The main difference is that these have 
# to be written as strings and so the names are enclosed within double quotes.
#
# A character vector would look something like this:
# food <- c("pizza", "burgers", "salads", "cheese", "pasta")

# here is an example of how to create a character vector
food <- c("pizza", "burgers", "salads", "cheese", "pasta")

# Create a character vector called city to store the city names
# Make sure to follow the same order as in the instructions
city <- c("Beijing","Lagos","Paris","Rio de Janeiro","San Juan","Toronto")

# Connecting Numeric and Character Vectors
#
# We have successfully assigned the temperatures as numeric values to temp and 
# the city names as character values to city. But can we associate the 
# temperature to its related city? Yes! We can do so using a code we already 
# know - names. We assign names to the numeric values.
#
# It would look like this:
# cost <- c(50, 75, 90, 100, 150)
# food <- c("pizza", "burgers", "salads", "cheese", "pasta")
# names(cost) <- food

# Associate the cost values with its corresponding food item
cost <- c(50, 75, 90, 100, 150)
food <- c("pizza", "burgers", "salads", "cheese", "pasta")
names(cost) <- food

# You already wrote this code
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Associate the temperature values with its corresponding city
names(temp) <- city

# Subsetting vectors
#
# If we want to display only selected values from the object, R can help us do 
# that easily.
#
# For example, if we want to see the cost of the last 3 items in our food list, 
# we would type:
# cost[3:5]
#
# Note here, that we could also type cost[c(3,4,5)] and get the same result. 
# The : operator helps us condense the code and get consecutive values.

# cost of the last 3 items in our food list:
cost[3:5]

# temperatures of the first three cities in the list:
temp[1:3]

# Subsetting vectors continued...
#
# In the previous question, we accessed the temperature for consecutive cities 
# (1st three). But what if we want to access the temperatures for any 2 specific
# cities?
#
# An example: To access the cost of pizza (1st) and pasta (5th food item) in our
# list, the code would be:
# cost[c(1,5)]

# Access the cost of pizza and pasta from our food list 
cost[c(1,5)]

# Define temp
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city

# Access the temperatures of Paris and San Juan
temp[c("Paris","San Juan")]

# Sequences
#
# The : operator helps us create sequences of numbers. For example, 32:99 
# would create a list of numbers from 32 to 99.
#
# Then, if we want to know the length of this sequence, all we need to do is use
# the length command.

# Create a vector m of integers that starts at 32 and ends at 99.
m <- 32:99

# Determine the length of object m.
length(m)

# Create a vector x of integers that starts at 12 and ends at 73.
x <- 12:73
# Determine the length of object x.
length(x)

# Sequences continued...
#
# We can also create different types of sequences in R. For example, in 
# seq(7, 49, 7), the first argument defines the start, and the second the end. 
# The default is to go up in increments of 1, but a third argument lets us tell 
# it by what interval.

# # Create a vector with the multiples of 7, smaller than 50.
seq(7, 49, 7) 

# Create a vector containing all the positive odd numbers smaller than 100.
# The numbers should be in ascending order
seq(1, 100, 2)

# Sequences and length
#
# The second argument of the function seq is actually a maximum, 
# not necessarily the end. So if we type
# seq(7, 50, 7)
#
# we actually get the same vector of integers as if we type
# seq(7, 49, 7)
#
# This can be useful because sometimes all we want are sequential numbers that 
# are smaller than some value.
#
# Let's look at an example.

# We can create a vector with the multiples of 7, smaller than 50 like this 
seq(7, 49, 7) 

# But note that the second argument does not need to be the last number
# It simply determines the maximum value permitted
# so the following line of code produces the same vector as seq(7, 49, 7)
seq(7, 50, 7)

# Create a sequence of numbers from 6 to 55, with 4/7 increments and determine 
# its length
x <- seq(6,55,4/7)
length(x)

# Sequences of certain length
#
# The seq() function has another useful argument. The argument length.out. This 
# argument lets us generate sequences that are increasing by the same amount 
# but are of the prespecified length.
#
# For example, this line of code
# x <- seq(0, 100, length.out = 5)
# produces the numbers 0, 25, 50, 75, 100.
# 
# Let's create a vector and see what is the class of the object produced.

# Store the sequence in the object a
a <- seq(1, 10, length.out = 100)

# Determine the class of a
class(a)

# Integers
# 
# We have discussed the numeric class. We just saw that the seq function can 
# generate objects of this class. For another example, type
# class(seq(1, 10, 0.5))
# into the console and note that the class is numeric. R has another type of 
# vector we have not described, the integer class. You can create an integer by 
# adding the letter L after a whole number. If you type
# class(3L)
# in the console, you see this is an integer and not a numeric. For most 
# practical purposes, integers and numerics are indistinguishable. 
# For example 3, the integer, minus 3 the numeric is 0. To see this type this 
# in the console
# 3L - 3
# The main difference is that integers occupy less space in the computer memory,
# so for big computations using integers can have a substantial impact.

# Store the sequence in the object a
a <- seq(1, 10)

# Determine the class of a
class(a)

# Integers and Numerics
#
# Let's confirm that 1L is an integer not a numeric.

# Check the class of 1, assigned to the object a
class(1)

# Confirm the class of 1L is integer
class(1L)

# Coercion
#
# The concept of coercion is a very important one. Watching the video, we 
# learned that when an entry does not match what an R function is expecting, 
# R tries to guess what we meant before throwing an error. This might get 
# confusing at times.
#
# As we've discussed in earlier questions, there are numeric and character 
# vectors. The character vectors are placed in quotes and the numerics are not.
#
# We can avoid issues with coercion in R by changing characters to numerics and 
# vice-versa. This is known as typecasting. The code, as.numeric(x) helps us 
# convert character strings to numbers. There is an equivalent function that 
# converts its argument to a string, as.character(x).
#
# Let's practice doing this!

# Define the vector x
x <- c(1, 3, 5,"a")

# Note that the x is character vector
x

# Redefine `x` to typecast it to get an integer vector using `as.numeric`.
# You will get a warning but that is okay
x <- as.numeric(x)
x 
