# Question 1

# Is the increase in time spent studying from high school to college the same for 
# nursing majors and biology majors?  

# 1. Create a new variable that equals the difference in hours spent studying per week in college
# versus high school for each student. 
library(SDSFoundations)
library(dplyr)
post <- PostSurvey
data <- post %>% 
        select(major,hw_hours_HS,hw_hours_college)
data$hour_diff <- data$hw_hours_college - data$hw_hours_HS 

# 2. Create two vectors of those differences, one for nursing majors and one for biology majors.
nursing <- filter(data, major=="Nursing")
biology<- filter(data, major=="Biology")

# 3. Use this data to answer the following questions.

# 1a. Which of the following methods should be used to answer the question above?
# Two-sample independent t-test 
# 1b. Create a histogram to confirm the normality assumption for each sample. Has the normality 
# assumption been met?
hist(data$hour_diff)
# yes
# 1c. Run the appropriate t-test for this analysis. What is the t-statistic?
# (Report as a positive number rounded 2 decimal places.)
t.test(nursing$hour_diff,biology$hour_diff)
0.62
# 1d. How many degrees of freedom are there for this test? (Round to 2 decimal places.)
30.89
# 1e. What is the p-value for this test? (Round to 2 decimal places.)
0.54
# 1f. Which of the following is an appropriate conclusion for this analysis (assuming ƒ¿ = .05)?
# We fail to reject the null hypothesis; the increase in study time is the same for biology and nursing majors.

####################################
# Question 2

# A study was conducted to compare the resting pulse rates of college smokers and non-smokers.  The data for 
# a randomly selected group is summarized in the table below. Pulse rates were normally distributed within each group.

# Group        Sample Size (n)	Average Pulse Rate (bpm)	Standard Deviation of Scores
# Smokers	      26	                 80	                             5
# Non-Smokers	      32	                 74	                             6
# 2a. What is the appropriate method for analyzing this data?
# Independent T-Test
# 2b. What is the alternative hypothesis for this test if the researchers expect smoking to raise pulse rates?
#   Mu of smokers > Mu of none-smokers
# 2c. How many degrees of freedom should we use for this test if we are to estimate rather than use a calculator?
# 25
# 2d. What is t-critical, assuming ƒ¿=0.05? (Round to 3 decimal places.) Use your answer to 2c. to help.
# 1.708
# 2e. Calculate the standard error. (Round to 2 decimal places.)
# 1.44
# 2f. Calculate the test statistic. (Round to 2 decimal places, and use rounded values from previous answers.)
# 4.17
# 2g. Is there evidence to suggest that the pulse rate of smokers is higher on average than the pulse rate of non-smokers?
# Yes
# 2g. How would the p-value be reported in your conclusion?
# p < 0.05

# Monkey ID        CP on Left Side (regenerating)	CP on Right Side (control)
# 1	16.3	11.5
# 2	4.8	3.5
# 3	10.7	12.8
# 4	14.0	7.9
# 5	15.7	15.2
# 6	9.9	9.8
# 7	29.3	24.0
# 8	20.4	14.9
# 9	15.7	12.6
# 10	7.6	8.2
# 11	16.2	8.4
# 12	14.7	11.0
# 13	15.0	12.5
# 14	8.4	9.2
# 15	23.3	17.5
# 16	17.7	11.1
# 3a. Which is the appropriate method for testing the researchers' hypothesis?
# Dependent t-test 
# 3b. How many degrees of freedom are there?
# 15
# 3c. What is the t-critical value? (Round to 3 decimal places.)
# 1.753
# 3d. How much of a difference in creatine phosphate was observed, on average, between the left and right nerve cells?
# (Report as a positive value rounded 1 decimal place).
dat <- read.csv("Spinal_cord.txt")
dat$dif <- dat$CP.on.Left.Side - dat$CP.on.Right.Side 
mean(dat$dif)
# 3e. What is the Standard Deviation of the difference scores? (Round to 2 decimal places.)
sd(dat$dif)
# 3f. What is the Standard Error for your t-test? (Round to 2 decimal places.)
sd(dat$dif)/sqrt(16)
# 3g. What is your test statistic? (Round to 2 decimal places.)
t.test(dat$CP.on.Left.Side, dat$CP.on.Right.Side )
# 4.06
# 3h. Is there sufficient evidence to suggest that the levels of creatine phosphate are higher in regenerating cells
# than they are in the normal (control) cells?
# Yes
# 3i. The researchers finish their analysis by calculating a 95% confidence interval for the true increase in CP 
# levels in rejuvenating nerve cells. What are the lower and upper bounds? (Round each to 1 decimal place.)
Lower bound: 1.5
Upper bound: 4.7