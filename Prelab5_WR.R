WR <- read.csv("WorldRecords.csv")
library("SDSFoundations")
# Check the Data

# 1) How many different types of events (e.g. "Mens 100m," "Womens shotput," etc.)
# are represented in the dataset?
length(unique(WR$Event))
# 10

# 2) In what year did Usain Bolt first break the world record for the men's 100m dash?
Mens100m <- WR[WR$Event=="Mens 100m",]
Bolt100m <- Mens100m[Mens100m$Athlete=="Usain Bolt",]
Bolt100m[1,7]
# 2008

# 3) Who was the first woman to break the womenfs 1 mile world record with a time of
# less than 260 seconds?
women260 <- WR[WR$Event=="Womens Mile" & WR$Record < 260, ]
women260[1,4]
# Mary Slaney

# Check the Variables of Interest

# 4a) Which variable tells us the record setting time or distance? The variable name
# in the dataset is:
# Record

# 4b) What type of variable is this?
# Quantitative

# 4c) Which variable tells us when the record was broken? The variable name in the
# dataset is:
# Year

# 4d) What type of variable is this?
# Quantitative

# Reflect on the Method

# 5) Which method should we be using for this analysis and why?
# The scatterplot will show us if these two numeric variables are linearly related. 

# 6) What will we be able to determine once we fit a linear model to this shotput 
# world record data?
# We will be able to report the average rate of change in world record shotput
# distance per year. 

####################################
# Breakdown Your Analysis

#Subset the data

#Subset the data
menshot <- WR[WR$Event=='Mens Shotput',]
womenshot <- WR[WR$Event=='Womens Shotput',] 
#Create scatterplots
plot(menshot$Year,menshot$Record,main='Mens
     Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,
     main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
#Run linear models
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year,womenshot$Record)

# 1) What is the best description of what will 
# be included in the new dataframe "menshot"?
# Only those rows in WR that include the event Mens Shotput.
# 2) Which variable will be on the x-axis of each scatterplot?
# year
# 3) Which function will we use to fit a linear model to the world record data?
# linFit
# 4) What is the dependent variable in our linear models?
# shotput distance shotput distance - correct

######################################
# Conduct the Analysis in R

# 1)How many records are in the menshots data frame?
# 39
# 2) How many records in the womenshot data frame?
# 41
# 3a) Is a linear model appropriate for the menfs shotput data?
# Yes
# 3b) Is a linear model appropriate for the womenfs shotput data?
# Yes
# What is the equation for the linear model that predicts the World Record shotput distance for women?
# 
# 4a) record distance = ________ * year + ________
# 0.234
# 0.962
# 5) What can we say about the models for men and women?
# The rate of change is greater for women than for men. 

###################################
# Write Your Conclusion
        
# Based on scatterplots of the menfs and womenfs world record shotput distance, 
# both of these events follow a strong positive linear relationship over 
# time. The menfs world record distance increases by an average of 0.134
# meters per year, while the womenfs record distance increases by an average of 0.234
# meters per year. Because the intercept estimate is the value of the
# record distance when year is equal to 0, it is not interpretable in the
# context of the problem. Both linear models fit the data well, with R-squared values for
# the menfs and womenfs models equal to 0.941 and 0.962, respectively