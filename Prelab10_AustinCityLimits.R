# Check the Data
library(SDSFoundations)
acl <- AustinCityLimits
summary(acl)

# 1a. In what year did Allen Toussaint play at Austin City Limits?
acl[acl$Artist=="Allen Toussaint",'Year']
# 1b. How many years old was Allen Toussaint when he performed?
acl[acl$Artist=="Allen Toussaint",'Age']
# 1c. How many variables for Allen Toussaint have missing data?
sum(is.na(acl[acl$Artist=="Allen Toussaint",]))

# Check the Variables of Interest
# Let's find the variables we need to answer the question.

# 2a. Which variable tells us whether the performer is male or female?
# The variable name in the dataset is Gender, which is a categorical variable.
# 2b. Which variable tells us whether the artist has had a Top 10 hit?
# The variable name in the dataset is BB.wk.top10, which is a categorical variable.

# Reflect on the Method
# Which method should we be using for this analysis and why?
# 3a. We will use a Chi Square Goodness of Fit test to check whether there were an equal number of 
# male and female performers. Why?
# We want to see if the distribution of a categorical variable matches a proposed distribution model. 
# 3b. We will use a Chi Square Test of Independence to determine if male and female performers were equally
# likely to have had a Top 10 hit. Why?
# We want to determine if there is an association between two categorical variables.

###############################
# Primary Research Questions

# 1. Are there an equal number of male and female performers on Austin City Limits?
# 2. Are male performers just as likely to have had a Top 10 hit as female performers?

# Breakdown Your Analysis

# Create a table of counts for Gender
gender_tab <-table(acl$Gender)
gender_tab

# Create vector of expected proportions
ExpGender <- c(.50, .50)

# Check expected counts assumption
chisq.test(gender_tab, p=ExpGender)$expected

# Run goodness of fit
chisq.test(gender_tab, p=ExpGender)

# Create two-way table
gender_top10 <-table(acl$Gender, acl$BB.wk.top10)
gender_top10

# Generate expected counts
chisq.test(gender_top10, correct=FALSE)$expected

# Run test of independence
chisq.test(gender_top10, correct=FALSE)

# 1. If we wanted to test the hypothesis that the performers were 30% female and 70% male, what would 
# the code look like? (Note that categorical values are referenced in alphabetical order).
ExpGender <- c(.30,.70)
# 2. Suppose the following values were returned for the "check expected counts" assumption in our goodness 
# of fit test. Would the assumption be violated?
# F M
# 3 29
# Yes, because there are fewer than 5 expected Females.
# 3. Which line of code is not necessary for a test of independence because there is no particular distribution
# model being tested?
ExpGender_top10 <- c(.25, .25, .25, .25)
# 4. How many degrees of freedom should there be for our test of independence? Remember, performers have either 
# had (or not had) a Top 10 hit.
# 1

###################################
# Conduct the Analysis in R

# 1a. There were 81 male and 35 female artists.
# 1b. The expected counts were 58 artists of each gender.
# 1c. Chi Square (rounded to 2 decimal places, with df=1)= 18.24
# 1d. Was the p-value less than 0.05?
# yes
# 1e. We should reject the hypothesis that there were an equal number of male and female performers at ACL Live.

# 2a. Among the male artists, 32 out of 70 had a Top 10 hit.
# 2b. Among the female artists, 18 out of 33 had a Top 10 hit.
# 2c. Based on these values, there must have been 11 males and 2 females with missing values for the Top 10 variable.
# 2d. Chi Square (rounded to 3 decimal places, df=1)= 0.7002
# 2e. p-value (rounded to 3 decimal places)= 0.4027
# 2f. We should fail to reject the hypothesis that gender is associated with having a Top 10 hit.

# 3. Was the expected counts assumption violated in either of these chi square tests?
# It was not violated in either test.

##################################
# Write Your Conclusion

# Answer the question and support your answer with statistics:
        
#         First we examined whether there were an equal number of male and female artists on Austin 
# City Limits. In our sample, there were 81 males and 35 females. A chi square goodness of fit test
# showed that this difference was statistically significant (chi square=   18.24 - correct df=1, p<.05).
# There are more males than females on the show. Second, we asked whether male and female artists were
# equally likely to have had a Top 10 hit. Approximately 55% of the female artists had a Top 10 hit,
# and 46% of the male artists had a Top 10 hit. This difference was not statistically significant. 
# A chi square test of independence found top 10 hits to be independent of gender 
# (chi square= 0.700, df=1, p= 0.403). The assumptions for each test were met.