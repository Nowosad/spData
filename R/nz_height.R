#' @name nz_height
#' @title High points in New Zealand
#'
#' @description 
#' 
#' Top 101 heighest points in New Zealand (2017).
#' See \url{https://data.linz.govt.nz/layer/50284-nz-height-points-topo-150k/} for details.
#' 
#' @format FORMAT:
#' \itemize{
#'     \item{t50_fid} {ID}
#'     \item{elevation} {Height above sea level in m}
#'     \item{geometry} {sfc_POINT}
#' }
#' 
#' @source \url{https://data.linz.govt.nz}
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   summary(nz_height)
#'   plot(nz$geom)
#'   plot(nz_height$geom, add = TRUE)
#' }
#' \dontrun{
#' library(dplyr)
#' After downloading data from https://data.linz.govt.nz/layer/50284-nz-height-points-topo-150k/
#' unzip("lds-nz-height-points-topo-150k-SHP.zip")
#' nz_height = st_read("nz-height-points-topo-150k.shp") %>% 
#'   top_n(n = 100, wt = elevation)
#' library(tmap)
#' tmap_mode("view")
#' qtm(nz) +
#'   qtm(nz_height)
#' f = list.files(pattern = "*nz-height*")
#' file.remove(f)
#' }
"nz_height"
