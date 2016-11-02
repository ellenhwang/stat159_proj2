############################################################
# EXPLORATORY DATA ANALYSIS (EDA)
############################################################
library(ggplot2)

#setwd("~/stat159_proj2/code/scripts")

credit <- read.csv('../../data/Credit.csv')
credit <- credit[-1]

# **************************************************
# Summary Statistics
# **************************************************

sink('eda-output.txt')
# find min, quartiles, median, mean, and max
summary(credit)

# mean of each numeric column
sapply(credit, mean)

# sd of each numeric column
sapply(credit, sd)

# correlation matrix
cor(credit)

# anova
aov(Balance ~ ., data = credit)

sink(NULL)

# **************************************************
# Histograms 
# **************************************************
hist_income <- ggplot(credit, aes(x = Income)) + geom_histogram(aes(y = ..density.., fill = ..density..), binwidth = 10) +
  geom_density() + ggtitle("Histogram of Income") 

hist_limit <- ggplot(credit, aes(x = Limit)) + geom_histogram(aes(y = ..density.., fill = ..density..), binwidth = 1000) +
  geom_density() + ggtitle("Histogram of Limit") 

hist_rating <- ggplot(credit, aes(x = Rating)) + geom_histogram(aes(y = ..density.., fill = ..density..), binwidth = 20) +
  geom_density() + ggtitle("Histogram of Rating") 

hist_age <- ggplot(credit, aes(x = Age)) + geom_histogram(aes(y = ..density.., fill = ..density..), binwidth = 10) +
  geom_density() + ggtitle("Histogram of Age") 

# **************************************************
# Boxplots
# **************************************************
box_gen <- ggplot(credit, aes(factor(Gender),y = Balance)) + geom_boxplot() +
  ggtitle("Boxplot: Balance vs Gender")

box_ethn <- ggplot(credit, aes(factor(Ethnicity),y = Balance)) + geom_boxplot()+
  ggtitle("Boxplot: Balance vs Ethnicity")

box_stud <- ggplot(credit, aes(factor(Student),y = Balance)) + geom_boxplot()+
  ggtitle("Boxplot: Balance vs Student")

box_marr <- ggplot(credit, aes(factor(Married),y = Balance)) + geom_boxplot()+
  ggtitle("Boxplot: Balance vs Married")

# **************************************************
# Saving plots 
# **************************************************
png('images/histogram-credit-income.png')
hist_income
dev.off()

png('images/histogram-credit-limit.png')
hist_limit
dev.off()

png('images/histogram-credit-rating.png')
hist_rating
dev.off()

png('images/histogram-credit-age.png')
hist_age
dev.off()

png('images/boxplot-balance-gender.png')
box_gen
dev.off()

png('images/boxplot-balance-ethnicity.png')
box_ethn
dev.off()

png('images/boxplot-balance-student.png')
box_stud
dev.off()

png('images/boxplot-balance-married.png')
box_marr
dev.off()

