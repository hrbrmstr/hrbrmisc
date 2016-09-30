s_eval <- purrr::safely(eval)
s_evalq <- purrr::safely(evalq)
s_peval <- purrr::safely(eval.parent)

#' Half-baked "f strings"
#'
#' Replaces \code{"\{string\}"}s embedded in a string with their evaluated values and
#' returns the string. It's a dangerous, lightweight version of what the \code{whisker}
#' package does and a less-than-half implementation of Python 3.6.x+ f-strings.
#'
#' If the evaluation ultimately fails, the \code{\{string\}} is replaces with \code{NA}.
#'
#' NOTE: THIS IS A DANGEROUS FUNCTION as you'll see in the examples
#'
#' @param x string to evaluate
#' @return new string with evaluated replacements for all \code{\{strs\}}.
#' @export
#' @note In case you haven't noticed, this is a very dangerous function.
#' @examples
#' i <- 10
#' n <- 10
#' name <- "boB"
#'
#' for (i in 1:n) {
#'   name <- "Bill"
#'   print(fstr("This iteration {i} of {n}, {name}. And, this is [{mtcars$wt[1]} and {rnorm(100)[1]} and (DANGEROUSLY) {system('wc -l /etc/passwd', intern=TRUE)}]"))
#' }
fstr <- function(x) {

  orig <- x

  x <- stri_replace_all_regex(x, "\\{\\{[[:print:]]+\\}\\}", "")

  found <- stri_extract_all_regex(x, "(\\{[[:print:]]+?\\})")[[1]]

  stri_replace_all_regex(found, "^\\{|\\}$", "") %>%
    purrr::map(as.name) %>%
    purrr::map_chr(function(y) {
      res <- s_eval(y)$result %||% s_evalq(y)$result %||% s_peval(y)$result %||% s_eval(parse(text=as.character(y)))$result
      return(toString(res))
    }) -> found_vals

  for (i in seq_along(found)) {
    orig <- stri_replace_first_fixed(orig, found[i], found_vals[i])
  }

  orig

}
