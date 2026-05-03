# Lucas county OH housing

Data on 25,357 single family homes sold in Lucas County, Ohio, 1993-1998
from the county auditor, together with an `nb` neighbour object
constructed as a sphere of influence graph from projected coordinates.

## Usage

``` r
house
```

## Format

Formal class 'SpatialPointsDataFrame' \[package "sp"\] with 5 slots. The
data slot is a data frame with 25357 observations on the following 24
variables.

- price: a numeric vector

- yrbuilt: a numeric vector

- stories: a factor with levels `one` `bilevel` `multilvl` `one+half`
  `two` `two+half` `three`

- TLA: a numeric vector

- wall: a factor with levels `stucdrvt` `ccbtile` `metlvnyl` `brick`
  `stone` `wood` `partbrk`

- beds: a numeric vector

- baths: a numeric vector

- halfbaths: a numeric vector

- frontage: a numeric vector

- depth: a numeric vector

- garage: a factor with levels `no garage` `basement` `attached`
  `detached` `carport`

- garagesqft: a numeric vector

- rooms: a numeric vector

- lotsize: a numeric vector

- sdate: a numeric vector

- avalue: a numeric vector

- s1993: a numeric vector

- s1994: a numeric vector

- s1995: a numeric vector

- s1996: a numeric vector

- s1997: a numeric vector

- s1998: a numeric vector

- syear: a factor with levels `1993` `1994` `1995` `1996` `1997` `1998`

- age: a numeric vector

Its projection is `CRS(+init=epsg:2834)`, the Ohio North State Plane.

## Source

Dataset included in the Spatial Econometrics toolbox for Matlab,
formerly available from
http://www.spatial-econometrics.com/html/jplv7.zip.

## Examples

``` r
if (requireNamespace("sp", quietly = TRUE)) {
  library(sp)
  data(house)
  str(house)
  plot(house)
}
#> Formal class 'SpatialPointsDataFrame' [package "sp"] with 5 slots
#>   ..@ data       :'data.frame':  25357 obs. of  24 variables:
#>   .. ..$ price     : int [1:25357] 303000 92000 90000 330000 185000 100000 43065 305000 56493 50000 ...
#>   .. ..$ yrbuilt   : int [1:25357] 1978 1957 1937 1887 1978 1989 1927 1990 1877 1936 ...
#>   .. ..$ stories   : Factor w/ 7 levels "one","bilevel",..: 4 1 5 4 5 1 1 4 1 1 ...
#>   .. ..$ TLA       : int [1:25357] 3273 920 1956 1430 2208 1232 832 3011 1034 960 ...
#>   .. ..$ wall      : Factor w/ 7 levels "stucdrvt","ccbtile",..: 7 3 1 6 7 6 6 7 6 6 ...
#>   .. ..$ beds      : num [1:25357] 4 2 3 4 3 1 2 3 3 2 ...
#>   .. ..$ baths     : num [1:25357] 3 1 1 1 2 1 1 2 1 1 ...
#>   .. ..$ halfbaths : num [1:25357] 1 0 0 0 1 0 0 1 0 0 ...
#>   .. ..$ frontage  : int [1:25357] 177 100 192 200 241 154 320 362 500 220 ...
#>   .. ..$ depth     : int [1:25357] 0 0 0 217 0 1420 0 0 990 0 ...
#>   .. ..$ garage    : Factor w/ 5 levels "no garage","basement",..: 3 4 3 1 3 4 4 3 4 4 ...
#>   .. ..$ garagesqft: int [1:25357] 625 308 480 0 528 1200 360 672 624 780 ...
#>   .. ..$ rooms     : int [1:25357] 12 4 7 7 7 5 4 6 7 6 ...
#>   .. ..$ lotsize   : int [1:25357] 53496 37900 52900 43560 225800 214100 23500 324900 354200 37000 ...
#>   .. ..$ sdate     : int [1:25357] 960423 970421 931101 971223 950807 931101 951031 931229 960222 960607 ...
#>   .. ..$ avalue    : int [1:25357] 306514 84628 126514 199228 192514 107914 49028 263400 76600 50714 ...
#>   .. ..$ s1993     : int [1:25357] 0 0 1 0 0 1 0 1 0 0 ...
#>   .. ..$ s1994     : int [1:25357] 0 0 0 0 0 0 0 0 0 0 ...
#>   .. ..$ s1995     : int [1:25357] 0 0 0 0 1 0 1 0 0 0 ...
#>   .. ..$ s1996     : int [1:25357] 1 0 0 0 0 0 0 0 1 1 ...
#>   .. ..$ s1997     : int [1:25357] 0 1 0 1 0 0 0 0 0 0 ...
#>   .. ..$ s1998     : int [1:25357] 0 0 0 0 0 0 0 0 0 0 ...
#>   .. ..$ syear     : Factor w/ 6 levels "1993","1994",..: 4 5 1 5 3 1 3 1 4 4 ...
#>   .. ..$ age       : num [1:25357] 0.21 0.42 0.62 1.12 0.21 0.1 0.72 0.09 1.22 0.63 ...
#>   ..@ coords.nrs : num(0) 
#>   ..@ coords     : num [1:25357, 1:2] 484668 484876 485248 485764 488150 ...
#>   .. ..- attr(*, "dimnames")=List of 2
#>   .. .. ..$ : NULL
#>   .. .. ..$ : chr [1:2] "long" "lat"
#>   ..@ bbox       : num [1:2, 1:2] 484575 195270 538364 229836
#>   .. ..- attr(*, "dimnames")=List of 2
#>   .. .. ..$ : chr [1:2] "long" "lat"
#>   .. .. ..$ : chr [1:2] "min" "max"
#>   ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
#>   .. .. ..@ projargs: chr "+proj=lcc +lat_0=39.6666666666667 +lon_0=-82.5 +lat_1=41.7 +lat_2=40.4333333333333 +x_0=600000 +y_0=0 +ellps=GR"| __truncated__
#>   .. .. ..$ comment: chr "PROJCRS[\"unknown\",\n    BASEGEOGCRS[\"unknown\",\n        DATUM[\"Unknown based on GRS80 ellipsoid\",\n      "| __truncated__
```
