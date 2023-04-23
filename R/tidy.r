# nolint start

#' data first strsplit
#' 
#' @param x cahr vector
#' @param ... passed on
#' @export
strsplit_one <- function(x, ...) {
  unlist(strsplit(x, ...))
}

#' data first sapply `[[`
#'
#' @param x list/vector
#' @param field thing for `[[field]]`
#' @export
map_field_simple <- function(x, field) {
  sapply(x, "[[", field)
}

#' data first lapply `[[`
#'
#' @param x list/vector
#' @param field thing for `[[field]]`
#' @export
map_field_list <- function(x, field) {
  lapply(x, "[[", field)
}

#' data first do.call
#'
#' @param dat,ƒ rame as sub but order diff
#' @param ... passed on
#' @export
do_call <- function(dat, ƒ) {
  do.call(ƒ, dat)
}

#' data first grep
#'
#' @param dat,pat rame as sub but order diff
#' @param ... passed on
#' @export
pf_grep <- function(dat, pat, ...) {
  grep(pat, dat, ...)
}

#' data first grepl
#'
#' @param dat,pat, rame as sub but order diff
#' @param ... passed on
#' @export
pf_grepl <- function(dat, pat, ...) {
  grepl(pat, dat, ...)
}

#' data first sub
#'
#' @param dat,pat,repl rame as sub but order diff
#' @param ... passed on 
#' @export
pf_sub <- function(dat, pat, repl, ...) {
  sub(pat, repl, dat, ...)
}

#' data first gsub
#'
#' @export
pf_gsub <- function(dat, pat, repl, ...) {
  gsub(pat, repl, dat, ...)
}

#' shorter name for rbind.data.frame
#'
#' @export
row_bind <- function(...) {
  rbind.data.frame(...)
}

#' data first do.call/rbind.data.frame
#'
#' @export
row_bind_lst <- function(lst, ...) {
  do.call(rbind.data.frame, lst, ...)
}

# nolint end