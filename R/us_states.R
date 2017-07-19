#' @name us_states
#' @title US states polygons
#'
#' @description The object loaded is a \code{sf} object containing the contiguous United States data from the US Census Bureau
#' with a few variables from American Community Survey (ACS)
#' 
#' @format Formal class 'sf' [package "sf"]; the data contains a data.frame with 49 obs. of 6 variables:
#' \itemize{
#'     \item{GEOID} {character vector of geographic identifiers}
#'     \item{NAME} {character vector of state names}
#'     \item{REGION} {character vector of region names}
#'     \item{AREA} {area in square kilometers of units class}
#'     \item{total_pop_10} {numerical vector of total population in 2010}
#'     \item{total_pop_15} {numerical vector of total population in 2015}
#'     \item{geometry} {sfc_MULTIPOLYGON}
#' }
#' The object is in geographical coordinates using the NAD83 datum.
#' 
#' @seealso 
#' See the tigris package: https://cran.r-project.org/package=tigris
#' 
#' @source \url{https://www.census.gov/geo/maps-data/data/tiger-line.html}
#' @docType data
#' @keywords datasets sf
#' @examples 
#' library(sf)
#' data(us_states)
#' 
#' plot(us_states["REGION"])
#' 

NULL
