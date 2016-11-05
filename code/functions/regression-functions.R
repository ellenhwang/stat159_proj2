
# Residual Sum of Squares (RSS): given an "lm" object, compute the RSS
residual_sum_squares <- function(model) {
  sum(model$residuals^2)
}

# Total Sum of Squares (TSS): given an "lm" object, compute the TSS
total_sum_squares <- function(model) {
  sum(model$effects^2) - model$effects[[1]]^2
}

# R Squared: given an "lm" object, compute the R^2 value
r_squared <- function(model) {
  RSS <- residual_sum_squares(model)
  TSS <- total_sum_squares(model)
  1 - RSS/TSS
}

# F-Statistic: given an "lm" object, compute the F-statistic
f_statistic <- function(model) {
  p <- length(model$coefficients) - 1
  n <- length(model$residuals)
  RSS <- residual_sum_squares(model)
  TSS <- total_sum_squares(model)
  ((TSS - RSS) / p) / (RSS / (n - p - 1))
}

# Residual Standard Error (RSE): given an "lm" object, compute RSE
residual_std_error <- function(model) {
  sqrt(deviance(model)/df.residual(model))
}
