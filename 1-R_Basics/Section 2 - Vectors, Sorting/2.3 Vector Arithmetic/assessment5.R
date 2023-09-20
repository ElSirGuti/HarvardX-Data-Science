# =================================Assessment 5=================================

# Vectorized operations
# Previously we created this data frame:
# temp <- c(35, 88, 42, 84, 81, 30)
# city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
# city_temps <- data.frame(name = city, temperature = temp)

# Assign city names to `city` 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Store temperature values in `temp`
temp <- c(35, 88, 42, 84, 81, 30)

# Convert temperature into Celsius and overwrite the original values of 'temp' with these Celsius values
temp <- 5/9 * (temp - 32)
# Create a data frame `city_temps` 
city_temps <- data.frame(city_names=city,temperatures=temp)

# Vectorized operations continued...
# We can use some of what we have learned to perform calculations that would 
# otherwise be quite complicated. Let's see an example.

# Define an object `x` with the numbers 1 through 100
x <- 1:100
x
# Compute the sum 
x_sum <- sum(1/x^2)
x_sum

# Vectorized operation continued...

# Load the data
library(dslabs)
data(murders)

# Store the per 100,000 murder rate for each state in murder_rate
murder_rate <- (murders$total / murders$population) * 100000
# Calculate the average murder rate in the US
mean(murder_rate)
