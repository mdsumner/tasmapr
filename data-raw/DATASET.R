d <- structure(list(Name = c("Orthophoto", "Tasmap25k", "Tasmap100k",
                        "Tasmap250k", "TasmapRaster", "Hillshade", "TopoGrey", "Topographic"
), ServiceUrl = c(
                  "https://services.thelist.tas.gov.au/arcgis/services/Basemaps/Orthophoto/MapServer/WMSServer?",
                  "http://services.thelist.tas.gov.au/arcgis/services/Basemaps/Tasmap25K/ImageServer/WMSServer?",
                  "http://services.thelist.tas.gov.au/arcgis/services/Basemaps/Tasmap100K/ImageServer/WMSServer?",
                  "http://services.thelist.tas.gov.au/arcgis/services/Basemaps/Tasmap250K/ImageServer/WMSServer?",
                  "http://services.thelist.tas.gov.au/arcgis/services/Basemaps/TasmapRaster/ImageServer/WMSServer?",
                  "http://services.thelist.tas.gov.au/arcgis/services/Basemaps/Hillshade/MapServer/WMSServer?",
                  "http://services.thelist.tas.gov.au/arcgis/services/Basemaps/TopographicGrayScale/ImageServer/WMSServer?",
                  "http://services.thelist.tas.gov.au/arcgis/services/Basemaps/Topographic/ImageServer/WMSServer?"
)), class = "data.frame", row.names = c(NA, -8L))





tasmap_layers <- tibble::tribble(
  ~Name, ~ServiceUrl,
  "TTSA", "https://services.thelist.tas.gov.au/arcgis/services/Raster/TTSA/MapServer/WMSServer?",
  "ESgisMapBookPUBLIC", "https://services.thelist.tas.gov.au/arcgis/services/Basemaps/ESgisMapBookPUBLIC/MapServer/WMSServer?",
  "HillshadeGrey", "https://services.thelist.tas.gov.au/arcgis/services/Basemaps/HillshadeGrey/MapServer/WMSServer?",
  "Tasmap250K", "https://services.thelist.tas.gov.au/arcgis/services/Basemaps/Tasmap250K/MapServer/WMSServer?",
  "Topographic","https://services.thelist.tas.gov.au/arcgis/services/Basemaps/Topographic/MapServer/WMSServer?"
)
##tasmap_layers <- dplyr::bind_rows(d, tasmap_layers)
usethis::use_data(tasmap_layers, overwrite = TRUE)
