data <- read.csv('AustinCityLimits.csv')
# ANALYSIS

genreGrammy <- table(data$Genre,data$Grammy)
# Create a table to show the marginal distributions for Genre and Grammy.
prop.table(genreGrammy)
# Create a contingency table to show the conditional distribution for Genre and Grammy.
genreGrammy
# Make a bar chart to better visualize how many artists in each Genre received a Grammy.
barplot(genreGrammy)
# Calculate P(A):  the probability of winning a Grammy.
sum(genreGrammy[,2])/116
# Calculate P(A|B): the probability of winning Grammy, given the artist's Genre.
# P(A|B) = P(A and B)/P(B)
# Interpret what these probabilities tell us about the relationship between Genre and winning a Grammy.

#Questions and Answers:

# 1) How many artists won a Grammy?
# 49
# 2) How many artists did not win a Grammy?
# 116-49
# 3) Which genre had the greatest number of Grammy wins?
# Rock/Folk/Indie
# 4) What is the probability that a randomly selected artist was a Grammy winner?
# (Report as a proportion rounded to three decimal places)
# 0.422
# 5) To determine the probability of winning a Grammy if the artist was a singer-songwriter,
# you would divide _______ by ________. (enter numerical values).
# 5/17
# 6) To determine the probability that a randomly-selected Grammy winner was a singer-songwriter,
# you would divide ________ by ________. (enter numerical values)
# 5/49
# What is the probability that a randomly selected artist from each of the following genres won a Grammy?
# (Report as proportions rounded to three decimal places.)

# 7) Country?
# 12/18
# 8) Jazz?
# 6/13
# 9) Rock/folk/indie?
# 26/68
# 10) Singer-songwriter?

# CONCLUSION
# There is an association between winning a Grammy and the Genre of music an artist plays. 
# The probability of winning a Grammy, regardless of Genre, is 42.24%. However, examination
# of a  contingency table containing both Grammy and Genre showed that the conditional
# probability of winning a Grammy changes by genre. If an artist is in the Country Genre, the conditional 
# probability of winning a Grammy is 66.67%, while if an artist is in the Singer-Songwriter 
# Genre, the conditional probability of winning a Grammy is 29.41%. Visual examination of the barplot 
# shows the conditional probabilities of winning a Grammy are not equal across Genres.

