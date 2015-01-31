library(SDSFoundations)
acl <- AustinCityLimits

# Question 1
# You want to know if the proportion of female performers on Austin City Limits Live has changed in the past two years. 

# 1. Create a new variable in the dataset called "Recent" that is equal to a 1 for rows from years 2012 
# or 2013 and is equal to 0 for all other rows.
acl$Recent[acl$Year < 2012] <- 0 
acl$Recent[acl$Year >= 2012] <- 1
# 2. Make a table that shows the number of male and female performers in "recent" and non-recent years.
GenRe <- table(acl$Gender,acl$Recent)
chisq.test(GenRe, correct=F)$expected
chisq.test(GenRe, correct=F)
# 3. Use this data to answer the following questions.
# 1a. How many female performers have been on the show in the past two years (2012 and 2013)?
sum(acl[acl$Gender=="F",]$Recent)
# 1b. What is the appropriate method to test if representation by female performers is different before
# 2012 compared to since 2012?
# Chi-Square Test of Independence 
# 1c. Report expected counts for the following performer groups.
# Females before 2012
# 26.55
# Females in 2012 and 2013
# 8.45
# Males before 2012
# 61.45
# Males in 2012 and 2013
# 19.55
# 1d. What is the Chi Square statistic? (Round to 2 decimal places.)
# 2.82
# 1e. What is the p-value for the test? (Round to 2 decimal places.)
# 0.09
# 1f. What is the appropriate conclusion for this test, assuming α = 0.05?
# We fail to reject the null hypothesis; gender is independent of performance before or after 2012.

##################################
# Question 2
# When crossing white and yellow summer squash, a genetic model predicts that 75% of resulting 
# offspring will be white, 15% will be yellow and 10% will be green. 
# Below are the results from an experiment run on a random sample of 205 squash offspring.

# Color        　　　　White	Yellow	Green
# Number of Offspring	152	39	14

# create a vector of expected proportion
expProp <- c(.75, .15, .10)
chisq.test()
# 2a. Which method should we use to test if these data are consistent with the ratio of offspring
# colors predicted by the genetic model?
# Chi Square Goodness of Fit Test 
# 2b. What is the expected count of white offspring? (Round to 2 decimal places.)
(152 + 39 + 14)*.75
# 2c. What is the expected count of yellow offspring? (Round to 2 decimal places.)
(152 + 39 + 14)*.15
# 2d. What is the expected count of green offspring? (Round to 2 decimal places.)
(152 + 39 + 14)*.10
# 2e. Is the sample size condition met?
14/(152 + 39 + 14)
# yes
# 2f. What are the degrees of freedom and the critical value for this test, assuming α = 0.05?
# Degrees of freedom
# 2
# Critical Value (Round to 2 decimal places.)
# 5.99
# 2g. What is the Chi Square statistic for this test? (Round to 2 decimal places.)
(1.75^2)/153.75+(8.25^2)/30.75+(6.5^2)/20.5
# 2h. What is the appropriate outcome for this hypothesis test?
# Fail to reject the null hypothesis 

################################
# Question 3

# Approximately 13% of the world's population is left-handed, but is this proportion the same across men and women?

# To answer this question, you decide to collect data from a random sample of adults from your neighborhood, with the following results:
# Process the data and store it in Pset9_Q3.txt
data <- read.csv("Pset9_Q3.txt")
# 3a. Which of these is the appropriate null hypothesis for this test?
# Gender and hand-dominance are independent.
# 3b. What would be the degrees of freedom and the critical value for this analysis, assuming α = 0.05?
# 1
# Critical Value (Round to 2 decimal places.)
# 3.84
# 3c to 3e
# create a two-way table for gender and dominant hand
genHand <- table(data$Gender, data$Dominant.Hand)
# perform analysis on the result  
chisq.test(genHand,correct=FALSE)$expected
chisq.test(genHand,correct=FALSE)

#################################
# Question 4

# A telephone survey asked a random sample of Indiana voters about their home internet usage, as well 
# as what type of community (rural, suburban or urban) they lived in. 

# Of the 123 survey respondents, 28 were from rural areas, 42 were from suburban areas, and 53 were 
# from urban areas.  Thirteen rural respondents, 35 suburban respondents, and 50 urban respondents 
# said they had access to internet at home. 
# 4a. What is the appropriate null hypothesis for this test?
# Home internet access and community type are independent.
# 4b. What proportion of respondents had internet access at home? (Round to 1 decimal place.)
(13+35+50)/123
# 4c. What proportion of respondents did NOT have internet access at home? (Round to 1 decimal place.)
1 - 0.8
# 4d. How many rural residents would we expect to have home internet? (Round to 2 decimal places.)
28*98/123
# 4e. How many urban residents would we expect NOT to have home internet? (Round to 2 decimal places.)
(123-98)/123*53
# 4f. Does this data provide sufficient evidence that internet access at home depends on what type of 
# community the Indiana voters live in?
# Yes