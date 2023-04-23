# nolint start

#' data first strsplit
#' 
#' @export
strsplit_one <- function(x, ...) {
  unlist(strsplit(x, ...))
}

#' data first sapply `[[`
#'
#' @export
map_field_simple <- function(x, field) {
  sapply(x, "[[", field)
}

#' data first lapply `[[`
#'
#' @export
map_field_list <- function(x, field) {
  lapply(x, "[[", field)
}

#' data first do.call
#'
#' @export
do_call <- function(dat, ƒ) {
  do.call(ƒ, dat)
}

#' data first grep
#'
#' @export
pf_grep <- function(dat, pat, ...) {
  grep(pat, dat, ...)
}

#' data first grepl
#'
#' @export
pf_grepl <- function(dat, pat, ...) {
  grepl(pat, dat, ...)
}

#' data first sub
#'
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