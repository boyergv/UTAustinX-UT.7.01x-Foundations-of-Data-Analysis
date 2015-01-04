# Review of Exponential and Logistic Models

# 1) When choosing between two models with very similar R2 values, what additional statistic
# should you examine to help you select the best-fitting model?
# The residuals
# 2) Which parameter represents the rapidity of growth (or change) in both the 
# exponential and the logistic model?
# b
# 3) Most biological data will follow a logistic growth model. Why?
# The logistic model takes into account the fact that most growth does not continue indefinitely. 

##############################
library(SDSFoundations)
world <- WorldBankData

# Analysis

# Letfs break this question down into the different descriptive statistics that you will need to
# construct your answer.  Be sure that your R output includes all of the following components. 

# 1. Create a variable that represents proportion of the population using the internet. 
# (internet users divided by population).
world$internetProportion <- world$internet.users/world$population
# 2. Create a subset of the data that only contains data from 1990 onward.
from1990 <- world[world$year>=1990,]
# 3. Create a new variable that is "years since 1990". 
from1990$yearsSince1990 <- from1990$year - 1990
# 4. Create two new data frames --- one for each country of interest.
denmark <- from1990[from1990$Country=="Denmark",]
belarus <- from1990[from1990$Country=="Belarus",]
# 5. Determine the best-fitting model (exponential or logistic) for internet usage in 
# each country from 1990 onward.
expFit(denmark$yearsSince1990, denmark$internetProportion)
logisticFit(denmark$yearsSince1990, denmark$internetProportion)
expFit(belarus$yearsSince1990, belarus$internetProportion)
logisticFit(belarus$yearsSince1990, belarus$internetProportion)
# 6. Using the best-fitting model for each country, determine which country shows a faster adoption rate of the internet.
# t = -log[(C/threshold - 1)/a] / log(b)

#########################################
# Model Fit Statistics
# Report the model fit statistic (R2) for each of the following models. Report to 4 decimal places.

# 1a) Exponential growth model for Denmark:
# 0.8001
# 1b) Logistic growth model for Denmark:
# 0.9949
# 1c) What is the best-fitting model for growth of internet usage in Denmark from 1990 onward?
# logistic 
# 1d) Exponential growth model for Belarus:
# 0.7889
# 1e) Logistic growth model for Belarus:
# 0.9916
# 1f) What is the best-fitting model for growth of internet usage in Belarus from 1990 onward?
# logistic

########################################
# Prediction

# Using the logistic model equations from your analysis, calculate the YEAR that 10% of the population in each country would be using the internet.
# -log((0.89668/0.1 - 1)/308.8345)/log(1.73124)
# 3a) Denmark=1996
# -log((0.8987/0.1 - 1)/422.4322)/log(1.31884)
# 3b) Belarus=2004

# Using the logistic model equations from your analysis, calculate the YEAR that 80% of the population in each country would be using the internet.
# 3c) Denmark=2004
# -log((0.89668/0.8 - 1)/308.8345)/log(1.73124)
# 3d) Belarus=2019
# -log((0.8987/0.1 - 1)/422.4322)/log(1.31884)

#########################################
Write Your Conclusion

Answer the question and support your answer with statistics:
        
The logistic model for both Denmark and Balarus fits better than the exponential model, as shown with 
a higher R-squared. For Denmark, R-squared values increase from 0.8001 for the latter model to 0.9949 
for the former model, and for Belarus, R-squared values rise from .7889 - correct for the latter model
to .9916 for the former model. We see this by examining the scatterplot and the fits of the models 
(exponential and logistic) to the data. The residual is smaller for the logistic model. The speed at 
which the Internet was adopted in a country is different depending on the country's income. The 
middle-income country of Belarus is predicted to take approximately 15 years to go from 10% adoption
to 80% adoption, while Denmark will only take approximately 8 years.

