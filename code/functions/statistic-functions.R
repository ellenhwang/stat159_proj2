missing_values <- function(x) {
  sum(is.na(x))
}

range_value <- function(x, na.rm=FALSE) {
  max(x, na.rm=na.rm) - min(x, na.rm=na.rm)
}

center_measures <- function(x) {
  c(median(x), mean(x))
}

spread_measures <- function(x) {
  c(range_value(x), IQR(x), sqrt(var(x)))
}

descriptive_stats <- function(x) {
  c(center_measures(x), spread_measures(x), missing_values(x))
}
