# Question 1
data <- read.csv('AustinCityLimits.csv')

# 1a. How many artists in the dataset have 100K+ likes on Facebook?
sum(data$Facebook.100k==1)
# 85

# 1b. Which age group has the highest number of artists that have 
# 100K+ likes on Facebook? (Spell out your answer, i.e. twenties,
#                           thirties, forties, etc.)
ageGroupsFace100k <- table(data$Age.Group,data$Facebook.100k)
ageGroupsFace100k 
# Thirties 31

# 1c. For each age group, fill in the proportion of artists who have 
# 100K+ likes on Facebook. (Use the appropriate function in R to 
#                           calculate these, and round to 3 decimal places (i.e. 0.123.)
prop.table(ageGroupsFace100k,1)
# Twenties=0.786
# Thirties=0.775
# Forties=0.800
# Fifties or Older=0.594


# Question 2
# A high school counselor wants to categorize students according to two 
# variables: their gender (male or female) and their grade level 
# (freshman, sophomore, junior or senior).

# 2a. How many possible outcomes can students be assigned to?
# 8

# An Economics professor kept a record of grades earned by the college 
# students in his class, as shown below.

#2b. What proportion of students in the class received a grade of A? 
# (Round to 2 decimal places.)
# 33/(33+34+26+23+12) = 0.26

# 2c. What proportion of the students were upperclassmen (juniors and seniors)? 
# (Round to 2 decimal places.)
# (26+24)/(33+34+26+23+12) = 0.39

# 2d. What is the probability that a freshman received a failing grade of F? 
# (Round to 2 decimal places.)
# 6/(5+10+9+10+6) = 0.15

# 2e. What is the probability that a randomly selected student from the class 
# would be a sophomore that received a grade of B? (Round to 2 decimal places.)
# 10/(33+34+26+23+12) = 0.08

# 2f. What proportion of juniors passed the course with a grade of D or better?
# (Round to 2 decimal places.)
#  1 - 2/(11+5+4+4+2) = 0.92

# 2g. What is the probability that a randomly selected student from this class 
# would be a senior? (Report to 2 decimal places.)
# 24/(33+34+26+23+12) = 0.19

# 2h. If a student received a grade of D in the class, what is the probability 
# that the student was a senior? (Round to 2 decimal places.)
# 0.09

# 2i. Does the probability that a randomly selected student is a senior change 
# if we know that the student received a grade of D in the course?
# Yes


# Question 3
# 
# Use the below probability statements to answer the following two questions. 
# Report answers as proportions.
# 
# P(A) = 0.35 
# P(A and B) = 0.15

# 3a. If A and B are independent, what is the value of P(A|B)? (Round to 2 decimal places.)
# A and B are independent -> P(A) = P(A|B)

# 3b. What is the probability of P(B|A)? (Round to 2 decimal places.)
# P(B|A) = P(A and B)/P(A) = 0.43


# Question 4

# 4a. Based on the above information, do Gender and Movie preferences 
# appear to be independent?
# No

# 4b. What is the probability that a randomly chosen person from the survey prefers Action films?
# (Report as proportion rounded to 2 decimal places.)
# (.12*50+.35*80)/130 = 0.26

# 4c. What is P(Action|Women)? (Report as a proportion rounded to 2 decimal places.)
# (.12*50/130)/(50/130) = 0.12


