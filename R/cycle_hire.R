#' @name cycle_hire
#' @aliases cycle_hire
#' @title Cycle hire points in London
#'
#' @description 
#' 
#' Points
#' representing cycle hire points accross London. 
#' 
#' @format FORMAT:
#' \itemize{
#'     \item{id} {Id of the hire point}
#'     \item{name} {Name of the point}
#'     \item{area} {Area they are in}
#'     \item{nbikes} {The number of bikes currently parked there}
#'     \item{nempty} {The number of empty places}
#'     \item{geometry} {sfc_POINT}
#' }
#' 
#' @source \url{cyclehireapp.com/cyclehirelive/cyclehire.csv}
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   data(cycle_hire)
#'   # or
#'   cycle_hire <- st_read(system.file("shapes/cycle_hire.geojson", package="spData"))
#'   
#'   plot(cycle_hire)
#' }
#' 
#' \dontrun{
#' # Download the data
#' cycle_hire = readr::read_csv("http://cyclehireapp.com/cyclehirelive/cyclehire.csv", 
#'   col_names = FALSE, skip = TRUE)
#' cycle_hire = cycle_hire[c_names]
#' c_names = c("id", "name", "area", "lat", "lon", "nbikes", "nempty")
#' cycle_hire = st_sf(cycle_hire, st_multipoint(c_names[c("lon", "lat")]))
#' }
"cycle_hire"
