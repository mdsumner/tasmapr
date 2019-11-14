test_that("tasmapr works", {
  expect_silent(tasmap())
  expect_silent(tasmap(basemap = "TTSA"))

  expect_silent(tasmap(basemap = ""))

  expect_silent(tasmap(basemap = "https://services.thelist.tas.gov.au/arcgis/services/Basemaps/HillshadeGrey/MapServer/WMSServer?"))

  expect_warning(tasmap(basemap = "ESgisMapBookPUBLIC"))

  expect_error(listTasmapLayers())
})
