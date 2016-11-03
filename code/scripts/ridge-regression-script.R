# ################################################
# Ridge Regression Analysis
# ################################################
# libraries
library('glmnet')
library('methods')

# import data
credit <- read.csv('data/Processed_Credit.csv')
train <- read.csv('data/train.csv')
test <- read.csv('data/test.csv')

credit <- as.matrix(credit[,-1])
train <- as.matrix(train[,-1])
test <- as.matrix(test[,-1])
# ************************************************
# Ridge
# ************************************************
sink('data/ridge-output.txt')

grid <- 10^seq(10, -2, length = 100)

# basic model
ridge.mod = glmnet(train, train[, "Balance"], alpha = 0, lambda = grid, intercept = FALSE, standardize = FALSE)

# Cross Validation Ridge Model on Train
set.seed(40)
cv.ridge.train <- cv.glmnet(train, as.matrix(train[, "Balance"]),  intercept = FALSE, standardize = FALSE, alpha = 0, lambda = grid)

# Plot Cross Validation Errors
png('images/ridge-cross-valid-errors.png')
plot(cv.ridge.train)
dev.off()

# Select Best Model
bestlam = cv.ridge.train$lambda.min
bestlam

# Find lowest cross-validation error
ridge.pred <- predict(ridge.mod, s = bestlam, newx = test)
ridge.pred

# Mean Squared Error
ridge.mse <- mean((ridge.pred - test[,"Balance"])^2)
ridge.mse

# fit ridge to full dataset
ridge.model.full <- glmnet(credit[,-12], as.matrix(credit[, "Balance"]),  intercept = FALSE,
                standardize = FALSE, alpha = 1,lambda = grid)
ridge.coef = predict(ridge.model.full, type = "coefficients", s = bestlam)[1:11,]
ridge.coef

# remove coefficients of 0
ridge.coef.official <- ridge.coef[ridge.coef != 0]
ridge.coef.official

sink(NULL)

save(bestlam, ridge.model.full, ridge.coef, ridge.coef.official, ridge.mse,
     file = "data/ridge-objects.RData")
