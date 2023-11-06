#=================================Assessment 1==================================

# Exercise 1. Variable names
# influence the data visualization technique we use. We will be working with two
# types of variables: categorical and numeric. Each can be divided into two 
# other groups: categorical can be ordinal or not, whereas numerical variables 
# can be discrete or continuous.

# We will review data types using some of the examples provided in the dslabs 
# package. For example, the heights dataset.
#
#library(dslabs)
#data(heights)

library(dslabs)
data(heights)
names(heights)

# Exercise 2. Variable type
# We saw that sex is the first variable. We know what values are represented
# by this variable and can confirm this by looking at the first few entires:
#
# library(dslabs)
# data(heights)
# head(heights)
#
# What data type is the sex variable?
# Answer = Categorical

# Exercise 3. Numerical values
# Keep in mind that discrete numeric data can be considered ordinal. 
# Although this is technically true, we usually reserve the term ordinal 
# data for variables belonging to a small number of different groups, 
# with each group having many members.

# The height variable could be ordinal if, for example, 
# we report a small number of values such as short, medium, and tall. 
# Let's explore how many unique values are used by the heights variable. 
# For this we can use the unique function:
#
# x <- c(3, 3, 3, 3, 4, 4, 2)
# unique(x)

library(dslabs)
data(heights)
x <- heights$height
length(unique(x))

# Exercise 4. Tables
# One of the useful outputs of data visualization is that we can learn about 
# the distribution of variables. For categorical data we can construct 
# this distribution by simply computing the frequency of each unique value. 
# This can be done with the function table. Here is an example:
#
# x <- c(3, 3, 3, 3, 4, 4, 2)
# table(x)

library(dslabs)
data(heights)
x <- heights$height
tab <- table(x)
tab

# Exercise 5. Indicator variables
# To see why treating the reported heights as an ordinal value is not useful 
# in practice we note how many values are reported only once.

library(dslabs)
data(heights)
tab <- table(heights$height)
sum(tab == 1)

# Exercise 6. Data types - heights
# Since there are a finite number of reported heights and technically the
# height can be considered ordinal, which of the following is true:
#
# Answer = It is more effective to consider heights to be numerical
# given the number of unique values we observe and the
# fact that if we keep collecting data even more will be
# observed.
