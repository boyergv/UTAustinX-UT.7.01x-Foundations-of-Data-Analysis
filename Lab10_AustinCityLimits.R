# Review of Chi Square Tests

# 1a. In a Chi Square Goodness of Fit test, a proposed distribution model is compared to an observed
# marginal distribution.

# 1b. Two categorical variables are said to be independent if their conditional distribution matches
# the distribution of expected counts, when the variables are assumed not to be related. 

#####################################
# Lab Preparation
library(SDSFoundations)
acl <- AustinCityLimits
# 2a. Are each of the four musical genres equally represented on Austin City Limits?
# goodness of fit test
# 2b. Are some genres more likely to draw a large (100K+) Twitter following than others?
# test of independence

#####################################
# Primary Research Questions

# 1. Are each of the four musical genres equally represented on Austin City Limits?   
# 2. Are some genres more likely to draw a large (100K+) Twitter following than others?

# Goodness of Fit Test:
# 1. Create a table to show the counts of each genre.
genres <- table(acl$Genre)
# 2. Create a vector of expected proportions.
expProp <- c(0.25,0.25,0.25,0.25)
# 3. Check the expected counts assumption.
chisq.test(genres, p=expProp, correct=FALSE)$expected
# 4. Run a chi square test.
chisq.test(genres, p=expProp, correct=FALSE)
# 5. Interpret the chi square statistic and p-value.
# We should reject the hypothesis that each genre is equally represented at ACL Live.

# Test of Independence:
# 1. Create a two-way table for genre and Twitter following.
genreTwit <- table(acl$Genre,acl$Twitter.100k)
genreTwit
# 2. Check the expected counts assumption.
chisq.test(genreTwit, correct=FALSE)$expected
# 3. Run a chi square test.
chisq.test(genreTwit, correct=FALSE)
# 4. Interpret the chi square statistic and p-value.
# We should fail to reject the hypothesis that genre is independent of Twitter followers.
# However, we note that there were fewer than 5 expected jazz artists with 100K+ Twitter 
# followers. This may make our chi square statistic unreliable.

#######################################
# Write Your Conclusion

# Answer the question and support your answer with statistics:
        
#         First we examined whether genres were represented equally at Austin City Limits. In our 
# sample, there were 18 country, 13 jazz/blues, 68 rock/folk/indie, and 17 singer/songwriter acts.
# A Chi-square  Goodness of Fit test Goodness of Fit test showed that this difference was
# was statistically significant. (Chi-square=   70.41, df=   3 3, p<0.05).
# There is a higher representation of rock/folk/indie rock/folk/indie artists than other artists on 
# the show.

Second, we asked whether some genres were likely to draw more Twitter (over 100K). A Chi-square  Test of Independence Test of Independence - correct revealed that there was no significant finding--a large Twitter following was   independent of independent of - correct genre (Chi-square=   5.69 5.69 - correct , df=  3 3 - correct , p-value=0.1276). However, the assumption of an expected count minimum for each cell was found to be violated: Large Twitter following and the genre of jazz/blues had an expected count of  4.70 4.70 - correct . Because of this violation of a Chi-square assumption, the above results may be unreliable.
