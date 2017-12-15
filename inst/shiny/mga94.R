library(shiny)
library(leaflet)

# easting <- 523676 + c(-500, 500)
# northing <- 5317985 + c(-500, 500)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()

ui <- fluidPage(
  numericInput("easting", "Easting", 521288),
  numericInput("northing", "Northing", 5247775),
  numericInput("buffer", "Buffer (m)", 50),
  leafletOutput("mymap"),
  p(),
  actionButton("recalc", "New points")
)

server <- function(input, output, session) {

  points <- eventReactive(input$recalc, {
    easting <- input$easting + c(-1, 1) * input$buffer
    northing <- input$northing + c(-1, 1) * input$buffer
    rgdal::project(as.matrix(expand.grid(easting, northing)),
                      "+proj=utm +zone=55 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs",
                      inv = TRUE)[, 1:2, drop = FALSE]

  }, ignoreNULL = FALSE)

  output$mymap <- renderLeaflet({
    leaflet() %>% addTiles() %>%
     # addProviderTiles(providers$Stamen.TonerLite,
      #                 options = providerTileOptions(noWrap = TRUE)
      #) %>%
      addMarkers(data = points())
  })
}

shinyApp(ui, server)
