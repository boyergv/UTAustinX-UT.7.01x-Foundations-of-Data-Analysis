world <- read.csv("WorldBankData.csv")
library(SDSFoundations)
# Check the Data
# 1a) What is the first gLow Incomeh country in the dataset?
lowIncome <- world[world$IncomeGroup=="Low income",]
lowIncome[1,"Country"]
# Aruba
# 1b) What was the rural population of Aruba in 1970 (report without commas)?
Aruba1970 <- world[world$Country == "Aruba" & world$year==1970,]
Aruba1970[1,"rural.population" ]
# 29164
# 1c) When was the first year Australia had data on the number of mobile 
# device subscriptions? (Subscriptions more than 0)
mobileAustralia <- world[world$mobile.users!='0' & !is.na(world$mobile.users) & world$Country=="Australia",]
min(mobileAustralia[,"year"])
# 1987

# Check the Variables of Interest
# 
# Let's find the variables we need to answer the question.
# 
# 2a) Which variable tells us the number of internet users in a specific year? The variable name in the dataset is:
# internet.users 
# 2b) What type of variable is this?
# quantitative 
# 2c) Which variable tells us when the number of internet users was recorded? The variable name in the dataset is:
# year 
# 2d) What type of variable is this?
# quantitative 

########################################
# Reflect on the Method

# Which method should we be using for this analysis and why?

# 3a) What statistic helps us determine how well a particular model fits the data?
# R-squared
# 3b) In this lab, we will calculate residuals after fitting both an exponential and a logistic model to a set of
# data. What is a residual?
# A residual is the difference between a predicted value and the actual observed value.

########################################
# Breakdown Your Analysis

# Subset data for just the United States and name the new data frame "us"
us <- world[world$Country.Code == "USA",]

# Select the years from 1990 and name the new data frame "us_select"
us_select <- us[us$year >= 1990, ]

# Make the number of users more interpretable (into millions)
us_select$internet.mil <- us_select$internet.users / 1000000

# Create a new variable that is "years since 1990"
us_select$time <- us_select$year - 1990

# Select the first 10 years (from 1990 to 1999) and name the new data frame "us_select_10"
us_select_10 <- us_select[us_select$time < 10,]

# Use a function to fit an exponential and logistic model for 1990-1999
expFit(us_select_10$time, us_select_10$internet.mil)
logisticFit(us_select_10$time, us_select_10$internet.mil)

# Based on the prior model parameters, predict the number of internet users in 2006
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)

# Show how many internet users the US actually had in 2006
us_select[us_select$time == 16, c("Country", "year", "internet.mil")]

# Calculate the residuals for each model
us_select$internet.mil[us_select$time == 16] - e
us_select$internet.mil[us_select$time == 16] - l

# Look at the model fits for all available data (1990 to 2012)
expFit(us_select$time, us_select$internet.mil)
logisticFit(us_select$time, us_select$internet.mil)

# Which model fits the best?
tripleFit(us_select$time, us_select$internet.mil)

# How many internet users would the US have had in 2012 if you had used the original exponential model?
expFitPred(us_select_10$time, us_select_10$internet.mil, 22)

# 1) In both of these models, what does Year 0 correspond to?
# 1990
# 2) Which functions will you use to fit exponential and logistic models to the data?
# expFit() and logisticFit() 
# 3) What are the objects "e" and "l"?
# The predicted number of internet users in 2006 (year 16)
# 4) What does the number "22" refer to in this last line of code?
# The year 22 (which corresponds to 2012).

#################################
# Primary Research Question

# What model best describes the first decade of internet usage (1990-1999) in the United States? 
# Does this model hold through 2012?

# 1) Report the parameters of the exponential model for the number of internet users in the US for 
# years 1990-1999 (report to 3 decimal places).
# a=1.872, b= 1.608
# 2) Report these parameters of the logistic model for the number of internet users in the US for
# years 1990-1999 (report to one decimal place).
# 3) What was the actual number of internet users (in millions) in the United States in 2006? 
# (report to 1 decimal place)
# 205.7

# How well did the exponential and logistic models predict the number of internet users in 2006?

# 4a) The exponential model predicted __________ million users in 2006. The residual was _______.
# 3756
# -3551
# 4b) The logistic model predicted _______ million users in 2006. The residual was _______.
# 127
# 78
# 5) Looking at the plots of the models through 2012, which model had the best fit to the data?
# The logistic model; the R-squared value was 0.994

##########################################
# Write Your Conclusion
# Both the logistic and exponential model fit the pattern of internet usage in the United States
# from 1990-1999, as shown by R-squared values greater than 0.95. The logistic model, 
# however, did a better job of predicting the actual number of internet users in 2006. In other
# words, the residual was smaller for the logistic model. When internet usage data was graphed 
# all the way through 2012, the logistic model fit the data best and explained the highest proportion
# of variance. If internet usage had continued to grow exponentially, there would have been over  
# 65 billion users in the US in 2012.