# US states polygons

The object loaded is a `sf` object containing the contiguous United
States data from the US Census Bureau with a few variables from American
Community Survey (ACS)

## Usage

``` r
us_states
```

## Format

Formal class 'sf' \[package "sf"\]; the data contains a data.frame with
49 obs. of 7 variables:

- GEOID: character vector of geographic identifiers

- NAME: character vector of state names

- REGION: character vector of region names

- AREA: area in square kilometers of units class

- total_pop_10: numerical vector of total population in 2010

- total_pop_15: numerical vector of total population in 2015

- geometry: sfc_MULTIPOLYGON

The object is in geographical coordinates using the NAD83 datum.

## Source

<https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>

## See also

See the tigris package: https://cran.r-project.org/package=tigris

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(us_states)

  plot(us_states["REGION"])
}
```
