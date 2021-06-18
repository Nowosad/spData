#' @name seine
#' @aliases rivers
#' @title Small river network in France
#'
#' @description 
#' 
#' Lines representing the Seine, Marne and Yonne rivers.
#' 
#' @format FORMAT:
#' \itemize{
#'     \item{name} {name}
#'     \item{geometry} {sfc_MULTILINESTRING}
#' }
#' The object is in the RGF93 / Lambert-93 CRS.
#' 
#' @seealso 
#' See the rnaturalearth package: https://cran.r-project.org/package=rnaturalearth
#' 
#' @source \url{https://www.naturalearthdata.com/}
#' 
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   seine
#'   plot(seine)
#' }
#' \dontrun{
#' library(sf)
#' library(rnaturalearth)
#' library(tidyverse)
#' 
#' seine = ne_download(scale = 10, type = "rivers_lake_centerlines", 
#'                     category = "physical", returnclass = "sf") %>% 
#'         filter(name %in% c("Yonne", "Seine", "Marne")) %>% 
#'         select(name = name_en) %>% 
#'         st_transform(2154)
#' }
"seine"
