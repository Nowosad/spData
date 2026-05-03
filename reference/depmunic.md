# Municipality departments of Athens (Sf)

The geographic boundaries of departments (sf) of the municipality of
Athens. This is accompanied by various characteristics in these areas.

## Usage

``` r
depmunic
```

## Format

An sf object of 7 polygons with the following 7 variables.

- num_dep: An unique identifier for each municipality department.

- airbnb: The number of airbnb properties in 2017

- museums: The number of museums

- population: The population recorded in census at 2011.

- pop_rest: The number of citizens that the origin is a non european
  country.

- greensp: The area of green spaces (unit: square meters).

- area: The area of the polygon (unit: square kilometers).

## See also

properties

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(depmunic)
  
  depmunic$foreigners <- 100*depmunic$pop_rest/depmunic$population
  plot(depmunic["foreigners"], key.pos=1)
}
```
