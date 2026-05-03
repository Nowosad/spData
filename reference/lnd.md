# The boroughs of London

Polygons representing large administrative zones in London

## Usage

``` r
lnd
```

## Format

- NAME: Borough name

- GSS_CODE: Official code

- HECTARES: How many hectares

- NONLD_AREA: Area outside London

- ONS_INNER: Office for national statistics code

- SUB_2009: Empty column

- SUB_2006: Empty column

- geometry: sfc_MULTIPOLYGON

## Source

<https://github.com/Robinlovelace/Creating-maps-in-R>

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(lnd)
  summary(lnd)
  plot(st_geometry(lnd))
}
```
