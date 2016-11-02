##################################################
# OLS Regression Analysis
##################################################

# Import data
credit <- read.csv('../../data/Credit.csv')
credit <- credit[-1]

# ************************************************
# 
# ************************************************
mult_reg_balance <- lm(Balance ~ ., data = credit)
summary_mult_reg <- summary(mult_reg_balance)
