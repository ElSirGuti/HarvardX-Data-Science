#=================================Assessment 7==================================

# dplyr
# Load the dplyr package and the murders dataset.
#
# library(dplyr)
# library(dslabs)
# data(murders)
#
# You can add columns using the dplyr function mutate. This function is aware 
# of the column names and inside the function you can call them unquoted. 
# Like this:
#
# murders <- mutate(murders, population_in_millions = population / 10^6)
# 
# Note that we can write population rather than murders$population. 
# The function mutate knows we are grabing columns from murders.

# Loading data
library(dslabs)
data(murders)

# Loading dplyr
library(dplyr)

# Redefine murders so that it includes a column named rate with the per 100,000 
# murder rates
murders <- mutate(murders,rate=total/population*100000)
murders

# mutate
# Note that if rank(x) gives you the ranks of x from lowest to highest, rank(-x)
# gives you the ranks from highest to lowest.

# Note that if you want ranks from highest to lowest you can take the negative 
# and then compute the ranks 
x <- c(88, 100, 83, 92, 94)
rank(-x)

# Defining rate
rate <-  murders$total/ murders$population * 100000

# Redefine murders to include a column named rank
# with the ranks of rate from highest to lowest
murders <- mutate(murders,rank(-rate))
murders

# select
# With dplyr we can use select to show only certain columns. For example with 
# this code we would only show the states and population sizes:
#
# select(murders, state, population)

# Load dplyr
library(dplyr)

# Use select to only show state names and abbreviations from murders
select(murders,state,abb)

# filter
# The dplyr function filter is used to choose specific rows of the data frame 
# to keep. Unlike select which is for columns, filter is for rows. For example 
# you can show just the New York row like this:
#
# filter(murders, state == "New York")
#
# You can use other logical vectors to filter rows.

# Add the necessary columns
murders <- mutate(murders, rate = total/population * 100000, rank = rank(-rate))

# Filter to show the top 5 states with the highest murder rates
filter(murders, rank <= 5)

# filter with !=
# We can remove rows using the != operator. For example to remove Florida we 
# would do this:
#
# no_florida <- filter(murders, state != "Florida")

# Use filter to create a new data frame no_south
no_south <- filter(murders, region != "South")
no_south
# Use nrow() to calculate the number of rows
nrow(no_south)
# >>> [1] 34

# filter with %in%
# We can also use the %in% to filter with dplyr. For example you can see the 
# data from New York and Texas like this:

# filter(murders, state %in% c("New York", "Texas"))

# Create a new data frame called murders_nw with only the states from the 
# northeast and the west
murders_nw <- filter(murders, region %in% c("Northeast", "West"))
murders_nw
# Number of states (rows) in this category 
nrow(murders_nw)
# >>> [1] 22

# filtering by two conditions
# Suppose you want to live in the Northeast or West and want the murder rate to 
# be less than 1. We want to see the data for the states satisfying these 
# options. Note that you can use logical operators with filter:
#
# filter(murders, population < 5000000 & region == "Northeast")

# add the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# Create a table, call it my_states, that satisfies both the conditions 
my_states <- filter(murders, region %in% c("Northeast","West") & rate < 1)
# Use select to show only the state name, the murder rate and the rank
select(my_states, state, rate, rank)

# Using the pipe %>%
# The pipe %>% can be used to perform operations sequentially without having to 
# define intermediate objects. After redefining murder to include rate and rank.
#
# library(dplyr)
# murders <- mutate(murders, rate =  total / population * 100000, rank = (-rate))
# in the solution to the previous exercise we did the following:
#
  # Created a table 
# my_states <- filter(murders, region %in% c("Northeast", "West") & rate < 1)
# 
# Used select to show only the state name, the murder rate and the rank
#
# select(my_states, state, rate, rank)
#
# The pipe %>% permits us to perform both operation sequentially and without 
# having to define an intermediate variable my_states
# 
# For example we could have mutated and selected in the same line like this:
  
#  mutate(murders, rate =  total / population * 100000, rank = (-rate)) %>% 
#  select(state, rate, rank)
# Note that select no longer has a data frame as the first argument. The first 
# argument is assumed to be the result of the operation conducted right before
# the %>%

# Load library
library(dplyr)

## Define the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# show the result and only include the state, rate, and rank columns, all in 
# one line, in that order
filter(murders, region %in% c("Northeast","West") & rate < 1) %>% select(state, rate, rank)

# mutate, filter and select
# Now we will reset murders to the original table by using data(murders).

# Loading the libraries
library(dplyr)
data(murders)

# Create new data frame called my_states (with specifications in the instructions)
my_states <- murders %>% 
  mutate(rate=total/population*100000,rank=rank(-rate)) %>% 
  filter(region %in% c("Northeast","West") & rate < 1) %>% 
  select(state,rate,rank)
my_states
