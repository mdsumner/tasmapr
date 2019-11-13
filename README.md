
[![Travis-CI Build
Status](https://travis-ci.org/mdsumner/tasmapr.svg?branch=master)](https://travis-ci.org/mdsumner/tasmapr)

# tasmapr

The goal of tasmapr is to provide background maps of Tasmania for R
leaflet.

# Install

``` r
devtools::install_github("mdsumner/tasmapr")
```

## Example

This is a basic example which shows you how to make an awesome map\!

``` r
library(tasmapr)
tasmap()  ## Topographic basemap


tasmap(basemap = "TTSA")  ## Tasmania Towns Street Atlas

tasmap(basemap = "HillshadeGrey")  ## hill shade
```

See it here: <http://rpubs.com/cyclemumner/283273>

See <https://github.com/mdsumner/wmts.git> for a way to get these layers
as raster data.

## Code of Conduct

Please note that the tasmapr project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/1/0/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
