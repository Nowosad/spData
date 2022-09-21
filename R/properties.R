#' @name properties
#' @aliases properties
#' @title Dataset of properties in the municipality of Athens (sf) 
#'
#' @description A dataset of apartments in the municipality of Athens for 2017. Point location of the properties is given together with their main characteristics and the distance to the closest metro/train station.
#' 
#' @format An sf object of 1000 points with the following 6 variables.
#' \itemize{
#'   \item{id}{An unique identifier for each property.}
#'   \item{size }{The size of the property (unit: square meters)}
#'   \item{price }{The asking price (unit: euros) }
#'   \item{prpsqm }{The asking price per squre meter (unit: euroes/square meter).}
#'   \item{age }{Age of property in 2017 (unit: years).}
#'   \item{dist_metro}{The distance to closest train/metro station (unit: meters).}
#' }
#' 
#' @docType data
#' @keywords datasets sf hierarchical spatial data
#' @seealso depmunic
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   if (requireNamespace("spdep", quietly = TRUE)) {
#'     library(sf)
#'     library(spdep)
#'     
#'     data(properties)
#'     
#'     summary(properties$prpsqm)
#'     
#'     pr.nb.800 <- dnearneigh(properties, 0, 800)
#'     pr.listw <- nb2listw(pr.nb.800)
#'     
#'     moran.test(properties$prpsqm, pr.listw)
#'     moran.plot(properties$prpsqm, pr.listw, xlab = "Price/m^2", ylab = "Lagged")
#'   }
#' }
"properties"
