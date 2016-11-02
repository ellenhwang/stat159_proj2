credit = read.csv("data/Credit.csv")

# Dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)

# Mean Centering and Standardizing
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)
write.csv(scaled_credit, file = "data/Processed_Credit.csv")
