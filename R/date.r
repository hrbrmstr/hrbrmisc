# nolint start

#' Shortcut to avoid specifying origin
#'
#' @param x	an object to be converted
#' @param \dots further arguments to be passed from or to other methods
#' @export
as_date <- function(x, ...) {
  as.Date(x, origin="1970-01-01", ...)
}

# nolint end