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
ols.summary <- summary(ols.fit)

save(ols.fit, ols.summary, file = 'data/ols-regression.RData')
