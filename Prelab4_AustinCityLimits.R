data <- read.csv('AustinCityLimits.csv')
#1) How many artists are in this dataset?
length(data$Artist)
#116
#2) How many of the first 10 artists in the dataset were Grammy winners?
first10 <- data[1:10,]
sum(first10$Grammy=='Y')
#4
#3) What genre was played by the first female artist in the dataset who was over 60 years of age?

