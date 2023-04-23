# nolint start

#' Shortcut to avoid specifying origin
#'
#' @param x	an object to be converted
#' @param \dots further arguments to be passed from or to other methods
#' @export
as_date <- function(x, ...) {
  as.Date(x, origin="1970-01-01", ...)
}

#' Mont of date object
#' 
#' @param x date thingy
#' @export
month <- \(x, abb = TRUE) {
  m <- as.POSIXlt(x)$mon + 1
  if (abb[1]) month.abb[m] else month.name[m]
}

#' Year of date object
#' 
#' @param x date thingy
#' @export
year <- \(x) {
  as.POSIXlt(x)$year + 1900
}


# nolint end