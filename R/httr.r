#' "Safe" versions of \code{httr} functions
#'
#' Each \code{httr} verb is wrapped with \code{purrr::safely()}
#'
#' @param \dots Passed through to the \code{httr} verb function.
#' @export
sGET <- purrr::safely(httr::GET)

#' @export
#' @rdname sGET
sPOST <- purrr::safely(httr::POST)

#' @export
#' @rdname sGET
sHEAD <- purrr::safely(httr::HEAD)

#' @export
#' @rdname sGET
sPATCH <- purrr::safely(httr::PATCH)

#' @export
#' @rdname sGET
sPUT <- purrr::safely(httr::PUT)

#' @export
#' @rdname sGET
sDELETE <- purrr::safely(httr::DELETE)

#' @export
#' @rdname sGET
sVERB <- purrr::safely(httr::VERB)
