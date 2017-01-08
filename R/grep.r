#' Shorthand helpers for base \code{grep} and \code{grepl}
#'
#' Each puts the object first then the pattern and auto-fills in certain params
#'
#' \itemize{
#'   \item \code{ggrep} is the equivalent of \code{grep(pattern, x)}
#'   \item \code{vgrep} is the equivalent of \code{grep(pattern, x, value=TRUE)}
#'   \item \code{igrep} is the equivalent of \code{grep(pattern, x, ignore.case=TRUE)}
#'   \item \code{vigrep} is the equivalent of \code{grep(pattern, x, value=TRUE, ignore.case=TRUE)}
#'   \item \code{igrepl} is the equivalent of \code{grepl(pattern, x, ignore.case=TRUE)}
#'   \item \code{lgrep} is the equivalent of \code{grepl(pattern, x)}
#' }
#'
#' @param x character vector
#' @param pattern regex to look for
#' @export
vgrep <- function(x, pattern) {  grep(pattern, x, value=TRUE) }

#' @rdname vgrep
#' @export
ggrep <- function(x, pattern) { grep(pattern, x) }

#' @rdname vgrep
#' @export
igrep <- function(x, pattern) { grep(pattern, x, ignore.case=TRUE) }

#' @rdname vgrep
#' @export
vigrep <- function(x, pattern) { grep(pattern, x, value=TRUE, ignore.case=TRUE) }

#' @rdname vgrep
#' @export
igrepl <- function(x, pattern) { grepl(pattern, x, ignore.case=TRUE) }

#' @rdname vgrep
#' @export
lgrep <- function(x, pattern) { grepl(pattern, x) }
