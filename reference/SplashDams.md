# Data for Splash Dams in western Oregon

Data for Splash Dams in western Oregon

## Usage

``` r
SplashDams
```

## Format

Formal class 'SpatialPointsDataFrame with 232 obs. of 6 variables:

- streamName

- locationCode

- height

- lastDate

- owner

- datesUsed

## Source

R. R. Miller (2010) Is the Past Present? Historical Splash-dam Mapping
and Stream Disturbance Detection in the Oregon Coastal Province. MSc.
thesis, Oregon State University; packaged by Jonathan Callahan

## Examples

``` r
if (requireNamespace("sp", quietly = TRUE)) {
  library(sp)
  data(SplashDams)
  plot(SplashDams, axes=TRUE)
}
```
