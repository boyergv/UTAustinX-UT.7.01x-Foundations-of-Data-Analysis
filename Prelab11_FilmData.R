# Primary Research Questions

# 1. Does a filmÅfs rating (PG, PG-13, or R) impact its cost to produce?
# 2. Does a filmÅfs rating (PG, PG-13, or R) influence its IMDB score?

# Check the Data
library(SDSFoundations)
library(dplyr)
library(tidyr)
film <- FilmData
View(film)

# 1a. What rank does Titanic hold among highest-grossing films?
film %>%
    filter(Film == "Titanic") %>%
        select(Rank)
# 1b. What is the name of the highest ranked film made by Universal Studios?
uniStu <- film %>%
           filter(Studio=="Uni.") 
highest <- which.min(uniStu$Rank)
uniStu[highest,"Film"]
# 1c. What was the lowest IMDB rating given to a film that ranked in the top 10 grossing films of all time?
# Sort all films by their gross values
sortedFilms <- arrange(film, desc(Rank))
# Subset the data to get the top 10 films
top10 <- sortedFilms[length(sortedFilms)-10:length(sortedFilms),]
min(top10$IMDB)

# Check the Variables of Interest
# 2a. Which variable tells us whether a film is rated PG, PG-13 or R?
# The variable name in the dataset is Rating, which is a categorical variable.
# 2b. Which variable tells us the average score the film received on IMDB?
# The variable name in the dataset is IMDB, which is a quantitative variable.
# 2c. Which variable tells us how much it cost to produce the film?
# The variable name in the dataset is Budget, which is a quantitative variable.

# Reflect on the Method
# Which method should we be using for this analysis and why?
# 3a. We will use ANOVA to help us answer each of these questions. Why?
# We want to determine if the category to which a film belongs has an impact on some other quantitative measure.
# 3b. We will conduct post-hoc tests, specifically TukeyÅfs HSD, if the result of either ANOVA is significant. Why?
# We want to locate which group means are different from each other. 

##########################
# Breakdown Your Analysis
table(film$Rating)

# Question 1

# Calculate avg film budget of each group
aggregate(Budget~Rating,film,mean)

# Calculate sd of film budget within each group
aggregate(Budget~Rating,film,sd)

# Visualize the group means and variability
boxplot(film$Budget~film$Rating, main= "Film Budgets by Rating",
        ylab= "Budget", xlab= "MPAA Rating")

# Run ANOVA
modelbud <- aov(film$Budget~film$Rating)
summary(modelbud)

# Run post-hoc test if F statistic is significant
TukeyHSD(modelbud)

# Question 2

# Calculate avg IMDB score of each group
aggregate(IMDB~Rating,film,mean)

#Calculate sd of IMDB scores within each group
aggregate(IMDB~Rating,film,sd)

# Visualize the group means and variability
boxplot(film$IMDB~film$Rating, main= "IMDB Scores by Rating",
        ylab= "IMDB Score", xlab= "MPAA Rating")

# Run ANOVA
modelscore <- aov(film$IMDB~film$Rating)
summary(modelscore)

# Run post-hod text if F statistic is significant
TukeyHSD(modelscore)

# 1. What does aov stand for?
# analysis of variance
# 2. Which of the following comes closest to what it sounds like to "read aloud" this line of code?
aggregate(Budget~Rating,film,mean)
# For all the cases in film, take the variable Budget and, given the Rating group, find the mean
# 3. If group differences are present, what should be true about the output of this line of code?
aggregate(Budget~Rating,film,mean)
# The average budget for each group should be different. 
# 4. If we are to satisfy the assumptions of ANOVA, what should be true about the output of this line of code?
# The largest standard deviation should be no more than twice the smallest standard deviation. 

#################################
# Conduct the Analysis in R
# 1a. How many PG-rated films are in the dataset?
PG_dat <- film %>%
          filter(Rating=="PG")
PG_dat
# 1b. How many PG-13-rated films are in the dataset?
PG13_dat <- film %>%
            filter(Rating=="PG13")
PG13_dat
# 1c. How many R-rated films are in the dataset
R_dat <- film %>%
         filter(Rating=="R")
R_dat
# Remove rows that contian NA value 
R_filtered <- R_dat[is.na(R_dat$Budget)==F,"Budget"]

# 2a. What is the average cost, in millions of dollars, to make each type of film? (no decimal places)
PG = sum(PG_dat$Budget/length(PG_dat[[1]]))
PG13 = sum(PG13_dat$Budget/length(PG13_dat[[1]]))
R = sum(R_filtered/length(R_filtered))
#(Another way to calculate these is to use aggregate(Budget~Rating,data=film,mean))
# Visualize the date to see the distribution
boxplot(film$Budget~film$Rating, main= "Budget by Rating",
        ylab= "Budget", xlab= "MPAA Rating")
# 2b. Was the assumption of equal variability met?
aggregate(Budget~Rating,data=film,sd)

# ANOVA Results

# 2c. F-statistic (rounded to one decimal place)=
ratingModel <- aov(film$Budget~film$Rating)
summary(ratingModel)
TukeyHSD(ratingModel)
# Tukey Test Results
# 2d. The average budget for a PG-13 film was significantly higher than the budget for a(n) PG rated film.
# 2e. The difference between a PG-13 film and a(n) R rated film was almost, but not quite significant, at p = 0.053.

# Research Question 2
# 3a. What is the average IMDB score for each type of film? (report to 1 decimal place)
aggregate(IMDB~Rating,data=film,mean)

# ANOVA Results
# 3b. What is the F statistic, rounded to 1 decimal place?
scoreModel <- aov(film$IMDB~film$Rating)
summary(scoreModel)
# Tukey Test Results
# Was a Tukey test necessary for this analysis?
# NO

#########################
# Write Your Conclusion

# Answer the question and support your answer with statistics:
    
#     This analysis examined 151 top-grossing films produced by five major studios. The average cost 
# of a film was found to vary depending on its MPAA rating (F= 13.1, p < .05). In a Tukey HSD test,
# PG-13 films were shown to cost significantly more on average ($127M) than PG films ($75 M). PG-13 
# films fell just shy of costing significantly more than R rated films (p=.053). The average IDMB score
# of a film does not appear to vary with MPAA rating (F=0.3, p=0.74). The average ratings for all three
# categories of film were close to 7 on a scale of 1-10.




