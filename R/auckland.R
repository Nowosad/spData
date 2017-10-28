#' @name auckland
#' @aliases auckland auckland.nb auckpolys
#' @title Marshall's infant mortality in Auckland dataset
#'
#' @description (Use \code{example(auckland)} to load the data from shapefile and generate neighbour list on the fly).  The \code{auckland} data frame has 167 rows (census area units --- CAU) and 4 columns. The dataset also includes the "nb" object \code{auckland.nb} of neighbour relations based on contiguity, and the "polylist" object \code{auckpolys} of polygon boundaries for the CAU. The \code{auckland} data frame includes the following columns:
#' 
#' @format This data frame contains the following columns:
#' \itemize{
#'         \item{Easting} {a numeric vector of x coordinates in an unknown spatial reference system}
#'         \item{Northing} {a numeric vector of y coordinates in an unknown spatial reference system}
#'         \item{M77_85} {a numeric vector of counts of infant (under 5 years of age) deaths in Auckland, 1977-1985}
#'         \item{Und5_81} {a numeric vector of population under 5 years of age at the 1981 Census}
#' }
#' 
#' @details The contiguous neighbours object does not completely replicate results in the sources, and was reconstructed from \code{auckpolys}; examination of figures in the sources suggests that there are differences in detail, although probably not in substance.
#' @source Marshall R M (1991) Mapping disease and mortality rates using Empirical Bayes Estimators, Applied Statistics, 40, 283--294; Bailey T, Gatrell A (1995) Interactive Spatial Data Analysis, Harlow: Longman --- INFOMAP data set used with permission.
#' @docType data
#' @keywords datasets sp
#' 
#' @examples 
#' library(rgdal)
#' auckland <- readOGR(system.file("shapes/auckland.shp", package="spData")[1])
#' plot(auckland)
#' 
#' library(spdep)
#' auckland.nb <- poly2nb(auckland)
"auckland"
