#================================Assessment 2=================================

# str
#
#We're going to be using the following dataset for this module. Run this code in
# the console.
#
# library(dslabs)
# data(murders)
# Next, use the function str to examine the structure of the murders object. 
# We can see that this object is a data frame with 51 rows and five columns.
#
#Which of the following best describes the variables represented in this data 
# frame:
#
# Answer: The state, the abbreviation of the state name, the state's region, and
# the state's population and the total number of murders for 2010.

# Variable names
# In the previous question, we saw the different variables that are a part of 
# this dataset from the output of the str() function. The function names() is 
# specifically designed to extract the column names from a data frame.
#
# Load package and data

library(dslabs)
data(murders)

# Use the function names to extract the variable names 
names(murders)

# Examining Variables
#
# In this module we have learned that every variable has a class. For example, 
# the class can be a character, numeric or logical. The function class() can be
# used to determine the class of an object.
#
# Here we are going to determine the class of one of the variables in the 
# murders data frame. To extract variables from a data frame we use $, referred 
# to as the accessor.

# In the editor we show an example of how to do this. Let`s try it out for 
# ourselves.
#
# To access the population variable from the murders dataset use this code:
p <- murders$population 

# To determine the class of object `p` we use this code:
class(p)

# Use the accessor to extract state abbreviations and assign it to a
a <- murders$abb
# Determine the class of a
class(a)

# Multiple ways to access variables
#
# An important lesson you should learn early on is that there are multiple ways 
# to do things in R. For example, to generate the first five integers we note 
# that 1:5 and seq(1,5) return the same result.
#
# There are also multiple ways to access variables in a data frame. For example 
# we can use the square brackets [[ instead of the accessor $. Example code is 
# included in the editor.
#                                                                                                            
# If you instead try to access a column with just one bracket,
# murders["population"]
# R returns a subset of the original data frame containing just this column. 
# This new object will be of class data.frame rather than a vector. To access 
# the column itself you need to use either the $ accessor or the double square
# brackets [[.
#
# Parentheses, in contrast, are mainly used alongside functions to indicate what
# argument the function should be doing something to. For example, when we did 
# class(p) in the last question, we wanted the function class to do something 
# related to the argument p.
#
# This is an example of how R can be a bit idiosyncratic sometimes. It is very 
# common to find it confusing at first.
#
# We extract the population like this:
p <- murders$population

# This is how we do the same with the square brackets:
o <- murders[["population"]] 

# We can confirm these two are the same
identical(o, p)

# Use square brackets to extract `abb` from `murders` and assign it to b
b <- murders[["abb"]]
# Check if `a` and `b` are identical 
identical(a, b)

# Factors
#
# Using the str() command, we saw that the region column stores a factor. You 
# can corroborate this by using the class command on the region column.

# The function levels shows us the categories for the factor.
#
# We can see the class of the region variable using class
class(murders$region)

# Determine the number of regions included in this variable 
length(levels(murders$region))

# Tables
#
# The function table takes a vector as input and returns the frequency of each 
# unique element in the vector.
#
# The "c" in `c()` is short for "concatenate," which is the action of connecting items into a chain
# The function `c()` connects all of the strings within it into a single vector, which we can assign to `x`
x <- c("a", "a", "b", "b", "b", "c")
# Here is an example of what the table function does
table(x)

# Write one line of code to show the number of states per region
table(murders$region)

#==============================End of assessment 2==============================