# How has mobile phone usage in Brazil changed since 1995?

# 1. Create a subset of the world bank data that contains records from Brazil 1995 and later.
# 2. Change the year variable to be "years since 1995" and update the units of the "mobile.users" variable to millions of users. 
# 3. Use this data to answer the following questions.

library(SDSFoundations)
world <- WorldBankData
####################################
# Question 1
# 1a. Find the number of mobile users in Brazil (in millions) in 2000, using R. (Round to 2 decimal places.)
brazil2000 <- world[world$Country=="Brazil" & world$year==2000,]
brazil2000$mobile.users
# 23.19
# 1b. In what year did Brazil first record more than 100 million mobile users?
brazil <- world[world$Country=="Brazil",]
brazil[brazil$mobile.users>100000000,"year"]
# 2007
# 1c. Generate a scatterplot and fit a linear, exponential and logistic model to the data. Which model best describes the 
# increase in mobile users in Brazil since 1995?
brazil1995 <- brazil[brazil$year>1994,]
plot(brazil1995$year, brazil1995$mobile.users,pch=19)
linFit(brazil1995$year, brazil1995$mobile.users)
expFit(brazil1995$year, brazil1995$mobile.users)
logisticFit(brazil1995$year, brazil1995$mobile.users)
# Logistic Growth Model
# 1d. What proportion of the variation in mobile users is explained by years
# since 1995 in the bestÅ]fitting model?
# (Round to 3 decimal places.)
# 0.99785
# 1e. Using the bestÅ]fitting model, predict the number of mobile users (in millions) in Brazil in 2025.
# (Round to zero decimal places.)
logisticFitPred(brazil1995$year, brazil1995$mobile.users,2025)
# 345

##########################################
# Question 2

# Use the data from the TABLE of Models to answer the following quesitons.
# 2a. Looking at the raw data, what is the rate of change in flu cases from April 30 to May 1? 
# (Report as a proportion rounded to 2 decimal places.)
(367-257)/257
# 0.43
# 2b. What is the growth rate for the flu, according to the exponential model? 
# (Report as a proportion rounded to 2 decimal places.)
# 0.46
# 2c. Predict the number of cases of flu on Day 14 (when "Day" is equal to 14), using the exponential model.
# (Round to zero decimal places.)
76.64*1.46^14
# 15325
# 2d. Using the logistic model, predict the total number of flu cases on Day 14. (Round to zero decimal places.)
3273.31/(1+43.59*1.57^(-14))
# 2e. The actual number of flu cases on Day 14 was 4,379. Find the residual of the exponential model prediction. 
# (Round to zero decimal places.)
4379-15325
# -10946
# 2f. What is the residual of the logistic model prediction for Day 14? (Round to zero decimal places.)
4379-3034
# 1345

# Based on the residuals of both models, what conclusion would you reach? Fill in the missing blanks.

# The better fit statistic of the logistic model suggests that the number of new flu cases
# will  begin slowing down. Based on this model, we would expect the maximum number of flu 
# cases in the 2009 season to be: 3,273. However, neither model does a perfectÅ@job of predicting
# future cases by Day 14. We will need to observe how the data changes after day 9 to determine 
# how the model needs to be adjusted.

#########################################
#Question 3

# 3.  Yellowstone National Park began a project to restore its native wolf population in the mid 1990's.
# Below are the number of wolves soon after the start of the project:
# Year       Years since Project Began        Number of Wolves
# 1996                 1                              25
# 1998                 3                              45
# 3a. Researchers fit a linear model to the wolf data. Using this model, how many wolves were being added
# to the park each year? (Round to zero decimal places.)
# 10
# 3b. According to their linear model, what was the size of the original wolf population when the project began?
# 15
# 3c. Another researcher assumed that the wolves would experience exponential growth because there were no 
# predators. He fit an exponential model to this data. What is the growth factor for his model?
# (Round to 2 decimal places.)
# a*b=25
# a*b^3=45
# b=1.34
# 3d. What is the annual growth rate of these wolves each year, according to this model? 
# (Report as a proportion rounded to 2 decimal places.)
# (a*b^2-a*b)/(a*b)
# 0.34
# 3e. Assuming exponential growth, find the initial number of wolves when the project began. 
# (Round to zero decimal places.)
# 19
# 3f. By 2002, there were 147 wolves in Yellowstone Park. Which model was determined to fit the data better?
# linearWolves = 15 + 10*7 = 85
# expWolves = 18.66*(1.34)^7 = 2702
# Exponential 
# 3g. Using the bestÅ]fitting model, how many years must pass before there are more than 325 wolves in Yellowstone?
# (Round to zero decimal places.)
# 18.66*(1.34)^t=325
# t=10
###################################
# Question 4

# 4.  A group of hedgehogs were released in the southÅ]Austin area. Each year, the size of the population
# was recorded. Their population growth over time was modeled with a logistic growth curve. The model fit was 0.972.
# Here are the model parameters: 
#         
# C = 2,000
# 
# a = 152.10
# 
# b = 2.17
# 4a. According to this model, what will be the maximum number of hedgehogs in South Austin?
# 2000
# 4b. What was the size of the hedgehog population when the growth rate began to slow down?
# 1000
# 4c. How many years had passed when the population growth rate began to slow down? 
# (Round to 1 decimal place.)
# -log10(1/152.1)/log10(2.17)
# 6.5
# 4d. The hedgehogs were released in South Austin in 2001. How many hedgehogs were living in South Austin by 2010, according to the model?
# (Round to zero decimal places.)
# 2000/(1+152.1*2.17^-9)
# 1750