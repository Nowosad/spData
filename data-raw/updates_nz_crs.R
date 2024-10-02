library(spData)
library(sf)
st_crs(nz) = "EPSG:2193"
st_crs(nz_height) = "EPSG:2193"
usethis::use_data(nz, overwrite = TRUE)
usethis::use_data(nz_height, overwrite = TRUE)
