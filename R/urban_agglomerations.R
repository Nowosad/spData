#' @name urban_agglomerations
#' @aliases urban_agglomerations
#' @title Major urban areas worldwide
#'
#' @description Dataset in a 'long' form from the United Nations
#' population division with projections up to 2050.
#' Includes only the top 30 largest areas by population at 5 year intervals.
#' 
#' @format 
#' Selected variables:
#' \itemize{
#'     \item{year} {Year of population estimate}
#'     \item{country_code} {Code of country}
#'     \item{urban_agglomeration} {Name of the urban agglomeration}
#'     \item{population_millions} {Estimated human population}
#'     \item{geometry} {sfc_POINT}
#' }
#' 
#' @source \url{https://population.un.org/wup/}
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   data(urban_agglomerations)
#' }
#' # Code used to download the data:
#' \dontrun{
#' download.file(destfile = "WUP2014-F11a-30_Largest_Cities.xls",
#' url = "https://esa.un.org/unpd/wup/CD-ROM/WUP2014_XLS_CD_FILES/WUP2014-F11a-30_Largest_Cities.xls")
#' library(dplyr)
#' library(sf)
#' urban_agglomerations = readxl::read_excel("WUP2014-F11a-30_Largest_Cities.xls", skip = 16) %>%
#'     st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326)
#' names(urban_agglomerations) <- gsub(" ", "_", tolower(names(urban_agglomerations)) ) %>% 
#'         gsub("\\(|\\)", "", .)
#' devtools::use_data(urban_agglomerations, overwrite = TRUE)
#' file.remove("WUP2014-F11a-30_Largest_Cities.xls")
#' }
"urban_agglomerations"
