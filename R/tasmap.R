#' Tasmania maps
#'
#' @param map optional mapview object
#' @param data see `mapview::mapview`
#' @param basemap short name of Tasmap baselayer, see `tasmapr::listTasmapLayers` or the URL of the WMS service to use
#' @param ... see mapview
#'
#' @return mapview object
#' @export
#' @importFrom magrittr %>%
#' @importFrom mapview mapview
#' @importFrom leaflet setView addWMSTiles
#' @references
#' https://atriplex.info/blog/index.php/2017/06/08/adding-wms-basemaps-to-a-mapview-map/
#' @examples
#' tasmap(basemap = "TTSA")
tasmap <- function(map, data, basemap="Topographic",...) {
  if (missing(map)) {
    map <- mapview::mapview()
    map@map <- map@map %>% leaflet::setView(lng = 147.3, lat = -42.9, zoom = 12)
  }
  if (basemap %in% tasmap_layers$Name){
    selected_basemap <- tasmap_layers$ServiceUrl[tasmap_layers$Name==basemap]
    basemap_name <- basemap
  } else if (basemap == ""){
    selected_basemap<- tasmap_layers$ServiceUrl[tasmap_layers$Name=="Topographic"]
    basemap_name <- "Topographic"
  }else{
    selected_basemap <- basemap
    basemap_name <- "CustomWMS"
  }
   map@map %>% leaflet::addWMSTiles(group=basemap_name,baseUrl=selected_basemap,layers = "0") %>%
    mapview:::mapViewLayersControl(names = c(basemap_name))
}

