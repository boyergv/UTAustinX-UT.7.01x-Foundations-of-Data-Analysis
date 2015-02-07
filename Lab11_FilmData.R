library(SDSFoundations)
library(dplyr)
film <- FilmData
View(film)
# Review of ANOVA

# In this lab, you will use ANOVA to answer a question of interest. Let's start by remembering why we use ANOVA.
# 1a. What is the goal of an ANOVA analysis?
# to determine if significant mean differences exist between multiple groups
# 1b. Two specific group means can be said to be significantly different if:
# a Tukey HSD pairwise comparison shows p < 0.05 (or the identified level of significance)
# 2. Two of the following questions will be answered in this lab using ANOVA. Select the questions that can be 
# answered with this method.
# Which studio(s) earn a greater percentage of their earnings domestically? 
# Which studio(s) are more successful in keeping their films in the theaters longer?

#############################
# Primary Research Questions

# 1. Are some studios more successful in keeping their films in the theaters longer?
# 2. Do some studios earn a greater percentage of their earnings domestically than others?

# Analysis
# 1. Identify the number of films in each studio group.
summary(film$Studio)
summary(film$Pct.Dom)
# 2. Find the mean and standard deviation of the variable of interest for each group.
# Q1
aggregate(Days~Studio, data=film, mean)
aggregate(Days~Studio, data=film, sd)
# Q2
aggregate(Pct.Dom~Studio, data=film, mean)
aggregate(Pct.Dom~Studio, data=film, sd)
# 3. Create boxplots to help visualize group differences and check test assumptions.
# Q1
boxplot(film$Days~film$Studio,main="Days in studio difference",xlab="Studio",ylab="Days in studio")
# Q2
boxplot(film$Pct.Dom~film$Studio,main="Earnings by studio",xlab="Studio",ylab="Earnings")
# 4. Run ANOVA.
# Q1
dayModel <- aov(film$Days~film$Studio) 
summary(dayModel)
# Q2
pctModel <- aov(film$Pct.Dom~film$Studio)
summary(pctModel)
# 5. If the F statistic is significant, run a Tukey HSD test to determine which groups are different.
# Q1
TukeyHSD(dayModel)
# Q2
TukeyHSD(pctModel)

# 4. Which of the following observations allow you to confirm that the distributions were nearly Normal?
# The boxplots were not highly skewed.

########################################
# Write Your Conclusion

# Answer the question and support your answer with statistics:
    
#     This analysis examined 151, top-grossing films produced by five major studios. Visual examination of the data
# through boxplots shows no violation of approximate equality of variance assumption across the five major studios.
# Analysis revealed a difference in the number of days a film spent in the theater, by studio (F(4,146)= 5.534, p<0.05).
# In a Tukey HSD test,  Fox films stayed in the theater significantly longer (155 days) than both Universal (130 days)
# and Sony Studios (114 days). Sony studios was also significantly lower than Warner Brothers studios (146 days).

# An additional analysis did not reveal a significant difference in the percentage of earnings domestically, across 
# the five different studios (F(4,146)=2.097, p= 0.083).