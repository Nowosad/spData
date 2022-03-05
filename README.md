
<!-- README.md is generated from README.Rmd. Please edit that file -->

# spData

[![GitHub action build
status](https://github.com/Nowosad/spData/workflows/pkgdown/badge.svg)](https://github.com/Nowosad/spData/actions)
[![CRAN
version](http://www.r-pkg.org/badges/version/spData)](https://cran.r-project.org/package=spData)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/spData)](https://cran.r-project.org/package=spData)
[![CRAN RStudio total mirror
downloads](https://cranlogs.r-pkg.org/badges/grand-total/spData)](https://cran.r-project.org/package=spData)

Datasets for spatial analysis

### **sf**

-   `alaska` - Alaska multipolygon
-   `aggregating_zones` - See `congruent`
-   `congruent` - Sample of UK administrative zones that have shared
    borders with `aggregating_zones` (`incongruent` does not have shared
    borders) for teaching the concept of spatial congruence
-   `cycle_hire` - Cycle hire points in London
-   `cycle_hire_osm` - Cycle hire points in London from OSM
-   `hawaii` - Hawaii multipolygon
-   `incongruent` - See `congruent`
-   `lnd` - The boroughs of London
-   `nz` - The regions of New Zealand
-   `nz_height` - High points in New Zealand
-   `seine` - Small river network in France
-   `urban_agglomerations` - Major urban areas worldwide
-   `us_states` - US states polygons
-   `world` - World country polygons

### **sp**

-   `auckland` - Marshall’s infant mortality in Auckland dataset
-   `elect80` - 1980 Presidential election results
-   `house` - Lucas county OH housing
-   `SplashDams` - Data for Splash Dams in western Oregon
-   `state.vbm` - US State Visibility Based Map

### **spdep**

-   `afcon` - Spatial patterns of conflict in Africa 1966-78
-   `boston` - Boston Housing Data
-   `columbus` - Columbus OH spatial analysis data set
-   `eire` - Eire data sets
-   `nc.sids` - North Carolina SIDS data
-   `NY_data` - New York leukemia data
-   `used.cars` - US 1960 used car prices

### **raster**

-   `elev` - Small raster dataset representing elevation values
-   `grain` - Small raster dataset representing grain size classes

### misc

-   `baltimore` - House sales prices, Baltimore, MD 1978
-   `coffee_data` - World coffee production statistics by country, 2016
    and 2017
-   `getisord` - Getis-Ord remote sensing example data
-   `hopkins` - Hopkins burnt savanna herb remains
-   `huddersfield` - Prevalence of respiratory symptoms
-   `jenks71` - Illinois 1959 county gross farm product value per acre
-   `us_states_df` - Selected American Community Survey (ACS) data
-   `wheat` - Mercer and Hall wheat yield data
-   `worldbank_df` - Selected World Bank data

## Installation

Get the released version from CRAN:

``` r
install.packages("spData")
```

Get the development version from github:

``` r
devtools::install_github("nowosad/spData")
```

## spDataLarge

This package interacts with data available through the **spDataLarge**
package, which is available in a ‘drat’ repository. To access this data
package, run:

``` r
install.packages("spDataLarge", repos = "https://nowosad.github.io/drat/", type = "source")
```

The size of the **spDataLarge** package is approximately 20 MB. Learn
more about the **spDataLarge** package at
<https://github.com/Nowosad/spDataLarge>.

## Contributions

[Feel free to submit issues and enhancement
requests.](https://github.com/Nowosad/spData/issues)
