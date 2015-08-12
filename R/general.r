# these have been pilfered from various repos

#' good for nulls
#'
#' good way of getting a value if \code{a} is \code{NULL}
#'
#' @rdname noathenb
#' @export
noathenb <- function(a, b) {
  if (length(a) > 0) a else b
}

#' good for nulls
#'
#' good way of getting a value if \code{a} is \code{NULL}
#'
#' @rdname noathenb
#' @export
"%||%" <- noathenb

#' Does the environment variable exist?
#' @export
has_env_var <- function(x) !identical(Sys.getenv(x), "")

#' get last element
#' @export
last <- function(x) {
  if (length(x) < 1) return(x)
  x[[length(x)]]
}
