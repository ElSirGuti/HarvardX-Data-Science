#=================================Assessment 9==================================

# Practice Exercise. National Center for Health Statistics
#
# To practice our dplyr skills we will be working with data from the survey 
# collected by the United States National Center for Health Statistics (NCHS). 
# This center has conducted a series of health and nutrition surveys since the 
# 1960’s.
#
# Starting in 1999, about 5,000 individuals of all ages have been interviewed 
# every year and then they complete the health examination component of the 
# survey. Part of this dataset is made available via the NHANES package which 
# can be loaded this way:
#
# library(NHANES)
# data(NHANES)
# The NHANES data has many missing values. Remember that the main 
# summarization function in R will return NA if any of the entries of the 
# input vector is an NA. Here is an example:
#
# library(dslabs)
# data(na_example)
# mean(na_example)
# sd(na_example)
# To ignore the NAs, we can use the na.rm argument:
#
# mean(na_example, na.rm = TRUE)
# sd(na_example, na.rm = TRUE)
# Try running this code, then let us know you are ready to proceed with the 
# analysis.

# Exercise 1. Blood pressure 1
# Let's explore the NHANES data. We will be exploring blood pressure in this 
# dataset.
#
# First let's select a group to set the standard. We will use 20-29 year old 
# females. Note that the category is coded with 20-29, with a space in front 
# of the 20! The AgeDecade is a categorical variable with these ages.
#
# To know if someone is female, you can look at the Gender variable.

library(dplyr)
library(NHANES)
data(NHANES)
## fill in what is needed
tab <- NHANES %>% 
  filter(Gender == "female") %>%
  filter(AgeDecade == " 20-29")
tab

# Exercise 2. Blood pressure 2
# Now we will compute the average and standard deviation for the subgroup we 
# defined in the previous exercise (20-29 year old females), which we will 
# use reference for what is typical.

# You will determine the average and standard deviation of systolic blood 
# pressure, which are stored in the BPSysAve variable in the NHANES dataset.

library(dplyr)
library(NHANES)
data(NHANES)
## complete this line of code.
ref <- NHANES %>% 
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE))

# Exercise 3. Summarizing averages
# Now we will repeat the exercise and generate only the average blood pressure
# for 20-29 year old females. For this exercise, you should review how to use
# the place holder . in dplyr or the pull function.

library(dplyr)
library(NHANES)
data(NHANES)
## modify the code we wrote for previous exercise.
ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>%
  pull(average)
ref_avg 

# Exercise 4. Min and max
# Let's continue practicing by calculating two other data summaries: 
# the minimum and the maximum.
#
# Again we will do it for the BPSysAve variable and the group of 20-29 year 
# old females.

library(dplyr)
library(NHANES)
data(NHANES)
## complete the line
NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>%
  summarize(minbp = min(BPSysAve, na.rm = TRUE),
            maxbp = max(BPSysAve, na.rm = TRUE))

# Exercise 5. group_by
# Now let's practice using the group_by function.

# What we are about to do is a very common operation in data science: you will 
# split a data table into groups and then compute summary statistics for each 
# group.

# We will compute the average and standard deviation of systolic blood
# pressure for females for each age group separately. Remember that the age 
# groups are contained in AgeDecade.

library(dplyr)
library(NHANES)
data(NHANES)
##complete the line with group_by and summarize
NHANES %>%
  filter(Gender == "female") %>%
  group_by(AgeDecade) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE))

# Exercise 6. group_by example 2
# Now let's practice using group_by some more. We are going to repeat the 
# previous exercise of calculating the average and standard deviation of 
# systolic blood pressure, but for males instead of females.

# This time we will not provide much sample code. You are on your own!

library(dplyr)
library(NHANES)
data(NHANES)

NHANES %>%
  filter(Gender == "male") %>%
  group_by(AgeDecade) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE))

# Exercise 7. group_by example 3
# We can actually combine both of these summaries into a single line of code. 
# This is because group_by permits us to group by more than one variable.

# We can use group_by(AgeDecade, Gender) to group by both age decades and 
# gender.

library(NHANES)
data(NHANES)

NHANES %>%
  group_by(AgeDecade,Gender) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE))

# Exercise 8. Arrange
# Now we are going to explore differences in systolic blood pressure across 
# races, as reported in the Race1 variable.

# We will learn to use the arrange function to order the outcome acording to 
# one variable.

# Note that this function can be used to order any table by a given outcome. 
# Here is an example that arranges by systolic blood pressure.
#
# NHANES %>% arrange(BPSysAve)
# If we want it in descending order we can use the desc function like this:
# 
# NHANES %>% arrange(desc(BPSysAve))
# In this example, we will compare systolic blood pressure across values of 
# the Race1 variable for males between the ages of 40-49.

library(dplyr)
library(NHANES)
data(NHANES)

NHANES %>%
  filter(Gender == "male" & AgeDecade == " 40-49") %>%
  group_by(Race1) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE)) %>%
    arrange(average)
  