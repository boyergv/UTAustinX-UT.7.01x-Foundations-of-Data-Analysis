# Lab 9: Post Student-Survey Data
# Review of Two-Sample t-Tests
# Two samples are considered dependent when:
# each score in one sample is paired with a specific score in the other sample. each score in one sample is 
# paired with a specific score in the other sample.     
# Two samples are considered independent when:
# the scores of one sample do not affect the scores of the other sample.

# Lab Preparation
library(SDSFoundations)
library(dplyr)
post <- PostSurvey
# Match each question to the type of t-test needed to run the analysis.
# Question 1: Do students at UT spend more time on homework per week in college than they did in highschool?
# dependent t-test
# Question 2: Do students in fraternities and sororities get less sleep on the weekends than other college students?
# independent t-test

# Analysis

# Letfs break this question down into the different statistics that you will need to construct your answer.  Be 
# sure that your R output includes all of the following components. 
# For each hypothesis test, 
# 1. Create vectors of the scores that you wish to analyze.
data <- post %>%
                select(hw_hours_HS,hw_hours_college) 
data$diff <- data[,2] - data[,1]
dat <- post %>% 
                select(sleep_Sat,greek)

Non_greek <- filter(dat,greek=='no') 
Greek <- filter(dat,greek=='yes')
# 2. Check the assumption of normality by generating a histogram for each variable of interest. 
hist(data[,1], xlab="Study hours", main="Time students spent on homework in high school by hours")
hist(data[,2], xlab="Study hours", main="Time students spent on homework in college by hours")
hist(data[,3], xlab="Study hours", main="Difference in study hours")
hist(Greek$sleep_Sat,main="Sleep hours on Saturday of Greek students")
hist(Non_greek$sleep_Sat,main="Sleep hours on Saturday of Non-greek students")
# 3. Find the t-statistic and p-value.

t.test(data[,1],data[,2],paired=T,alternative='less')
t.test(Greek[,1],Non_greek[,1],alternative='less')
# 4. Interpret the results of each test. 


# 1a. On average, students spent how many hours more on homework each week in college than they did in high 
# school? (round to 1 decimal)
# 10.9 
# 1b. What was the t-statistic for this test? (round to 2 decimal places)
# 16.81 
# 1c. How many degrees of freedom? (no decimal places)
# 213
# 1d. What was the p-value?
# less than 0.05
# 1e. Based on these test results, we would conclude that students ________ spend more time on homework in college than
# they did in high school.
# do

# Lab Question 2
# 2a. On average, students who are not Greek sleep how many hours more than Greek students on Saturday nights?
# (report to 1 decimal place)
# 0.3
# 2b. What is the t-statistic for this test? (report to 3 decimal places)
# -0.981
# 2c. How many degrees of freedom? (round to no decimal places)
# 63
# 2d. What was the p-value? (report to 3 decimal places)
# 0.165
# 2e. Based on these results, we could conclude that people who are in fraternities or sororities ________ get less sleep 
# on the weekends than other college students.
# do not
# 3. The Normality assumption was met in each hypothesis test.


