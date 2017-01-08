#' Personal R pkg
#'
#' @name hrbrmisc
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @import stringi
#' @import broom
#' @import ggplot2
#' @import gtable
#' @import formatR
#' @importFrom grid grid.draw grid.newpage gpar textGrob grobHeight
#' @importFrom httr GET HEAD POST
#' @importFrom dplyr count_ mutate %>% tbl_df select
#' @importFrom purrr flatten_df map map_df map_chr map_lgl map_int %||% safely
#' @importFrom readr read_csv type_convert
#' @importFrom scales comma percent dollar
NULL


#' hrbrmisc exported operators
#'
#' The following functions are imported and then re-exported
#' from the hrbrmisc package to enable use of the magrittr
#' pipe operator with no additional library calls
#'
#' @name hrbrmisc-exports
NULL

#' @name %>%
#' @export
#' @rdname hrbrmisc-exports
NULL

#' @name percent
#' @export
#' @rdname hrbrmisc-exports

#' @name comma
#' @export
#' @rdname hrbrmisc-exports

#' @name dollar
#' @export
#' @rdname hrbrmisc-exports
