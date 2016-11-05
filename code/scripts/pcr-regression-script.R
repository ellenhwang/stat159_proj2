##################################################
# PCR Regression Analysis
##################################################
# libraries
library(pls)

# import data
credit <- read.csv('data/Processed_Credit.csv')
train <- read.csv('data/train.csv')
test <- read.csv('data/test.csv')

# ************************************************
# pcr
# ************************************************
sink('data/pcr-output.txt')
set.seed(60)
df_train <- as.data.frame(train)
df_test <- as.data.frame(test)

# Run PCR on Train
pcr.fit.train <- pcr(Balance ~ ., data = df_train, validation = "CV")
summary(pcr.fit.train)

# Best Model Value and Component
pcr.best.mod <- which.min(pcr.fit.train$validation$PRESS)
pcr.best.mod.value <- min(pcr.fit.train$validation$PRESS)
pcr.best.mod.value

#Plot Cross Validation Errors
png('images/pcr-cross-valid-errors.png')
validationplot(pcr.fit.train, val.type = "MSEP")
dev.off()

# Find lowest cross-validation error with best number of component (best_component)
pcr.pred <- predict(pcr.fit.train, df_test, ncomp=pcr.best.mod)
pcr.pred

# Mean Squared Error
pcr.mse <- mean((pcr.pred - test[,"Balance"])^2)
pcr.mse

# fit PCR to full dataset using best_components
pcr.fit.full <- pcr(Balance~., data = credit, ncomp = pcr.best.mod)
summ.pcr.full <- summary(pcr.fit.full)
summ.pcr.full

sink(NULL)

save(pcr.best.mod.value, pcr.best.mod, pcr.fit.full, pcr.pred, pcr.mse, summ.pcr.full,
     file = "data/pcr-objects.RData")
