#' Personal tidyverse alternatives
#' 
#' Mostly to get "data" out in front for base piping
#' 
#' @export
strsplit_one <- function(x, ...) {
  unlist(strsplit(x, ...))
}

#' @rdname strsplit_one
#' @export
map_field_simple <- function(x, field) {
  sapply(x, "[[", field)
}

#' @rdname strsplit_one
#' @export
map_field_list <- function(x, field) {
  lapply(x, "[[", field)
}

#' @rdname strsplit_one
#' @export
do_call <- function(dat, ƒ) {
  do.call(ƒ, dat)
}

#' @rdname strsplit_one
#' @export
pf_grep <- function(dat, pat, ...) {
  grep(pat, dat, ...)
}

#' @rdname strsplit_one
#' @export
pf_grepl <- function(dat, pat, ...) {
  grepl(pat, dat, ...)
}

#' @rdname strsplit_one
#' @export
pf_sub <- function(dat, pat, repl, ...) {
  sub(pat, repl, dat, ...)
}

#' @rdname strsplit_one
#' @export
pf_gsub <- function(dat, pat, repl, ...) {
  gsub(pat, repl, dat, ...)
}

#' @rdname strsplit_one
#' @export
row_bind <- function(...) {
  rbind.data.frame(...)
}

#' @rdname strsplit_one
#' @export
row_bind_lst <- function(lst, ...) {
  do.call(rbind.data.frame, lst, ...)
}
