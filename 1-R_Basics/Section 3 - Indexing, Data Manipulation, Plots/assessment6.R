# =================================Assessment 5=================================

# Logical Vectors
# Here we will be using logical operators to create a logical vector.

# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total / murders$population * 100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate < 1
low

# which
# The function which() helps us know directly, which values are low or high, 
# etc. Let's use it in this question.

# Store the murder rate per 100,000 for each state, in murder_rate
murder_rate <- murders$total/murders$population*100000

# Store the murder_rate < 1 in low 
low <- murder_rate < 1

# Get the indices of entries that are below 1
index <- which(murder_rate < 1)
index <- which(low)
index

# Ordering vectors
# Note that if we want to know which entries of a vector are lower than a 
# particular value we can use code like this:
# small <- murders$population < 1000000
# murders$state[small]
# The code above shows us the states with populations smaller than one million.

# Store the murder rate per 100,000 for each state, in murder_rate
murder_rate <- murders$total/murders$population*100000

# Store the murder_rate < 1 in low 
low <- murder_rate < 1

# Names of states with murder rates lower than 1
murders$state[low]

# Filtering

# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total/murders$population*100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate < 1

# Create a vector ind for states in the Northeast and with murder rates lower 
# than 1. 
ind <- murders$region == "Northeast" & murder_rate < 1
ind

# Names of states in `ind` 
murders$state[ind]

# Filtering continued

# Store the murder rate per 100,000 for each state, in murder_rate
murder_rate <- murders$total/murders$population*100000

# Compute the average murder rate using `mean` and store it in object named 
# `avg`
avg <- mean(murder_rate)
avg
# How many states have murder rates below avg ? Check using sum
sum(murder_rate < avg)

# Match
# In this exercise we use the match function to identify the states with 
# abbreviations AK, MI, and IA.

# Store the 3 abbreviations in a vector called `abbs` (remember that they are 
# character vectors and need quotes)
abbs <- c("AK","MI","IA")

# Match the abbs to the murders$abb and store in ind
ind <- match(abbs,murders$abb)

# Print state names from ind
murders$state[ind]

# %in%
# If rather than an index we want a logical that tells us whether or not each 
# element of a first vector is in a second, we can use the function %in%. 
# For example:
# x <- c(2, 3, 5)
# y <- c(1, 2, 3, 4)
# x%in%y
# Gives us two TRUE followed by a FALSE because 2 and 3 are in y but 5 is not.

# Store the 5 abbreviations in `abbs`. (remember that they are character 
# vectors)
abbs <- c("MA","ME","MI","MO","MU")

# Use the %in% command to check if the entries of abbs are abbreviations in the 
# murders data frame
abbs %in% murders$abb

# Logical operator

# Store the 5 abbreviations in abbs. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU") 

# Use the `which` command and `!` operator to find out which index abbreviations are not actually part of the dataset and store in `ind`
ind <- which(!abbs %in% murders$abb)

# Names of abbreviations in `ind`
abbs[ind]
