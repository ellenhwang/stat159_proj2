credit = read.csv("data/Credit.csv")

# Dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)

# Mean Centering and Standardizing
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)[,-1]
write.csv(scaled_credit, file = "data/Processed_Credit.csv")

# Create Train and Test Sets
set.seed(1)
samp <- sample(nrow(scaled_credit), 300)

train <- scaled_credit[samp,][,-1]
test <- scaled_credit[-samp,][,-1]
  
write.csv(train, file = 'data/train.csv')
write.csv(test, file = 'data/test.csv')
