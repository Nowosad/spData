# Cycle hire points in London from OSM

Dataset downloaded using the osmdata package representing cycle hire
points accross London.

## Usage

``` r
cycle_hire_osm
```

## Format

- osm_id: The OSM ID

- name: The name of the cycle point

- capacity: How many bikes it can take

- cyclestreets_id: The ID linked to cyclestreets' photomap

- description: Additional description of points

- geometry: sfc_POINT

## Source

<https://www.openstreetmap.org>

## See also

See the osmdata package: https://cran.r-project.org/package=osmdata

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(cycle_hire_osm)
  # or
  cycle_hire_osm <- st_read(system.file("shapes/cycle_hire_osm.geojson", package="spData"))
  
  plot(cycle_hire_osm)
}
#> Reading layer `cycle_hire_osm' from data source 
#>   `/home/runner/work/_temp/Library/spData/shapes/cycle_hire_osm.geojson' 
#>   using driver `GeoJSON'
#> Simple feature collection with 532 features and 5 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: -0.229123 ymin: 51.45927 xmax: -0.0079843 ymax: 51.54683
#> Geodetic CRS:  WGS 84


# Code used to download the data:
if (FALSE) { # \dontrun{
library(osmdata)
library(dplyr)
library(sf)
q = add_osm_feature(opq = opq("London"), key = "network", value = "tfl_cycle_hire")
lnd_cycle_hire = osmdata_sf(q)
cycle_hire_osm = lnd_cycle_hire$osm_points
nrow(cycle_hire_osm)
plot(cycle_hire_osm)
cycle_hire_osm = dplyr::select(cycle_hire_osm, osm_id, name, capacity, 
                               cyclestreets_id, description) |>
  mutate(capacity = as.numeric(capacity))
names(cycle_hire_osm)
nrow(cycle_hire_osm)
} # }
```
