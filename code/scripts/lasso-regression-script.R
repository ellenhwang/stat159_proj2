# ################################################
# Lasso Regression Analysis
# ################################################
# libraries
library('glmnet')
library('methods')

# import data
credit <- read.csv('../../data/Processed_Credit.csv')
train <- read.csv('../../data/train.csv')
test <- read.csv('../../data/test.csv')

credit <- as.matrix(credit[,-1])
train <- as.matrix(train[,-1])
test <- as.matrix(test[,-1])
# ************************************************
# lasso
# ************************************************
sink('lasso-output.txt')

grid <- 10^seq(10, -2, length = 100)

# basic model
lasso.mod = glmnet(train, train[, "Balance"], alpha = 1, lambda = grid, intercept = FALSE,
                   standardize = FALSE)

# Cross Validation Lasso Model on Train
set.seed(40)
cv.lasso.train <- cv.glmnet(train, as.matrix(train[, "Balance"]),  intercept = FALSE, 
                       standardize = FALSE, alpha = 1,lambda = grid)

# Plot Cross Validation Errors
png('../../images/lasso-cross-valid-errors.png')
plot(cv.lasso.train)
dev.off()

# Select Best Model
bestlam = cv.lasso.train$lambda.min
bestlam

# Find lowest cross-validation error
lasso.pred <- predict(lasso.mod, s = bestlam, newx = test)
lasso.pred

# Mean Squared Error
lasso.mse <- mean((lasso.pred - test[,"Balance"])^2)
lasso.mse

# fit lasso to full dataset 
lasso.model.full <- glmnet(credit[,-12], as.matrix(credit[, "Balance"]),  intercept = FALSE, 
                standardize = FALSE, alpha = 1,lambda = grid)
lasso.coef = predict(lasso.model.full, type = "coefficients", s = bestlam)[1:11,]
lasso.coef

# remove coefficients of 0
lasso.coef.official <- lasso.coef[lasso.coef != 0]
lasso.coef.official

sink(NULL)

save(bestlam, lasso.model.full, lasso.coef, lasso.coef.official, lasso.mse,
     file = "../../data/model-objects.RData")