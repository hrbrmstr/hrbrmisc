#' Shortcut for adding percentages to \code{dplyr::count} summaries
#'
#' This performs the equivalent of: \cr\cr
#' \code{count(x, col) \%>\% mutate(pct=n/100, percent=scales::percent(pct))}
#'
#' @param x a \code{tbl} to count
#' @param wt (Optional) If omitted, will count the number of rows. If specified, will
#'           perform a "weighted" tally by summing the (non-missing) values of variable wt.
#' @param sort unlike \code{dplyr::count} this defaults to \code{TRUE}
#' @param \dots variables to group by
#' @export
count_pct <- function(x, ..., wt=NULL, sort=TRUE) {

  vars <- lazyeval::lazy_dots(...)
  wt <- substitute(wt)
  counted <- count_(x, vars, wt=wt, sort=sort)
  mutate(counted, pct=n/100, percent=scales::percent(pct))

}

#' Make column names great again
#'
#' @param col_names character vector
#' @return lower-case, no punct, underscored strings
#' @export
mcga <- function(x) {

  x <- tolower(x)
  x <- gsub("[[:space:][:punct:]]+", " ", x)
  x <- trimws(x)
  x <- gsub(" ", "_", x)
  x

}
