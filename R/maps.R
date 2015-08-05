#' Plot a fortified map using coord_quickmap
#'
#' @param map_d the fortified map data frame
#' @param map_id since map data for ggplot is sometimes inconsistent in
#'        the naming scheme for the column providing the \code{map_id},
#'        use "\code{region}" by default but let the caller specify
#'        another name (e.g. "\code{id}") if it's different.
#' @import ggplot2
#' @return ggplot object
#' @export
quick_map <- function(map_data, map_id="region") {

  gg <- ggplot()
  gg <- gg + geom_map(data=map_data, map=map_data,
                      aes_string(x="long", y="lat", map_id=map_id),
                      color="black", fill="white", size=0.25)
  gg <- gg + coord_quickmap()
  gg <- gg + ggthemes::theme_map()
  gg

}
