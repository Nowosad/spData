#' @name elect80
#' @aliases elect80 elect80_lw k4 dll e80_queen
#' @title 1980 Presidential election results
#'
#' @description A data set for 1980 Presidential election results covering 3,107 US counties using geographical coordinates. In addition, three spatial neighbour objects, \code{k4} not using Great Circle distances, \code{dll} using Great Circle distances, and \code{e80_queen} of Queen contiguities for equivalent County polygons taken from file \code{co1980p020.tar.gz} on the USGS National Atlas site, and a spatial weights object imported from \code{elect.ford} - a 4-nearest neighbour non-GC row-standardised object, but with coercion to symmetry.
#' 
#' @format 
#' A SpatialPointsDataFrame with 3107 observations on the following 7 variables.
#' \itemize{
#'         \item{FIPS}{a factor of county FIPS codes}
#'         \item{long}{a numeric vector of longitude values}
#'         \item{lat}{a numeric vector of latitude values}
#'         \item{pc_turnout}{Votes cast as proportion of population over age 19 eligible to vote}
#'         \item{pc_college}{Population with college degrees as proportion of population over age 19 eligible to vote}
#'         \item{pc_homeownership}{Homeownership as proportion of population over age 19 eligible to vote}
#'         \item{pc_income}{Income per capita of population over age 19 eligible to vote}
#' }
#' 
#' @source Pace, R. Kelley and Ronald Barry. 1997. "Quick Computation of Spatial Autoregressive Estimators", in Geographical Analysis; sourced from the data folder in the Spatial Econometrics Toolbox for Matlab, \url{http://www.spatial-econometrics.com/html/jplv7.zip}, files \code{elect.dat} and \code{elect.ford} (with the final line dropped).
#' @docType data
#' @keywords datasets
#' 
#' @examples 
#' data(elect80)
#'

NULL