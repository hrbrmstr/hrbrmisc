#' "Safe" versions of \code{httr} functions
#'
#' @inheritParams httr::GET
#' @inheritParams httr::PUT
#' @inheritParams httr::HEAD
#' @export
sGET <- purrr::safely(httr::GET)


#' @export
#' @rdname sGET
sPOST <- purrr::safely(httr::POST)

#' @export
#' @rdname sGET
sHEAD <- purrr::safely(httr::HEAD)
