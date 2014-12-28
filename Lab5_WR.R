WR <- read.csv("WorldRecords.csv")
library("SDSFoundations")

# Review of Linear Modeling
# When fitting a model to data, what should you do first to examine the data?
# Create a scatterplot of the two variables of interest
# 
# Lab Preparation
# You will be answering one of the following questions in lab. Which of these
# questions might be answered using linear modeling?
# How have world record times for the men's and women's mile event changed over the years?

###############################
# Analysis

# Subset the data
menMile <- WR[WR$Event=='Mens Mile',]
womenMile <-WR[WR$Event=='Womens Mile',]
# Create scatterplots
plot(menMile$Year, menMile$Record, main="Mens
     Mile World Records", xlab="Year", ylab="World Record Distance (m)", pch=16)
plot(womenMile$Year, womenMile$Record, main="Womens
     Mile World Records", xlab="Year", ylab="World Record Distance (m)", pch=16)
#Run linear models
linFit(menMile$Year, menMile$Record)
linFit(womenMile$Year,womenMile$Record)

# Which scatterplot shows a stronger linear relationship between World Record times
# in the Mile and Year:
# Men's
# On average, how many seconds do men trim off the world record time in the Mile each year?
# (Round to three decimal places)
# 0.395
# On average, how many seconds do women trim off the world record time in the Mile each year?
# (report to three decimal places)
# 0.973
# How many years would you predict it would take for the menfs mile record to decrease by one 
# full second? Use the model equation to help you answer the question.
# 1/0.395 = 2.5 years
# How many years would you predict it would take for the womenfs mile record to decrease by one
# full second? Use the model equation to help you answer the question.
# 1/0.978 = 1 year
# What proportion of variance in the men's World Record times in the Mile can be explained by year?
# (report to 3 decimal places)
# 0.978
# What proportion of the variance in women's World Record times in the Mile can be explained by year? 
# (report to 3 decimal places)
# 0.896
# Which of the following is a reasonable conclusion to draw from this analysis?
# World record times in the Mile have decreased linearly over the last several 
# decades for both men and women. 

################################
# Conclusions
# Based on scatterplots of the menfs and womenfs world record mile event, both of these events follow
# a strong, negative relationship over time. For both groups, the assumption of linearity appears to 
# be satis???ed. The menfs world record mile time decreases by an average of .393 seconds per year, while
# the womens record distance decreases by an average of .973 seconds per year. Because the intercept
# estimate is the value of the record distance when year is equal to 0, it is not interpretable in the
# context of the problem. Both linear models ???t the data well, with R-squared values for the mens and
# womens models equal to .978 and .896, respectively. For the mens world record, 97.8% of the variance
# is explained by the linear model of year, while for the female world record, 89.6% of the variance
# in performance can be explained by the linear model of year.