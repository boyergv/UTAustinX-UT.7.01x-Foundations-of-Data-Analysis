library(SDSFoundations)
library(dplyr)
# Lab 8: Bull Rider Data

bull <- BullRiders
# 1a. Which variable tells us how much the rider weighs? The variable name 
# in the dataset is:
glimpse(bull)
# Weight
# 1b. What type of variable is this?
# Quantitative

# Reflect on the Method
# Which method should we be using for this analysis and why?

# 2a. We will use a one-sample t-test to help us answer this lab question. Why?
# We want to compare the average weight of these bull riders to a claimed value.
# 2b. We want to test a hypothesis that professional bull riders weigh 190 pounds
# on average. What will the null hypothesis look like for this one-sample t-test?
# ƒÊ=190 pounds
# 2c. The formula to calculate a t-statistic is below. What does the denominator 
# of this test tell us?


# t=(xP-ƒÊ)/SE?
# The difference you would expect, based on chance alone

# Breakdown Your Analysis
# 1. Calculate the sample mean and standard deviation for the weight of the bull-riders.
# 2. Create a histogram to visualize the distribution of bull-riders' weights.  
# 3. Confirm the assumptions of a one-sample t-test
# 4. Run the t-test and interpret the results.

###################################
# Summarize the bull rider weights
mean(bull$Weight)
sd(bull$Weight)

# Visualize the weight distribution
hist(bull$Weight, main='Histogram of Bull Rider Weights',xlab='Weight (lbs)')

# Run the single sample t-test
t.test(bull$Weight, mu=190)
# 1. What type of graph are we going to use to visualize the weights of the bull-riders?
# Histogram
# 2. What portion of the code defines the value of the null hypothesis?
# mu=190
# 3. Which assumption can we confirm with the use of the following line of code:
#         hist(bull$Weight, main='Histogram of Bull Rider Weights',xlab='Weight (lbs)')
# Normal
# 4. If you wanted to calculate the standard error for this sample of 38 riders, what
# additional line of code would you need to add?
sd(bull$Weight)/sqrt(38)

######################################
# Conduct the Analysis in R

# 1. Did the histogram of the bull-riders weights show any significant skew that would 
# violate the assumption of Normality?
# No
# Report the sample statistics for the bull-rider weights. (round to 2 decimal places)
# 2a. Sample mean (in pounds)=
        152.03
# 2b. Sample standard deviation (in pounds)=
        14.36

# One-sample t test results:
# 3a. t-statistic (rounded to 1 decimal place)=
        -16.3
# 3b. degrees of freedom for the test =
        37
# 95% confidence interval:
# 3c. Lower bound estimate, in pounds (rounded to 1 decimal place)=
        147.3
# 3d. Upper bound estimate, in pounds (rounded to 1 decimal place)=
        156.7
# 4. The p-value of the test was very small (< 0.05). How should we interpret this p-value?
# If bull-riders really do weigh 190 pounds on average, observing this sample mean is very unlikely. 
# We should ________ the hypothesis that the mean weight of bull riders is equal to 190 lbs. 
# It appears that the bull-riders actually weigh ________ than the average American man.
# reject
# less

################################
# Write Your Conclusion
# The distribution of weight for this sample of professional bull riders is approximately
# Normal with a mean of 152.03 lbs and a standard deviation of 14.36 lbs. We found that
# their mean weight is significantly different than 190 lbs, with t= -16.30, p less than
# 0.05. We are 95% confident that the true mean of professional bull riders is between 
# 147.31 lbs and 156.75 lbs, suggesting that professional bull riders weigh less than the
# average adult male.