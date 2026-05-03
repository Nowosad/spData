# Marshall's infant mortality in Auckland dataset

(Use `example(auckland)` to load the data from shapefile and generate
neighbour list on the fly). The `auckland` data frame has 167 rows
(census area units — CAU) and 4 columns. The dataset also includes the
"nb" object `auckland.nb` of neighbour relations based on contiguity,
and the "polylist" object `auckpolys` of polygon boundaries for the CAU.
The `auckland` data frame includes the following columns:

## Usage

``` r
auckland
```

## Format

This data frame contains the following columns:

- Easting: a numeric vector of x coordinates in an unknown spatial
  reference system

- Northing: a numeric vector of y coordinates in an unknown spatial
  reference system

- M77_85: a numeric vector of counts of infant (under 5 years of age)
  deaths in Auckland, 1977-1985

- Und5_81: a numeric vector of population under 5 years of age at the
  1981 Census

## Source

Marshall R M (1991) Mapping disease and mortality rates using Empirical
Bayes Estimators, Applied Statistics, 40, 283–294; Bailey T, Gatrell A
(1995) Interactive Spatial Data Analysis, Harlow: Longman — INFOMAP data
set used with permission.

## Details

The contiguous neighbours object does not completely replicate results
in the sources, and was reconstructed from `auckpolys`; examination of
figures in the sources suggests that there are differences in detail,
although probably not in substance.

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  auckland <- sf::st_read(system.file("shapes/auckland.gpkg", package="spData")[1])
  plot(sf::st_geometry(auckland))
  if (requireNamespace("spdep", quietly = TRUE)) {
    auckland.nb <- spdep::poly2nb(auckland)
  }
}
#> Reading layer `auckland' from data source 
#>   `/home/runner/work/_temp/Library/spData/shapes/auckland.gpkg' 
#>   using driver `GPKG'
#> Simple feature collection with 167 features and 4 fields
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 7.6 ymin: -4.3 xmax: 91.5 ymax: 99.3
#> Projected CRS: Undefined Cartesian SRS with unknown unit

```
