# High points in New Zealand

Top 101 heighest points in New Zealand (2017). See
<https://data.linz.govt.nz/layer/50284-nz-height-points-topo-150k/> for
details.

## Usage

``` r
nz_height
```

## Format

FORMAT:

- t50_fid: ID

- elevation: Height above sea level in m

- geometry: sfc_POINT

## Source

<https://data.linz.govt.nz>

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  summary(nz_height)
  plot(nz$geom)
  plot(nz_height$geom, add = TRUE)
}

if (FALSE) { # \dontrun{
library(dplyr)
# After downloading data
unzip("lds-nz-height-points-topo-150k-SHP.zip")
nz_height = st_read("nz-height-points-topo-150k.shp") |> 
  top_n(n = 100, wt = elevation)
library(tmap)
tmap_mode("view")
qtm(nz) +
  qtm(nz_height)
f = list.files(pattern = "*nz-height*")
file.remove(f)
} # }
```
