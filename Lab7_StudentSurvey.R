# Review of the Central Limit Theorem
 
# In this lab, you will use a simulation to better understand the Central Limit Theorem.
# Let's start by remembering the key features of the Central Limit Theorem.

# 1a) In this lab, we will draw samples to answer the following question: What percentage 
# of the time are college students happy? How does the Central Limit Theorem predict our 
# answer to this question will change as sample size increases?
# As sample size increases, our sample means should become less variable and be closer to the true mean.
# 1b) What does it mean to increase the sample size in a simulation?
# It means to draw more individuals in each of our samples.
# 1c) What should be true about our sampling distributions as we increase our sample size?
# The means should remain about the same, but the standard errors should decrease. 

# Lab Preparation
library(SDSFoundations)
survey <- StudentSurvey 

#########################################
# Primary Research Question

# What percentage of the time are college students happy?  How does our estimate of the true mean
# change as sample size increases?

# Analysis

# Letfs break this question down into the different descriptive statistics that you will need to construct your answer.  Be sure that your R output includes all of the following components. 

# Determine the population parameters:
# 1. Visualize the shape of the population data by making a histogram.  
hist(survey$happy)
# 2. Calculate the gtrueh mean and standard deviation of the population.
mean(survey$happy)
sd(survey$happy)

# Compare the sample statistics:  
# 3. Draw 1,000 samples of size n=5 from the population data.  Calculate the mean of each sample. 
xbar5 <- rep(NA,1000)
for (i in 1:1000) {
        x <- sample(survey$happy, size=5)
        xbar5[i] <- mean(x)
}
# 4. Graph these 1,000 sample means in a histogram and examine the shape.
hist(xbar5)
# 5. Calculate the mean and standard deviation of the sampling distribution.
mean(xbar5)
sd(xbar5)
sd(survey$happy)/sqrt(5)
# 6. Repeat this process for samples of size n=15 and n=25.
xbar15 <- rep(NA,1000)
for (i in 1:1000) {
        x <- sample(survey$happy, size=15)
        xbar15[i] <- mean(x)
}
hist(xbar15)
mean(xbar15)
sd(xbar15)
sd(survey$happy)/sqrt(15)

xbar25 <- rep(NA, 1000)
for (i in 1:1000) {
        x <- sample(survey$happy, size=25)
        xbar25[i] <- mean(x)
}
hist(xbar25)
mean(xbar25)
sd(xbar25)
sd(survey$happy)/sqrt(25)
# 7. Compare the results you get to the predictions of the Central Limit Theorem.

# Population Parameters

# 1a) What is the shape of the population happiness scores?
# negatively skewed
# 1b) What percentage of the time are college students happy, on average? 
# (report with no decimals and no %)
# 78
# 1c) What is the standard deviation of the happiness percent scores? (report to 1 decimal place)
# 16.3
# 1d) Is it more common for students to have high or low happiness percent scores relative 
# to the range of percent scores in the population?
# high

# Simulation

# For the sampling distributions:
        
# 2a) The mean was ________ for all three sampling distributions.
# approximately the same
# 2b) The sample error (SE) ________ as sample size increased.
# decreased
# 2c) The distributions became _______ as sample size increased.
# more normal

# Central Limit Theorem

# 3a) According to the Central Limit Theorem, what do we expect the mean to 
# be for each sampling distribution (n=5, n=15 and n=25)? (report to 2 decimal places)
# 78.03
# 3b) According to the Central Limit Theorem, what should be the standard error for 
# the sampling distribution of n=5? (report to 2 decimal places).
# 7.29
# 3c) According to the Central Limit Theorem, what should be the standard error for 
# the sampling distribution of n=15? (report to 2 decimal places).
# 4.21
# the sampling distribution of n=25? (report to 2 decimal places).
# 3.26
# 4) Based on these simulations, what can you say about the relationship between the shape of the 
# population and the shape of the sampling distribution of means?
# If the sample size is large enough, the sampling distribution will be Normal no matter what the 
# shape of the population.

#####################################
# Write Your Conclusion

# Answer the question and support your answer with statistics:
        
#         In this lab, we knew the average percentage of the time college students are happy for our
# population of college students. The population mean was 78.03% and the standard deviation was 16.31%.
# The happiness scores were negatively skewed. We drew samples of different sizes from our population
# to simulate the Central Limit Theorem. In short, the CLT says three things:
        
# 1. As sample size increases, sampling distributions become more Normal.
# 2. The mean of the sampling distribution will be the population mean.
# 3. The variability of the sample means, or the standard error, can be predicted by dividing the 
# population standard deviation by the square root of the sample size.

# Our simulation results were consistent with this theory. As we increased the size of our sample from
# 5 to 25, the sample means become less variable and tended to cluster more tightly around the true mean.
# In other words, our sample means became better estimators of the true population mean. In addition, 
# the shape of the distribution became more normal as sample size increased.