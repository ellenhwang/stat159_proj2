if (grepl("tests", getwd())) {
  source("../functions/statistic-functions.R")
}

# context with one test that groups expectations
context("Test for range value")

test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)

  expect_equal(range_value(x), 4)
  expect_length(range_value(x), 1)
  expect_type(range_value(x), 'double')
})

test_that("range works as expected with NaNs", {
  y <- c(1, 2, 3, 4, NA)

  expect_equal(range_value(y), NA_real_)
  expect_length(range_value(y), 1)
})

test_that("range works as expected when removing NaNs", {
  y <- c(1, 2, 3, 4, NA)

  expect_equal(range_value(y, na.rm = TRUE), 3)
  expect_length(range_value(y, na.rm = TRUE), 1)
})

test_that("range works as expected with booleans", {
  z <- c(TRUE, FALSE, TRUE)

  expect_equal(range_value(z), 1L)
  expect_length(range_value(z), 1)
  expect_type(range_value(z), 'integer')
})

test_that("range throws an error when expected", {
  w <- letters[1:5]

  expect_error(range_value(w), "non-numeric argument to binary operator")
})

context("Test for missing values")

test_that("missing value works as expected", {
  z <- c(2, NA, 5, 3, NA, 1, 4)

  expect_length(missing_values(z), 1)
  expect_type(missing_values(z), 'integer')
  expect_gte(missing_values(z), 0)
})


context("Test for center measure")

test_that("center measure works as expected", {
  x <- c(6, 4, 9, 8, 5)
  results = center_measures(x)

  expect_equal(results[1], 6)
  expect_equal(results[2], 6.4)
  expect_length(results, 2)
  expect_type(results, 'double')
})

context("Test for spread measures")

test_that("spread measures works as expected", {
  x <- c(1, 2, 3, 4, 5)
  results = spread_measures(x)

  expect_equal(results[1], 4)
  expect_equal(results[2], 2)
  expect_equal(results[3], sqrt(2.5))
  expect_length(results, 3)
  expect_type(results, 'double')
})

context("Test for descriptive stats")

test_that("descriptive stats works as expected", {
  x <- c(1, 2, 3, 4, 5)
  results = descriptive_stats(x)

  expect_equal(results[1], 3)
  expect_equal(results[2], 3)
  expect_equal(results[3], 4)
  expect_equal(results[4], 2)
  expect_equal(results[5], sqrt(2.5))
  expect_equal(results[6], 0)
  expect_length(results, 6)
  expect_type(range_value(x), 'double')
})
