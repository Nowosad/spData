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
#'     \item{year: Year of population estimate}
#'     \item{country_code: Code of country}
#'     \item{urban_agglomeration: Name of the urban agglomeration}
#'     \item{population_millions: Estimated human population}
#'     \item{geometry: sfc_POINT}
#' }
#' 
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   plot(urban_agglomerations)
#' }
#' # Code used to download the data:
#' \dontrun{
#' f = "WUP2018-F11b-30_Largest_Cities_in_2018_by_time.xls"
#' download.file(
#'   destfile = f,
#'   url = paste0("https://population.un.org/wup/Download/Files/", f)
#'  )
#' library(dplyr)
#' library(sf)
#' urban_agglomerations = readxl::read_excel(f, skip = 16) %>%
#'     st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326)
#' names(urban_agglomerations)
#' names(urban_agglomerations) <- gsub(" |\\n", "_", tolower(names(urban_agglomerations)) ) %>% 
#'         gsub("\\(|\\)", "", .)
#' names(urban_agglomerations)
#' urban_agglomerations
#' usethis::use_data(urban_agglomerations, overwrite = TRUE)
#' file.remove("WUP2018-F11b-30_Largest_Cities_in_2018_by_time.xls")
#' }
"urban_agglomerations"
