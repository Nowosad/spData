# 1980 Presidential election results

A data set for 1980 Presidential election results covering 3,107 US
counties using geographical coordinates. In addition, three spatial
neighbour objects, `k4` not using Great Circle distances, `dll` using
Great Circle distances, and `e80_queen` of Queen contiguities for
equivalent County polygons taken from file `co1980p020.tar.gz` on the
USGS National Atlas site, and a spatial weights object imported from
`elect.ford` - a 4-nearest neighbour non-GC row-standardised object, but
with coercion to symmetry.

## Usage

``` r
elect80
```

## Format

A SpatialPointsDataFrame with 3107 observations on the following 7
variables.

- FIPS: a factor of county FIPS codes

- long: a numeric vector of longitude values

- lat: a numeric vector of latitude values

- pc_turnout: Votes cast as proportion of population over age 19
  eligible to vote

- pc_college: Population with college degrees as proportion of
  population over age 19 eligible to vote

- pc_homeownership: Homeownership as proportion of population over age
  19 eligible to vote

- pc_income: Income per capita of population over age 19 eligible to
  vote

## Source

Pace, R. Kelley and Ronald Barry. 1997. "Quick Computation of Spatial
Autoregressive Estimators", in Geographical Analysis; sourced from the
data folder in the Spatial Econometrics Toolbox for Matlab, formerly
available from http://www.spatial-econometrics.com/html/jplv7.zip, files
`elect.dat` and `elect.ford` (with the final line dropped).

## Examples

``` r
if (requireNamespace("sp", quietly = TRUE)) {
  library(sp)
  data(elect80)
  summary(elect80)
  plot(elect80)
}
```
