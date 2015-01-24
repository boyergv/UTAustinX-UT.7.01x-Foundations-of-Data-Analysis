library(SDSFoundations)
library(dplyr)
post <- PostSurvey

# Check the Data

summary(post)
names(post)
head(post)
# 1a. How many students are in the dataset?
214
# 1b. What is the classification of the first male student? (Make sure your spelling matches the 
#                                                            variable outcome as spelled in the dataframe.)
post %>%
        select(classification,gender) %>%
                filter(gender=='Male') %>%
                        slice(1:1)
1c. Of the first 10 students in the dataset, what percentage live on campus? (Report without the "%" sign.)
post %>%
        slice(1:10) %>%
                filter(live_campus=='yes') %>%
                        summary()
# 50                  

# Check the Variables of Interest

# Let's find the variables we need to answer the question.

# 2a. Which variable tells us whether a student is a lower-classman (freshman or sophomore)?
# The variable name in the dataset is classification which is a categorical variable.
# 2b. Which variable tells us how happy students were at the beginning of the semester?
# The variable name in the dataset is happy, which is a quantitative variable.
# 2c. Which variable tells us how happy students were at the end of the semester?
# The variable name in the dataset is post_happy, which is a quantitative variable.
                
# Reflect on the Method

# 3a. We will use an independent t-test to help us compare the happiness of the under and upper-classmen. Why?
# We want to compare the happiness of two different populations of students. 
# 3b. We will use a dependent t-test to help us determine whether happiness levels changed over the semester. Why?
# We are looking for a change over time for the same group of students. 

###################################
# Breakdown Your Analysis
# Lab Question 1

# Make a vector of happiness scores for each sample
underclass_happy <- post$happy[post$classification=='Freshman'|post$classification=='Sophomore']
upperclass_happy <- post$happy[post$classification=='Junior'|post$classification=='Senior']
# Check the normality assumption
hist(underclass_happy, xlab='Underclassman Happiness', main='Percent of Time Happy')
hist(upperclass_happy, xlab='Upperclassman Happiness', main='Percent of Time Happy')
# Run independent t-test
t.test(underclass_happy, upperclass_happy)

# Lab Question 2

# Make a vector of difference scores
post$diff_happy <- post$happy - post$post_happy
# Check the normality assumption
hist(post$diff_happy, xlab= 'Difference in Happiness over the Semester', main = 'Happy-Post Happy')
# Run dependent t-test
t.test(post$happy, post$post_happy, paired=T)

# 1. Which classifications of students are considered upperclassmen, according to the code above?
# juniors and seniors

# 2. How many sample means are being compared in the t-test for Lab Question 1?
# two

# 3. What does this line of code do?
# Creates a new variable for each student in the dataset 

# 4. A student was happy 75% of the time at the beginning of the semester and 90% at the end of the semester.
# What will be the value of post$diff_happy for this student?
# -15

#####################################
# Conduct the Analysis in R
# 1a. What percent of the time, on average, were underclassmen happy? (round to one decimal place)
mean(underclass_happy)
# 1b. What percent of the time, on average, were upperclassmen happy? (round to one decimal place)
mean(upperclass_happy)
# Report test results, rounded to 3 decimal places:
# 1c. t-statistic= 0.423
# 1d. p-value=@0.675
# 1e. We should fail to reject the null hypothesis that there is no difference in happiness between 
# under- and upper-classmen at the beginning of the semester.
# 2a. How many students were in this analysis?
length(upperclass_happy)
# 2b. The average change in happiness was 1.27%. Was this an increase or decrease over the semester?
# decrease

# Lab Quesiton 2
# 3a. The distribution of underclassmen happiness was ________.
# left-skewed
# 3b. The distribution of upperclassmen happiness was ________.
# left-skewed
# 3c. The distribution of happiness difference scores was ________.
# Nearly normal but with a slight positive skew

###############################
# Write Your Conclusion

# Answer the question and support your answer with statistics:
        
#         The average happiness scores for under-classmen (79.7%) and upper-classmen (78.3%) were not found
# to be significantly different (t=   0.423 - correct , p = 0.675). The distribution of scores for each 
# group were negatively skewed. However, the sample sizes were both sufficiently large to meet the assumption
# for Normality. Over the semester, student happiness decreased by an average of 1.27%. This was not a 
# statistically significant change (t=1.684 and p=.094). Overall, there does not appear to be any significant
# difference in levels of student happiness based on their year in college, or the time of the semester.
