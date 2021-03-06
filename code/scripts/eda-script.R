############################################################
# EXPLORATORY DATA ANALYSIS (EDA)
############################################################
# libraries and output adjustments
library(ggplot2)
library(corrplot)
options(warn = -1)

# import data
credit <- read.csv('data/Credit.csv')
credit <- credit[-1]

# **************************************************
# Summary Statistics
# **************************************************

sink('data/eda-output.txt')
# find min, quartiles, median, mean, and max
paste('Min, Quartiles, Median, Mean, and Max')
summary(credit)

# mean of each numeric column
paste('Mean of Each Numeric Column')
sapply(credit, mean)

# sd of each numeric column
paste('Standard Deviation of Each Numeric Column')
sapply(credit, sd)

# correlation matrix
paste('Correlation Matrix')
credit_int <- credit[c(1:6,11)]
cor(credit_int)

# anova
paste('ANOVA')
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

hist_edu <- ggplot(credit, aes(x = Education)) + geom_histogram(aes(y = ..density.., fill = ..density..), binwidth = 1) +
  geom_density() + ggtitle("Histogram of Education")

hist_ncards <- ggplot(credit, aes(x = Cards)) + geom_histogram(aes(y = ..density.., fill = ..density..), binwidth = 1) +
  geom_density() + ggtitle("Histogram of Number of Cards")

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

png('images/histogram-credit-edu.png')
hist_edu
dev.off()

png('images/histogram-credit-ncards.png')
hist_ncards
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

# **************************************************
# Correlation matrix and Scatterplots
# **************************************************
png("images/corr-matrix.png")
corrplot(cor(credit_int), method='square')
dev.off()

png("images/scatterplots.png")
pairs(credit_int, title="Scatter plots for all quantitative variable pairs")
dev.off()
