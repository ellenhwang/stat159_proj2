source("../functions/regression-functions.R")

context("testing regression functions")

# first multiple regression
reg_cars <- lm(mpg ~ disp + hp, data = mtcars)
# and its summary
regsum_cars <- summary(reg_cars)

# A second multiple regression
reg_iris <- lm(Petal.Length ~ Sepal.Length + Sepal.Width, data = iris)
# and its summary
regsum_iris <- summary(reg_iris)


test_that("residual_sum_squares function works as expected", {

  RSS_cars <- residual_sum_squares(reg_cars)
  RSS_iris <- residual_sum_squares(reg_iris)

  # Sanity checks
  expect_gt(RSS_cars, 0)
  expect_gt(RSS_iris, 0)
  expect_equal(length(RSS_cars), 1)
  expect_equal(length(RSS_iris), 1)

  # Specific tests
  expect_equal(RSS_cars, sum(regsum_cars$residuals^2))
  expect_equal(RSS_iris, sum(regsum_iris$residuals^2))
})

test_that("total_sum_squares function works as expected", {

  TSS_cars <- total_sum_squares(reg_cars)
  TSS_iris <- total_sum_squares(reg_iris)

  # Sanity checks
  expect_gt(TSS_cars, 0)
  expect_gt(TSS_iris, 0)
  expect_equal(length(TSS_cars), 1)
  expect_equal(length(TSS_iris), 1)

  # Specific tests
  expect_equal(TSS_cars, sum((mtcars$mpg - mean(mtcars$mpg))^2))
  expect_equal(TSS_iris, sum((iris$Petal.Length - mean(iris$Petal.Length))^2))
})

test_that("r_squared function works as expected", {

  R2_cars <- r_squared(reg_cars)
  R2_iris <- r_squared(reg_iris)

  # Sanity checks
  expect_gt(R2_cars, 0)
  expect_gt(R2_iris, 0)
  expect_lt(R2_cars, 1)
  expect_lt(R2_iris, 1)
  expect_equal(length(R2_cars), 1)
  expect_equal(length(R2_iris), 1)

  # Specific tests
  expect_equal(R2_cars, regsum_cars$r.squared)
  expect_equal(R2_iris, regsum_iris$r.squared)
})


test_that("f_statistic function works as expected", {

  F_cars <- f_statistic(reg_cars)
  F_iris <- f_statistic(reg_iris)

  # Sanity checks
  expect_gt(F_cars, 0)
  expect_gt(F_iris, 0)
  expect_equal(length(F_cars), 1)
  expect_equal(length(F_iris), 1)

  # Specific tests
  expect_equal(F_cars, regsum_cars$fstatistic[[1]])
  expect_equal(F_iris, regsum_iris$fstatistic[[1]])
})

test_that("residual_std_error function works as expected", {

  RSE_cars <- residual_std_error(reg_cars)
  RSE_iris <- residual_std_error(reg_iris)

  expect_gt(RSE_cars, 0)
  expect_gt(RSE_iris, 0)
  expect_equal(length(RSE_cars), 1)
  expect_equal(length(RSE_iris), 1)

  # Specific tests
  expect_equal(RSE_cars, regsum_cars$sigma)
  expect_equal(RSE_iris, regsum_iris$sigma)
})
