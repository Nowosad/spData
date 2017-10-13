#' @name cycle_hire_osm
#' @aliases cycle_hire_osm
#' @title Cycle hire points in London from OSM
#'
#' @description Dataset downloaded using the osmdata package
#' representing cycle hire points accross London.
#' 
#' @format 
#' \itemize{
#'     \item{osm_id} {The OSM ID}
#'     \item{name} {The name of the cycle point}
#'     \item{capacity} {How many bikes it can take}
#'     \item{cyclestreets_id} {The ID linked to cyclestreets' photomap}
#'     \item{description} {Additional description of points}
#'     \item{geometry} {sfc_POINT}
#' }
#' 
#' @seealso 
#' See the osmdata package: https://cran.r-project.org/package=osmdata
#' 
#' @source \url{http://www.openstreetmap.org}
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' library(sf)
#' data(cycle_hire_osm)
#' # or
#' cycle_hire_osm <- st_read(system.file("shapes/cycle_hire_osm.geojson", package="spData"))
#' 
#' plot(cycle_hire_osm)
#' 
#' # Code used to download the data:
#' \dontrun{
#' library(osmdata)
#' library(sf)
#' q = add_feature(opq = opq("London"), key = "network", value = "tfl_cycle_hire")
#' lnd_cycle_hire = osmdata_sf(q)
#' lnd_cycle_p = lnd_cycle_hire$osm_points
#' plot(lnd_cycle_p)
#' lnd_cycle_p_mini = dplyr::select(lnd_cycle_p, osm_id, name, capacity, cyclestreets_id, description)
#' nrow(lnd_cycle_p_mini)
#' }
NULL
