#' @name alaska
#' @title Alaska multipolygon
#'
#' @description The object loaded is a \code{sf} object containing the state of 
#' Alaska from the US Census Bureau
#' with a few variables from American Community Survey (ACS)
#' 
#' @format Formal class 'sf' [package "sf"]; the data contains a data.frame with 1 obs. of 7 variables:
#' \itemize{
#'     \item{GEOID} {character vector of geographic identifiers}
#'     \item{NAME} {character vector of state names}
#'     \item{REGION} {character vector of region names}
#'     \item{AREA} {area in square kilometers of units class}
#'     \item{total_pop_10} {numerical vector of total population in 2010}
#'     \item{total_pop_15} {numerical vector of total population in 2015}
#'     \item{geometry} {sfc_MULTIPOLYGON}
#' }
#' The object is in projected coordinates using Alaska Albers (EPSG:3467).
#' 
#' @seealso 
#' See the tigris package: https://cran.r-project.org/package=tigris
#' 
#' @source \url{https://www.census.gov/geo/maps-data/data/tiger-line.html}
#' @docType data
#' @keywords datasets sf
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   data(alaska)
#' 
#'   plot(alaska["total_pop_15"])
#' }
"alaska"