library(SDSFoundations)
library(dplyr)
film <- FilmData
View(film)
# Question 1
# Do low-budget movies make a different percentage of their profits domestically than movies with medium- or high-budgets? 

# 1. Suppose films with a budget less than $100 Million are considered "low-budget"; films with a budget of $100-150 Million are
# considered "medium-budget", and those with a budget of $150 million or more are "high-budget."  
# 2. Create a new categorical variable in the dataset that defines each film under these criteria.
film$Level <- rep(NA,151)
for (i in 1:151) {
    if (is.na(film[i,"Budget"]) == F) {
        if (film[i,"Budget"] >= 150) {film[i,"Level"] <- "high"}
        else if (film[i,"Budget"] < 150 & film[i,"Budget"] >= 100) {film[i,"Level"] <- "medium"}
        else {film[i,"Level"] <- "low"}
    }
}

# 3. Use this data to answer the following questions.
# Visualize the group means and variability
boxplot(film$Budget~film$Level, main="Budget by levels", xlab="Levels", ylab="Million dollars")
# 1a. How many films fall into each of the budget categories?
table(film$Level)
# high-budget=42
# medium-budget=41
# low-budget=67
# 1b. Calculate the mean percent domestic for each group and enter them below. 
# (Report answers as percentages rounded to one decimal place.)
aggregate(Pct.Dom~Level,data=film,mean)
# 1c. What is the F-statistic for this test? (Round to 1 decimal place.)
pctModel <- aov(film$Pct.Dom~film$Level)
summary(pctModel)
# 1d. What are the degrees of freedom?
# Numerator Degree of Freedom = number of groups - 1 = 2
# Denominator Degree of Freedom = total subjects - number of groups = 147
# 1e. What is the p-value of the test? (Round to 3 decimal places.)
0.001
# 1f. What is the appropriate conclusion for this test?
# The mean percent gross earned domestically is NOT equal across all budget groups. 

# 1g. Run a Tukey HSD post-hoc analysis and chose the correct adjusted p-values for each pairwise comparison listed below.
TukeyHSD(pctModel)
# Low vs. High = 0.002
# Low vs. Medium = 0.01
# Medium vs. High = 0.898
# 1h. What is the appropriate conclusion for the post-hoc analysis?
# Low-budget films earn a greater percentage of their profit domestically than either medium-budget or high-budget films.

#############################
# Question 2
# Alone	Good Friend	Pet Dog
# Mean	82.52	91.32	73.48
# SD	9.24	8.34	9.97
# 2a. What is the appropriate null hypothesis for this test?
# H0:ƒÊ1=ƒÊ2=ƒÊ3

# Find F-critical
qf(0.95,2,42)
# 2b. To run a reliable ANOVA, what must be true of this data?
# The heart rate data should be normally distributed in each group. 
# Each group should have approximately equal standard deviations. 
# Each group has independent, random data.
# 2c. What are the degrees of freedom for this test?
# dfb = 2
# dft = 44
# dfw = 42
# SSw = SSt - SSb =  5949.1 - 2387.7
# MSb = SSb/2 = 1193.85
# MSw = SSw/42 = 84.8
# 2e. In this problem, you find that SStotal = 5949.1 and SSBetween = 2387.7. What is the F statistic for the test?
# F_stat = MSb/MSw =  14.07901
# 2f. What is the outcome of this test?
# Reject the null hypothesis

##################################
# Question 3
# Section 1  Section 2  Section 3
#     8	        3	        1
#     4	        7	        2
#     6	        0	        7
#     8	        2	        6
#     6	        7	        5
#     4	        5	        0
# dfb = 2
# dft = 17
# dfw = 15
qf(0.95,2,15)
tickets <- read.csv("Pset11_Q3.txt")
sum(tickets)         
y = c(8,3,1,4,7,2,6,0,7,8,2,6,6,7,5,4,5,0)
grandMean = sum(y)/18
# 3c. What is SSTotal for this problem? (Round to 1 decimal place.)
SSt = sum(y^2) - (sum(y)^2)/18
SSb = sum(6*((c(mean(tickets$Section.1),mean(tickets$Section.2),mean(tickets$Section.3))-grandMean)^2))
SSw = SSt - SSb
# 3d. What is MSBetween for this problem? (Round to 1 decimal place.)
MSb = SSb/dfb
# 3e. What is MSWithin for this problem? (Round to 1 decimal place.)
MSw = SSw/dfw
# 3f. What is the F statistic for this test? (Round to 3 decimal places.)
F.Stat = MSb/MSw
# 3g. What is the appropriate conclusion for this test?
# There is NO evidence to suggest that police officers are giving out a different number of tickets 
# in these three sections, on average.

##########################
# Question 4
# Below is the source table for a study on sleep aids, comparing the effectiveness of three (3) different treatments.  Note that some of the elements of the table are missing. 

#                       SS      df	    MS	    F
# Between Treatments	782.00			
# Within Treatments		        34		
# Total	                2,147.00
# 4a. What is SSWithin ?
SSt = 2147
SSb = 782
SSw = SSt - SSb
# 4b. What is dfTotal ?
dft = N = 36
k = 3
dfb = k - 1 
dfw = N - k

# 4c. What is MSWithin ? (Round to 2 decimal places.)
MSw = SSw/dfw
# 4d. What is the F statistic? (Round to 2 decimal places, and use your rounded answer from 4c.)
MSb = SSb/dfb
F_Stat = MSb/round(MSw,digits=2)
# 4e. Using an F-critical of 3.28, what is the appropriate conclusion of the test?
# At least one of the sleep aids performs better than the others.
# 4f. You decide to perform a post-hoc analysis on these groups means using a Bonferroni correction. How many group mean comparisons will you do?
3
# 4g. What should be the new significance level for your post-hoc tests, assuming an original ƒ¿=0.05? (Round to 3 decimal places.)
0.05/3
# 4h. Here are the results from your post-hoc analysis. These are the p-values from the actual t-tests. They are not adjusted, so be sure to compare
# them to the significance level you calculated above.

#               T-Statistic    P-Value
# Group 1 - Group 2	1.90	    0.137
# Group 1 - Group 3	3.79	    0.004
# Group 2 - Group 3	3.44	    0.028
# Look for P-value that is smaller than 0.05/3
# The Sleep Aid 1 was significantly different the Sleep Aid 3 group.