#' grep - value
#' @export
vgrep <- function(x, pattern) {
  grep(pattern, x, value=TRUE)
}

#' grep - ignore case
#' @export
igrep <- function(x, pattern) {
  grep(pattern, x, ignore.case=TRUE)
}

#' grep - value, ignore case
#' @export
vigrep <- function(x, pattern) {
  grep(pattern, x, value=TRUE, ignore.case=TRUE)
}

#' grepl - ignore case
#' @export
igrepl <- function(x, pattern) {
  grepl(pattern, x, ignore.case=TRUE)
}
