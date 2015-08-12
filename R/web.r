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
           `UTF-16`=grepl("^ÿþ", resp[1]),
           `UTF-16BE`=grepl("^þÿ", resp[1]),
           { message("Unsupported encoding") ; return(NA) }
    )
  } else {
    message("Expected either an httr::response object or a character")
    return(NA)
  }
}

#' Remove byte order mark (BOM) from \code{httr::response} object or character vector
#'
#' Performs the equivalent of \code{content(resp, type="text")} but removes the
#' BOM before doing so. If a BOM is not detected, the function will return an error.
#'
#' \href{https://en.wikipedia.org/wiki/Byte_order_mark}{What is a byte order mark?}
#'
#' @param resp \code{httr} response object or a character vector
#' @return Converted content
#' @export
#' @references \href{http://www.unicode.org/faq/utf_bom.html}{UTF-8, UTF-16, UTF-32 & BOM}
#' @author @@hrbrmstr
#' @examples
#' library(httr)
#' foo <- GET("http://www.claritin.com/webservice/allergyforecast.php?zip=33956")
#' sans_bom(foo)
sans_bom <- function(resp) {

  if (inherits(resp, "response")) {

    F <- resp$content[1:4]
    if (F[1]==as.raw(0xef) & F[2]==as.raw(0xbb) & F[3]==as.raw(0xbf)) {
      iconv(readBin(resp$content[4:length(resp$content)], character()), from="UTF-8", to="UTF-8")
    } else if (F[1]==as.raw(0xff) & F[2]==as.raw(0xfe)) {
      iconv(readBin(resp$content[3:length(resp$content)], character()), from="UTF-16", to="UTF-8")
    } else if (F[1]==as.raw(0xfe) & F[2]==as.raw(0xff)) {
      iconv(readBin(resp$content[3:length(resp$content)], character()), from="UTF-16BE", to="UTF-8")
    } else {
      stop("Did not detect a BOM in the httr::response object content.", call.=FALSE)
    }

  } else if (inherits(resp, "character")) {

    if (grepl("^ï»¿", resp[1])) {
      iconv(readBin(sub("^ï»¿", "", resp), character()), from="UTF-8", to="UTF-8")
    } else if (grepl("^ÿþ", resp[1])) {
      iconv(readBin(sub("^ÿþ", "", resp), character()), from="UTF-16", to="UTF-8")
    } else if (grepl("^þÿ", resp[1])) {
      iconv(readBin(sub("^þÿ", "", resp), character()), from="UTF-16BE", to="UTF-8")
    } else {
      stop("Did not detect a BOM in the content.", call.=FALSE)
    }

  } else {
    stop("Expected either an httr::response object or a character", call.=FALSE)
  }
}
