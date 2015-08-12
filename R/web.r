#' Tests whether raw httr response or character vector has a byte-order-mark
#'
#' @param resp \code{httr} response object or a character vector
#' @return \code{TRUE} if response contains a byte-order-mark
#' @export
#' @examples
#' library(httr)
#' url <- "http://www.claritin.com/webservice/allergyforecast.php?zip=33956"
#' foo <- GET(url)
#' has_bom(foo)
#'
#' cfoo <- content(foo, as="text")
#' has_bom(cfoo)
has_bom <- function(resp) {
  if (inherits(resp, "response")) {
    foo$content[1] == as.raw(0xef) &
      foo$content[2] == as.raw(0xbb) &
      foo$content[3] == as.raw(0xbf)
  } else {
    grepl("^ï»¿", resp)
  }
}
