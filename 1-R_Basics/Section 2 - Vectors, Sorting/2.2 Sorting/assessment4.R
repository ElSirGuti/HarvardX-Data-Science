# =================================Assessment 4=================================

# sort
#
# When looking at a dataset, we may want to sort the data in an order that makes
# more sense for analysis. Let's learn to do this using the murders dataset as 
# an example.

# Access the `state` variable and store it in an object 
states <- murders$state 

# Sort the object alphabetically and redefine the object 
states <- sort(states) 

# Report the first alphabetical value  
states[1]

# Access population values from the dataset and store it in pop
pop <- murders$population
# Sort the object and save it in the same object 
pop <- sort(pop)
# Report the smallest population size 
pop[1]

# order
#
# The function order() returns the index vector needed to sort the vector. This 
# implies that sort(x) and x[order(x)] give the same result.
#
# This can be useful for finding row numbers with certain properties such as 
# "the row for the state with the smallest population". Remember that when we 
# extract a variable from a data frame the order of the resulting vector is the 
# same as the order of the rows of the data frame. So for example, the entries 
# of the vector murders$state are ordered in the same way as the states if you 
# go down the rows of murders.

# Access population from the dataset and store it in pop
pop <- murders$population
# Use the command order to find the vector of indexes that order pop and store in object ord
ord <- order(pop)
# Find the index number of the entry with the smallest population size
ord

# New Codes
#
# We can actually perform the same operation as in the previous exercise using 
# the function which.min. It basically tells us which is the minimum value.

# Find the index of the smallest value for variable total 
which.min(murders$total)

# Find the index of the smallest value for population
which.min(murders$population)

# Using the output of order
#
# Now we know how small the smallest state is and we know which row represents 
# it. However, which state is it?

# Define the variable i to be the index of the smallest state
i <- which.min(murders$population)
# Define variable states to hold the states
states <- murders$state
# Use the index you just defined to find the state with the smallest population
states[i]

# Ranks
# 
# You can create a data frame using the data.frame function. Here is a quick 
# example:
# temp <- c(35, 88, 42, 84, 81, 30)
# city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
# city_temps <- data.frame(name = city, temperature = temp)

# Store temperatures in an object 
temp <- c(35, 88, 42, 84, 81, 30)

# Store city names in an object 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Create data frame with city names and temperature 
city_temps <- data.frame(name = city, temperature = temp)

# Define a variable states to be the state names 
states <- murders$state

# Define a variable ranks to determine the population size ranks 
ranks <- rank(murders$population)

# Create a data frame my_df with the state name and its rank
my_df <- data.frame(state=states,rank=ranks)
my_df

# Data Frames, Ranks and Orders

# This exercise is somewhat more challenging. We are going to repeat the 
# previous exercise but this time order my_df so that the states are ordered 
# from least populous to most.

# Define a variable states to be the state names from the murders data frame
states <- murders$state

# Define a variable ranks to determine the population size ranks 
ranks <- rank(murders$population)

# Define a variable ind to store the indexes needed to order the population values
ind <- order(ranks)

# Create a data frame my_df with the state name and its rank and ordered from least populous to most 
my_df <- data.frame(states=states[ind],ranks=ranks[ind])
my_df

# NA
#
# The na_example dataset represents a series of counts. It is included in the 
# dslabs package. You can quickly examine the object using
#
# library(dslabs)
# data(na_example)
# str(na_example)
#
# However, when we compute the average we obtain an NA. You can see this by 
# typing
#
# mean(na_example)

# Using new dataset 
library(dslabs)
data(na_example)

# Checking the structure 
str(na_example)

# Find out the mean of the entire dataset 
mean(na_example)

# Use is.na to create a logical index ind that tells which entries are NA
ind <- is.na(na_example)
ind
# Determine how many NA ind has using the sum function
sum(ind)

# Removing NAs
# 
# We previously computed the average of na_example using mean(na_example) and 
# obtain NA. This is because the function mean returns NA if it encounters at 
# least one NA. A common operation is therefore removing the entries that are 
# NA and after that perform operations on the rest.


# Note what we can do with the ! operator
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x[!ind]

# Create the ind vector
library(dslabs)
data(na_example)
ind <- is.na(na_example)

# We saw that this gives an NA
mean(na_example)

# Compute the average, for entries of na_example that are not NA 
mean(na_example[!ind])