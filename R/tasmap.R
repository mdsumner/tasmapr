#' Tasmania maps
#'
#' @param map optional mapview object
#' @param data see `mapview::mapview`
#' @param ... see mapview
#'
#' @return
#' @export
#' @importFrom magrittr %>%
#' @importFrom mapview mapview
#' @importFrom leaflet setView addWMSTiles
#' @export  mapview
#' @references
#' https://atriplex.info/blog/index.php/2017/06/08/adding-wms-basemaps-to-a-mapview-map/
#' @examples
tasmap <- function(map, data, ...) {
  if (missing(map)) {
    map <- mapview::mapview()
    map@map <- map@map %>% leaflet::setView(lng = 147.3, lat = -42.9, zoom = 12)
  }
  map@map <- map@map %>% leaflet::addWMSTiles(group="TasBase",baseUrl="http://services.thelist.tas.gov.au/arcgis/services/Basemaps/Orthophoto/ImageServer/WMSServer?",layers = "0") %>%
    mapview:::mapViewLayersControl(names = c("TasBase"))
}


#' The pipe
#' @export
#' @name pipe
`%>%`

#' The mapview
#' @export
#' @name mapview
