##################################################
# PLS Regression Analysis
##################################################
# libraries
library(pls)

# import data
credit <- read.csv('data/Processed_Credit.csv')
train <- read.csv('data/train.csv')
test <- read.csv('data/test.csv')

# ************************************************
# pls
# ************************************************
sink('data/pls-output.txt')
set.seed(1)
df_train <- as.data.frame(train)
df_test <- as.data.frame(test)

# Run PLS on Train
pls.fit.train <- plsr(Balance ~ ., data = df_train,  scale = FALSE, validation = "CV")
summary(pls.fit.train)

# Best Model Value and Component
pls.best.mod <- which.min(pls.fit.train$validation$PRESS)
pls.best.mod.value <- min(pls.fit.train$validation$PRESS)
pls.best.mod.value

#Plot Cross Validation Errors
png('images/pls-cross-valid-errors.png')
validationplot(pls.fit.train, val.type = "MSEP")
dev.off()

# Find lowest cross-validation error with best number of component (best_component)
pls.pred <- predict(pls.fit.train, df_test, ncomp= pls.best.mod)
pls.pred

# Mean Squared Error
pls.mse <- mean((pls.pred - test[,"Balance"])^2)
pls.mse

# fit PLS to full dataset using best_components
pls.fit.full <- plsr(Balance~., data = credit, ncomp = pls.best.mod)
summ.pls.full <- summary(pls.fit.full)
summ.pls.full

sink(NULL)

save(pls.best.mod, pls.best.mod.value, pls.pred, pls.mse, summ.pls.full, pls.fit.full,
     file = "data/pls-objects.RData")
