#' Shortcuts for \code{fmatch} and \code{match} operations
#'
#' \code{fmatch} is a faster version of the built-in \code{match()} function. It is
#' slightly faster than the built-in version because it uses more
#' specialized code, but in addition it retains the hash table within the
#' table object such that it can be re-used, dramatically reducing the look-up
#' time especially for large tables.
#'
#' \itemize{
#'   \item \code{\%notin\%} avoids awkward-to-type \code{!a \%in\% b}
#'   \item \code{\%fmin\%} fastmatch version of \code{in}
#'   \item \code{\%notfmin\%} Avoids awkward-to-type \code{!a \%fmin\% b}
#' }
#'
#' @param x vector or NULL: the values to be matched.
#' @param table vector or NULL: the values to be matched against
#' @rdname match_shortcuts
#' @export
"%fmin%" <- function(x, table) {
  fmatch(x, table, nomatch = 0) > 0
}

#' @rdname match_shortcuts
#' @export
"%notin%" <- function(x, table) !match(x, table, nomatch = 0) > 0

#' @rdname match_shortcuts
#' @export
"%notfmin%" <- function(x, table) {
  !fmatch(x, table, nomatch = 0) > 0
}
