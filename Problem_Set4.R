WR <- read.csv("WorldRecords.csv")
library("SDSFoundations")

######################
# Question 1
# 1a. What is the standing world record height (in meters) for men's pole vault? 
# (Round to 2 decimal places.)
mensPolevault <- WR[WR$Event=="Mens Polevault",]
max(mensPolevault$Record)
# 6.14

# 1b. In what year did the pole vault record first exceed 6 meters? (Look at the data to find the year.)
# mensPolevault[mensPolevault$Record>6,]
# 1986

# 1c. Create a scatterplot showing the men's pole vault records since 1970 as a function of year.
# Fit a linear model to the data.Which of the following best describes how the record has changed over time?
memPolevault1970 <- mensPolevault[mensPolevault$Year>=1970,]
plot(memPolevault1970$Year, memPolevault1970$Record,
     main="record change since 1970", xlab="Year", ylab="Record", pch=16)
# 1d. Report the coefficient estimates for the linear model that describes the change in the men's pole 
# vault world record since 1970. What is the intercept? (Round to 3 decimal places.)
linFit(memPolevault1970$Year, memPolevault1970$Record)
# -51.854
# 1e. What is the slope? (Round to 3 decimal places.)
# 0.029
# 1f. Which of the following best describes how the men's pole vault world record has changed since 1970?
# The record has increased by an average of 0.03m per year since 1970. 

###################################
# Question 2

# 2a. Which variable is the independent variable?
# h
# 2b. Identify the y-intercept for this function.
# 140
# 2c. How much does the band charge per hour that they perform?
# 70
# 2d. If each member of the band earned $175 for the night and profits were split evenly among them, 
# how many hours did the band perform?
# (4*175 -140)/70 = 8

########################################
# Question 3

# Predicted GPA = 2.84 + .04*Dollars
# 3a. What is the predicted GPA of a student who spent a total of $970 on textbooks in college?
# (Round to 2 decimal places.)
# 3.23
# 3b. If a student spent $0 on textbooks in college and graduated with a GPA of 3.71, what is her residual?
# (Round to 2 decimal places.)
# 0.87
# 3c. If a student spent $1,450 on textbooks and graduated with a GPA of 2.91, what is his residual 
# (Please indicate whether the residual is positive or negative in your response, and round to 2 decimal places)?
# -0.51
# 3d. A freshman learned of this study and calculated that she would need to spend $2,900 on textbooks to earn
# a 4.0 GPA. (You can confirm this calculation using the equation above). She decided to buy all of her textbooks
# new (rather than second-hand and cheaper) to help boost her GPA. Is she using the model in a statistically-sound way?
# No