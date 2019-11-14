utils::globalVariables("tasmap_layers")

#' Tasmania maps
#'
#' @param map optional mapview object
#' @param data see `mapview::mapview`
#' @param basemap short name of Tasmap baselayer, see `tasmapr::tasmap_layers` or the URL of the WMS service to use
#' @param ... see mapview
#' @param layers layers argument to [leaflet::addWMSTiles()]
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
tasmap <- function(map, data, basemap="Topographic",..., layers = "0") {
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
  if (basemap == "ESgisMapBookPUBLIC") {
    warning("ESgisMapBookPUBLIC is not working properly, not sure why atm")
  }
   map@map %>% leaflet::addWMSTiles(group=basemap_name,
                                    baseUrl=selected_basemap,layers = layers) %>%
     leafem::updateLayersControl(addOverlayGroups =  c(basemap_name))
}

