# Question 1

# On a scale of 1 to 10, how much do UT Austin students like Austin?

# 1. What are the true mean and standard deviation for our population of UT Austin students?
# 2. What should the sampling distribution of the mean look like, as predicted by the Central Limit Theorem?
# 3. How do our simulated values compare to these predicted values?

library(SDSFoundations)
survey <- StudentSurvey

# 1a. Create a histogram of the "austin" variable for the entire population of students that took
# the survey. Which best describes the shape of the distribution?
austin <- survey$austin
hist(austin)
# Left skewed
# 1b. What is the population mean for the "austin" variable? (Round to 2 decimal places.)
mean(austin)
# 8.39
# 1c. What is the population standard deviation for the "austin" variable? (Report to 2 decimal places.)
sd(austin)
1.51
# 1d. Use the Central Limit Theorem to predict the mean and standard deviation of the sampling distribution 
# of means for samples of size n=10 drawn from this population: 
# 8.39
# What is the expected standard deviation? (Round to 2 decimal places.)
sd(austin)/sqrt(10)
# 0.48
# 1e. Simulate drawing 1,000 random samples of sample size n=10 from the "austin" distribution, then 
# create a histogram of the sampling distribution and calculate it's mean and standard deviation. 
# How do these simulated values compare to the those predicted by the Central Limit Theorem?
xbar10 <- rep(NA,1000)
for (i in 1:1000) {
        x <- sample(austin, size=10)
        xbar10[i] <- mean(x)
}
hist(xbar10)
mean(xbar10)
# 8.38
sd(xbar10)
# 0.48
# The values are close to one another.

##########################################
# Question 2

# A population of sunflower plants is described as having a monthly growth rate that follows a normal 
# distribution with ƒÊ = 3.08 in and ƒÐ = 0.40 in.

# 2a. What is the probability that a randomly chosen sunflower plant grows more than 3.2 inches in a month?
# (Round to 3 decimal places.)
z = (3.2 - 3.08)/0.40
1 - pnorm(z)
# 2b. A middle-school science class grew 25 of these sunflowers. How many inches would they expect these
# flowers to have grown, on average, one month later? (Round to 2 decimal places.)
# 3.08
# 2c. The middle school science teacher replicates her study with 25 new sunflowers every year. How much 
# variability should she expect in the average monthly growth of these samples? (Round to 2 decimal places.)
0.40/sqrt(25)
# 0.08
# 2d. The science teacher notices that the average monthly growth of her 25 sunflowers has never exceeded 3.2 
# inches. What should she conclude?
# We wouldn't expect to see an average monthly growth of 3.2 inches for a sample of 25 plants. 
# Her data is probably fine. 
# 2e. What is the probability that her next sample of 25 sunflowers will grow an average of more than 2.9,
# but less than 3.2 inches, in a month? (Report as a proportion rounded to 3 decimal places.)
pnorm((3.2-3.08)/(0.4/sqrt(25))) - pnorm((2.9-3.08)/(0.4/sqrt(25)))
# 0.921

################################
# Question 3

# A very large company has its headquarters in a 15-story downtown office building. The morning
# commute time for employees of this company is normally distributed with a mean of 28 minutes
# and a standard deviation of 11 minutes.

# The company in the building next door samples 23 of its employees and finds that their mean 
# commute time is 35.1 minutes. Is there evidence that their commute time is longer than the other
# company's, or is this just random sampling error?

# 3a. What is the expected mean of the sampling distribution for samples of size n=23? 
# (Report as a whole number)
# 28
# 3b. What is the standard error of the sampling distribution for samples of n=23? 
# (Round to 2 decimal places.)
11/sqrt(23)
# 2.29
# 3c. What is the z-score for the neighboring company's sample mean? (Round to 1 decimal place.)
(35.1-28)/(11/sqrt(23))
# 3.1
# 3d. What is the probability of observing a sample mean this high (or higher), if the employees 
# really do commute the same amount of time?
# Less than 0.001 
# 3e. What should we conclude about the sample mean of 35.1 minutes?
# It is a sample mean that is not likely to be observed.
# Their average commute time is probably NOT the same as the large company next door
# (our original population). 
# 3g. What must we assume about the 23 people that were sampled for our conclusion to be valid?
# They must be a representative sample of employees at the company.

################################
# Question 4

# Dixie Queen uses an automatic ice cream dispenser to fill pint-sized containers of ice cream.
# The company that makes the dispenser says the volume it dispenses into each container follows
# a normal distribution with ƒÐ= 1.5 ml.
# The Dixie Queen manager randomly selected 15 ice cream pints and found that the average volume 
# was 471.46 ml. She wants to know if her machine is performing as expected.
# 4a. What is the expected variability in sample means of size n=15? (Find the standard error and
#                                                                     round to 3 decimal places.)
1.5/sqrt(15)
# 0.387
# 4b. What is the margin of error, assuming 95% confidence? 
# (Round to 3 decimal places and use this value in the following calculations.)
1.96*1.5/sqrt(15)
# 0.759
# 4c. Find the 95% confidence interval for the mean volume for this sample of 15 randomly selected 
# ice cream pint containers.
# Lower Bound (Round to 1 decimal place.)
471.46-0.759
# 470.7
# Upper Bound (Round to 1 decimal place.)
471.46+0.759
# 472.2
# 4d. A pint is equivalent to 473.20 ml. Do you think the dispenser is working as reported?
# No

