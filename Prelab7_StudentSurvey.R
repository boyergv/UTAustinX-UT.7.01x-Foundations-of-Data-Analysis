library(SDSFoundations)
survey <- StudentSurvey

##############################
# Check the Data

# 1a) How many students are in this dataset?
# 379
# 1b) How many of the first 10 students in the dataset had names longer than 5 letters?
first10 <- survey[1:10,]
sum(first10$name_letters>5)
# 5
# 1c) How long is the name of the first student in the dataset who is happy less than 40% of the time?
survey[survey$happy<40,"name_letters"]
# 7

# Check the Variables of Interest

# 2a) Which variable tells us how many letters are in each studentfs first name? 
# The name of this variable in the dataset is:
# name_letters        
# 2b) What type of variable is this--categorical or quantitative?
# quantitative

# Reflect on the Method

# 3a) What makes something a sampling distribution?
# It is a distribution of sample statistics, such as a distribution of sample means.
# 3b) What does the Central Limit Theorem predict about a sampling distribution of means?
# All of these

########################################
# Breakdown Your Analysis

# Calculate the population parameters
hist(survey$name_letters)
fivenum(survey$name_letters)
mean(survey$name_letters)
sd(survey$name_letters)


# Draw 1,000 samples of n=5 and find the mean of each sample.
xbar5 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =5)
 xbar5[i] <-  mean(x)}


# Graph the histogram of 1,000 sample means.
hist(xbar5,xlim=c(2,10))


# Calculate the mean and sd of the sampling distribution.
mean(xbar5)
sd(xbar5)

# Compare to the std dev predicted by the CTL.
sd(survey$name_letters)/sqrt(5)


#Repeat for samples of size n=15
xbar15 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =15)
 xbar15[i] <- mean(x)}
hist(xbar15,xlim=c(2,10))
mean(xbar15)
sd(xbar15)
sd(survey$name_letters)/sqrt(15)


#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =25)
 xbar25[i] <- mean(x)}
hist(xbar25,xlim=c(2,10))
mean(xbar25)
sd(xbar25)
sd(survey$name_letters)/sqrt(25)

# Focus on this portion of the code in order to answer the following questions:
# xbar5<-rep(NA, 1000)
# for (i in 1:1000)
# {x<-sample(survey$name_letters, size =5)
#  xbar5[i] <- mean(x)}
# 1a) What is x?
# x is a sample of 5 data values drawn from the population 
# 1b) What is mean(x)?
# It is the mean of the 5 data points drawn in each sample. It is the mean of the 5 
# data points drawn in each sample.
# 1c) When the loop is in the 200th iteration (i=200), what will the following code be doing:
# Calculating the mean of the 200th sample, and placing it in the 200th position of xbar5 vector.
# 2) The standard deviation of a sampling distribution is called a "standard error." 
# What goes in the denominator of this equation to solve for standard error (SE)?
# SE=ƒÐ / ?
# ãn 

##################################
# Conduct the Analysis in R
# Population Parameters

# 1a) What is the average name length, in number of letters, for all of the students in 
# the population? (Round to 2 decimal places.)
mean(survey$name_letters)
# 5.97
# 1b) By how many letters, on average, do names vary from the mean? (Round to 2 decimal places.)
sd(survey$name_letters)
# 1.49
# 2) In this lab, each time we sampled from our population we kept the ________ the same at 1,000,
# but we increased the ________ from 5 to 25.
# number of samples
# sample size

# Observing the Sampling Distributions

# 3a) The mean was ________ for all three sampling distributions.
# About the same
# 3b) The size of the standard error ________ as the sample size increased from 5 to 25.
# Decreased
# 3c) The distributions became more and more ________ as the sample size increased.
# Normal

# According to the Central Limit Theorem:
# 4a) What is the mean of the sampling distribution (for n=5, 15, or 25)? (Round to 2 decimal places)
# 5.97
# 4b) What is the standard error of the sampling distribution for n=5?
# 0.669
# 4c) What is the standard error of the sampling distribution for n=15?
# 0.386
# 4d) What is the standard error of the sampling distribution for n=25?
# 0.299
# 5) Were the results of the simulations consistent with what the CLT predicted?
# Yes

##########################################
# Write Your Conclusion

# Answer the question and support your answer with statistics:
        
#         In this lab, we knew the average name length for our population of college students.
# The population mean was 5.97 letters and the standard deviation was 1.49. The name lengths 
# were normally distributed. 

# We drew samples of different sizes from our population to simulate the Central Limit Theorem.
# In short, the CLT says three things:
# 1. As sample size increases, sampling distributions become more normal.
# 2. The mean of the sampling distribution will be the population mean. 
# 3. The variability of the sample means can be predicted by dividing the population standard 
# deviation by the square root of the sample size.

# Our simulation results were consistent with this theory. As we increased the size of our sample
# from 5 to 25, the sample means become less variable and tended to cluster more tightly around the
# true mean. In other words, our sample means became better estimators of the true population mean.