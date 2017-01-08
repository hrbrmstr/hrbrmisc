#' Is a string equivalent to \code{""}
#'
#' Designed for use as a \code{purr::keep} or \code{purrr::discard}
#' predicate (or any functional predicate taking a single object as a value).
#'
#' Works as a standalone vectorized function equally as well.
#'
#' @param x character vector
#' @return \code{TRUE} if \code{x} == \code{""}
#' @export
#' @family purr_predicates
is_empty_string <- function(x) { x == "" }

#' Is length 0
#'
#' Designed for use as a \code{purr::keep} or \code{purrr::discard}
#' predicate (or any functional predicate taking a single object as a value).
#'
#' Makes a broad assumption about \code{x} being a singluar object
#'
#' @param x vector
#' @return \code{TRUE} if \code{x} length is \code{0}
#' @export
#' @family purr_predicates
is_zero_length <- function(x) { length(x) == 0 }

#' Is an object \code{NULL} or length zero
#'
#' Makes a broad assumption about \code{x} being a singluar object
#'
#' @name null-or-zero
#' @param x vector
#' @return \code{TRUE} if \code{x} is \code{NULL} or length \code{0}
#' @export
#' @family shortcuts
`%||0%` <- function (x, y) {
  if (is.null(x) | length(x) == 0) y else x
}

#' Is an object \code{NULL} or length zero or \code{NA}
#'
#' Makes a broad assumption about \code{x} being a singluar object
#'
#' @name null-or-zero-or-na
#' @param x vector
#' @return \code{TRUE} if \code{x} is \code{NULL} or length \code{0} or \code{NA}
#' @export
#' @family shortcuts
`%||0NA%` <- function (x, y) { if (is.null(x) | length(x) == 0 | is.na(x)) y else x }
