# Small river network in France

Lines representing the Seine, Marne and Yonne rivers.

## Usage

``` r
seine
```

## Format

FORMAT:

- name: name

- geometry: sfc_MULTILINESTRING

The object is in the RGF93 / Lambert-93 CRS.

## Source

<https://www.naturalearthdata.com/>

## See also

See the rnaturalearth package:
https://cran.r-project.org/package=rnaturalearth

## Examples

``` r
if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  seine
  plot(seine)
}

if (FALSE) { # \dontrun{
library(sf)
library(rnaturalearth)
library(tidyverse)

seine = ne_download(scale = 10, type = "rivers_lake_centerlines", 
                    category = "physical", returnclass = "sf") |> 
        filter(name %in% c("Yonne", "Seine", "Marne")) |> 
        select(name = name_en) |> 
        st_transform(2154)
} # }
```
