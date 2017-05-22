#' @name wrld
#' @aliases wrld world
#' @title World country polygons
#'
#' @description The object loaded is a \code{sf} object containing a world map data from Natural Earth with a few variables from World Bank
#' 
#' @format Formal class 'sf' [package "sf"]; the data contains a data.frame with 177 obs. of 11 variables:
#' \itemize{
#'     \item{iso_a2} {factor of ISO 2 character country codes}
#'     \item{name_long} {factor of country names}
#'     \item{continent} {factor of continent names}
#'     \item{region_un} {factor of region names}
#'     \item{subregion} {factor of subregion names}
#'     \item{type} {factor of type names}
#'     \item{area_km2} {integer vector of area values}
#'     \item{pop} {integer vector of population in 2014}
#'     \item{lifeExp} {integer vector of life expectancy at birth in 2014}
#'     \item{gdpPercap} {integer vector of per-capita GDP in 2014}
#'     \item{geom} {sfc_MULTIPOLYGON}
#' }
#' The object is in geographical coordinates using the WGS84 datum.
#' 
#' @seealso 
#' See the rnaturalearth package: https://cran.r-project.org/package=rnaturalearth
#' 
#' @source \url{http://www.naturalearthdata.com/}
#' @source \url{http://data.worldbank.org/}
#' @docType data
#' @keywords datasets sf
#' @examples 
#' library(sf)
#' data(wrld)
#' # or
#' wrld <- st_read(system.file("shapes/wrld.gpkg", package="spData"))
#' 
#' plot(wrld)
#' 

NULL
