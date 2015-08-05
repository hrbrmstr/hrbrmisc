#' Plot a fortified map using coord_quickmap
#'
#' This function will try to automatically determine what column in
#' \code{map_data} should be used for the \code{map_id}. Specifying a
#' value overrides this heuristic.
#'
#' @param map_d the fortified map data frame
#' @param map_id since map data for ggplot is sometimes inconsistent in
#'        the naming scheme for the column providing the \code{map_id},
#'        this function will try to determine if "\code{region}" or "\code{id}"
#'        is being used but will use the caller-specified \code{map_id} if
#'        present.
#' @import ggplot2
#' @return ggplot object
#' @export
quick_map <- function(map_data, map_id=NULL) {

  if (is.null(map_id)) {

    if (all(c("id", "group") %in% colnames(map_data))) {
      map_id <- "id"
    } else if (all(c("region", "subregion") %in% colnames(map_data))) {
      map_id <- "region"
    } else {
      message("map_id not specified and heuristics were indeterminate, using 'region'")
      map_id <- "region"
    }

  }

  gg <- ggplot()
  gg <- gg + geom_map(data=map_data, map=map_data,
                      aes_string(x="long", y="lat", map_id=map_id),
                      color="black", fill="white", size=0.25)
  gg <- gg + coord_quickmap()
  suppressMessages(suppressWarnings(gg <- gg + ggthemes::theme_map()))
  gg

}
