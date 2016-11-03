##################################################
# OLS Regression Analysis
##################################################

# Import data
credit <- read.csv('data/Credit.csv')
credit <- credit[-1]

# ************************************************
# ols
# ************************************************
ols.fit <- lm(Balance ~ ., data = credit)
ols.summary <- summary(mult_reg_balance)

save(ols.fit, ols.summary, 'data/ols-regression.RData')
