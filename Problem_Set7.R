# Question 1

# How much money do professional bull riders earn by participating in an event?

# 1. Create a new variable that equals the "average earnings per event" in the 2012 season for each 
# bull rider in the dataset.
library(SDSFoundations)
bull <- BullRiders
str(bull)
season2012 <- bull[bull$Season==2012,]
averEarn <- season2012$Earnings/season2012$Events
# 2. Make a histogram of your "earnings per event" variable.
hist(averEarn)
# 3. Use this data to answer the following questions.

# 1a. Have we met the assumptions for being able to calculate a 95% confidence interval to estimate 
# the true mean earnings-per-event for a professional bull rider (using t)?
# No
# 1b. Make a histogram of this log-transformed variable. Notice how the distribution shape has changed.
# Can we reliably calculate a 95% confidence interval for the mean of this transformed variable?
hist(log(averEarn))
# Yes
# 1c. What is the mean of the log-transformed earnings-per-event variable? (Round to 2 decimal places.)
# 8.77
# 1d. What are the lower and upper-bounds for a 95% confidence interval around this transformed mean? 
# (Round each to 2 decimal places.)
# Lower-bound =  8.53
# Upper-bound = 9.00
# 1e. What are the lower and upper-bounds for a 95% confidence interval in dollars/event units. 
# (Round each to whole numbers with no decimal places.)
exp(8.53)
exp(9.00)
# 5064.446
# 8103.084

####################################
# Question 2
# Students collected 8 random bags of a specific brand of potato chips and carefully weighed the contents
# of each bag, recording the following weights (in grams): 
        
#        29.4      29.0      28.4      28.8      28.9      29.3      28.5      28.2 
# The students want to test the claim that the mean weight of these bags is 28.5 grams.  They think it may
# be different. 

# 2a. What is the appropriate null hypotheses for this test?
# H0 = 28.5
# 2b. What are the sample mean and standard deviation? (Round each to 2 decimal places.)
stringList <- strsplit("29.4      29.0      28.4      28.8      28.9      29.3      28.5      28.2","      ")
num <- lapply(stringList, as.numeric)
lapply(num, mean)
lapply(num, sd)
# Mean = 28.81
# Standard deviation = 0.42
t.test(unlist(num),mu=28.5)
# t-test = 2.08
# 2d. What is t-critical for this test, assuming an alpha level of 0.05? (Round to 3 decimal places.)
# 2.365
# 2f. In addition to random selection, what other condition of the data must be true for our t-test outcome 
# to be reliable?
# The bags of potato chips must have an approximately Normal population distribution for weight.
# 2g. Does your data provide sufficient evidence to suggest that the mean weight of these bags of potato chips 
# is not 28.5 g per bag?
# No

###################################
# Question 3
# 
# An industrial plant dumps its waste into a nearby river, but claims that it is not impacting the native 
# species of frogs that live in the river.  The frogs are able to tolerate calcium concentrations up to 91 mg/L.  
# 
# You measure the concentration of calcium in 25 random samples from the river.  Your measurements are approximately 
# normally distributed, with a mean of 93.6 mg/L, with a standard deviation of 7.8 mg/L.  

# 3a. What is the appropriate alternative hypothesis if the industrial plant's runoff is believed to be producing 
# higher calcium concentrations than are deemed acceptable for the frogs?
# ƒÊ>91
# 3b. Calculate the test statistic. (Round to 2 decimal places.)
(93.6 - 91)/(7.8/sqrt(25))
# t-test = 1.67
# 3c. What is the t-critical value? (Round to 3 decimal places.)
# 1.711 (look up in t critical value table)
# 3d. Does your data provide sufficient evidence to suggest that the calcium concentration in the river is more
# than 91 mg/L?
# No (because t-statistic is smaller than t critical value)
# 3e. Suppose as part of a broader investigation into the plant's impact on the river's ecosystem, an environmental
# group conducted a large-scale study and found that the actual mean calcium concentration level downstream from 
# the plant is 95 mg/L. Did you make an error in your hypothesis test, and if so, what type was it?
# Yes, a Type II Error 

##############################
# Question 4
# You are studying a population of peregrine falcons and want to estimate their average wingspan.  So you collect a
# random sample of 12 adult male birds and measure a mean wingspan of 42.6 cm, with a standard deviation of 5.3 cm. 

# Assume that the distribution of measurements was approximately normal.
# 4a. What is t-critical for a 90% confidence interval? (Report as a positive value to 3 decimal places.)
# 1.796
# 4b. Calculate a 90% confidence interval for the mean wingspan for the population of male peregrine falcons. 
# (Round to 2 decimal places.)
42.6 - 5.3/sqrt(12)*1.796
# Lower-bound = 39.85
42.6 + 5.3/sqrt(12)*1.796
# Upper-bound = 45.35
# 4c. If you calculated a 95% confidence interval for the population mean from the same data, would your confidence 
# interval be narrower or wider than your interval above?
# Wider