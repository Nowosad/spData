#' @name nz
#' @aliases new_zealand
#' @title Regions in New Zealand
#'
#' @description 
#' 
#' Polygons representing the 16 regions of New Zealand (2017).
#' See \url{https://en.wikipedia.org/wiki/Regions_of_New_Zealand} for a description of these regions
#' and \url{www.stats.govt.nz} for information on the data source
#' 
#' @format FORMAT:
#' \itemize{
#'     \item{REGC2017_NAME} {Name}
#'     \item{AREA_SQ_KM} {Area}
#'     \item{LAND_AREA_SQ_KM} {Land area}
#'     \item{Shape_Length} {Perimeter length (m)}
#'     \item{Shape_Area} {Area (meters squared)}
#'     \item{geometry} {sfc_MULTIPOLYGON}
#' }
#' 
#' @source \url{www.stats.govt.nz}
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   summary(nz)
#'   plot(nz)
#' }
#' \dontrun{
#' # Find "Regional Council 2016 Generalised Version"
#' # select the GeoPackage option in the "Vectors/tables" dropdown
#' # at https://datafinder.stats.govt.nz/data/ (requires registration)
#' # Save the result as:
#' unzip("statsnzregional-council-2018-clipped-generalised-GPKG.zip")
#' library(sf)
#' library(tidyverse)
#' nz_full = st_read("regional-council-2018-clipped-generalised.gpkg")
#' object.size(nz_full) / 1000000 # ~2 MB
#' nz = rmapshaper::ms_simplify(nz_full, keep = 0.001)
#' object.size(nz) / 1000 # ~40 KB
#' names(nz)
#' nz$REGC2018_V1_00_NAME
#' nz = filter(nz, REGC2018_V1_00_NAME != "Area Outside Region") %>% 
#'   select(Name = REGC2018_V1_00_NAME, `Land area` = LAND_AREA_SQ_KM)
#' devtools::install_github("hadley/rvest")
#' library(rvest)
#' doc = read_html("https://en.wikipedia.org/wiki/Regions_of_New_Zealand") %>% 
#'         html_nodes("div table")
#' tab = doc[[3]] %>% html_table()
#' tab = tab %>% select(Name = Region, Population = `Population[20]`, Island)
#' tab = tab %>% mutate(Population = str_replace_all(Population, ",", "")) %>% 
#'         mutate(Population = as.numeric(Population)) %>% 
#'         mutate(Name = str_remove_all(Name, " \\([1-9]\\)?.+"))
#' nz$Name = as.character(nz$Name)
#' nz$Name = str_remove(nz$Name, " Region")
#' nz$Name %in% tab$Name
#' nz = left_join(nz, tab)
#' }
"nz"
