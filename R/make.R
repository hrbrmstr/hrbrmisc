# nolint start

#' Clean up a character vector to make it numeric
#'
#' Remove commas & whitespace, primarily
#'
#' @param x character vector to process
#' @return numeric vector
#' @export
make_numeric <- function(x) { as.numeric(gsub(",", "", trimws(x))) }

#' Clean up a character vector to make it a percent
#'
#' Remove "%" primarily, convert to numeric & divide by 100
#'
#' @param x character vector to process
#' @return numeric vector
#' @export
make_percent <- function(x) { as.numeric(gsub("%", "", trimws(x))) / 100 }

# nolint end