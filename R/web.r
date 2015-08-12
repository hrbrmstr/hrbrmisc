#' Tests whether a raw httr response or character vector has a byte order mark (BOM)
#'
#' \href{https://en.wikipedia.org/wiki/Byte_order_mark}{What is a byte order mark?}
#'
#' @param resp \code{httr} response object or a character vector
#' @param encoding can be one of \code{UTF-8}, \code{UTF-16} or \code{UTF-16BE}.
#'        Although a BOM could be used with UTF-32 and other encodings, such
#'        encodings are rarely used for data transmission and the three supported
#'        encodings are the most likely ones folks in R will be working with from
#'        web APIs.\cr\cr
#'        This function defaults to looking for \code{UTF-8} BOM, but you can
#'        override it.
#' @return \code{TRUE} if response contains a BOM, \code{NA} if an unsupported encoding
#'         was passed (along with a message)
#' @export
#' @references \href{http://www.unicode.org/faq/utf_bom.html}{UTF-8, UTF-16, UTF-32 & BOM}
#' @author @@hrbrmstr
#' @examples
#' library(httr)
#' foo <- GET("http://www.claritin.com/webservice/allergyforecast.php?zip=33956")
#' has_bom(foo)
#'
#' cfoo <- content(foo, as="text")
#' has_bom(cfoo)
#'
#' has_bom(GET("http://google.com"))
has_bom <- function(resp, encoding="UTF-8") {
  if (inherits(resp, "response")) {
    F <- resp$content[1:4]
    switch(encoding,
           `UTF-8`=F[1]==as.raw(0xef) & F[2]==as.raw(0xbb) & F[3]==as.raw(0xbf),
           `UTF-16`=F[1]==as.raw(0xff) & F[2]==as.raw(0xfe),
           `UTF-16BE`=F[1]==as.raw(0xfe) & F[2]==as.raw(0xff),
           { message("Unsupported encoding") ; return(NA) }
    )
  } else if (inherits(resp, "character")) {
    switch(encoding,
           `UTF-8`=grepl("^ï»¿", resp[1]),
           `UTF-16`=grepl("^þÿ", resp[1]),
           `UTF-16BE`=grepl("^þÿ", resp[1]),
           { message("Unsupported encoding") ; return(NA) }
    )
  } else {
    message("Expected either an httr::response object or a character")
    return(NA)
  }
}


