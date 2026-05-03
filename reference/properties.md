# Dataset of properties in the municipality of Athens (sf)

A dataset of apartments in the municipality of Athens for 2017. Point
location of the properties is given together with their main
characteristics and the distance to the closest metro/train station.

## Usage

``` r
properties
```

## Format

An sf object of 1000 points with the following 6 variables.

- id: An unique identifier for each property.

- size : The size of the property (unit: square meters)

- price : The asking price (unit: euros)

- prpsqm : The asking price per squre meter (unit: euroes/square meter).

- age : Age of property in 2017 (unit: years).

- dist_metro: The distance to closest train/metro station (unit:
  meters).

## See also

depmunic

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  if (requireNamespace("spdep", quietly = TRUE)) {
    library(sf)
    library(spdep)
    
    data(properties)
    
    summary(properties$prpsqm)
    
    pr.nb.800 <- dnearneigh(properties, 0, 800)
    pr.listw <- nb2listw(pr.nb.800)
    
    moran.test(properties$prpsqm, pr.listw)
    moran.plot(properties$prpsqm, pr.listw, xlab = "Price/m^2", ylab = "Lagged")
  }
}
#> Warning: neighbour object has 2 sub-graphs
```
