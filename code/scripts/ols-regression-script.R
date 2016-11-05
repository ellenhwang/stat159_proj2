##################################################
# OLS Regression Analysis
##################################################

# Import data
test <- read.csv('data/test.csv')
test <- test[-1]

# ************************************************
# ols
# ************************************************
ols.fit <- lm(Balance ~ ., data = test)
ols.summary <- summary(ols.fit)

save(ols.fit, ols.summary, file = 'data/ols-regression.RData')
