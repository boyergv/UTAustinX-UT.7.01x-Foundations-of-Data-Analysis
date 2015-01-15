# Review of the One-Sample t-Test

# 1a. What is the goal of a hypothesis test?
# To determine if the sample data is consistent, or inconsistent, with the null hypothesis
# about the population.
# 1b. For your test result to be considered trustworthy, your data must meet the 
# assumptions for a one-sample t-test. Which of the following is not an assumption
# of this test?
# The data was collected voluntarily from all subjects.

# Lab Preparation

library(SDSFoundations)
bull <- BullRiders
# One of the following questions will be answered in this lab using a one-sample t-test.
# Select the question that can be answered with this method.
# Is the average ride percentage of professional bull riders at least 50%?

################################
# Analysis
str(bull)
# 1. Calculate the sample mean and standard deviation of ride percentage.
mean(bull$RidePer)
sd(bull$RidePer)
# 2. Generate a histogram to look at the distribution of ride percentage.
hist(bull$RidePer, 
     main="Histogram of The Ride Percentage of Bull Rider ", xlab="Percent")
# 3. Confirm the assumptions of a one-sample t-test
# 4. Run the t-test and interpret the results.
t.test(bull$RidePer,mu=0.5)

# Descriptive Statistics

# 1a. What was the average ride percentage? (round to 1 decimal place)
# 37.5
# 1b. What was the standard deviation of ride percentage? (round to 1 decimal place)
# 12.2

# Test Statistics

# 2a. What is the value of the t-statistic? (round absolute value to 2 decimal places)
# 6.35
# 2b. How many degrees of freedom?
# 37
# 2c. The p-value was _______ 0.001.
# less than
# 3. What decision should you reach, based on these test results?
# Reject the null hypothesis 
# 4. It appears that professional bull riders stay on their bulls:
# Less than 50% of the time

#####################################
Write Your Conclusion

Answer the question and support your answer with statistics:
        The distribution of the percentage of time a professional bull rider stays on
the bull for this sample is approximately normal, with a mean of 37.48%, and a 
standard deviation of 12.15%. We found that their mean ride percentage is significantly 
different from 50%, with t= -6.354, p<0.05. We are 95% confident that the true mean of
ride percentage of professional bull riders is between 33.48% and 41.47% suggesting that
professional bull riders ride the full 8 seconds less than half of the times they buck 
out.