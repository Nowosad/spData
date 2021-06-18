#' @name SplashDams
#' @aliases SplashDams
#' @title Data for Splash Dams in western Oregon
#'
#' @description Data for Splash Dams in western Oregon
#' 
#' @format Formal class 'SpatialPointsDataFrame with 232 obs. of  6 variables:
#' \itemize{
#' \item{streamName} {}
#' \item{locationCode} {}
#' \item{height} {}
#' \item{lastDate} {}
#' \item{owner} {}
#' \item{datesUsed} {}
#' }
#' 
#' @source R. R. Miller (2010) Is the Past Present? Historical Splash-dam Mapping and Stream Disturbance Detection in the Oregon Coastal Province. MSc. thesis, Oregon State University; packaged by Jonathan Callahan
#' @references \url{https://www.fs.fed.us/pnw/lwm/aem/docs/burnett/miller_rebecca_r2010rev.pdf}
#' @docType data
#' @keywords datasets sp
#' @importClassesFrom sp SpatialPointsDataFrame
#' 
#' @examples 
#' if (requireNamespace("sp", quietly = TRUE)) {
#'   library(sp)
#'   data(SplashDams)
#'   plot(SplashDams, axes=TRUE)
#' }
"SplashDams"
