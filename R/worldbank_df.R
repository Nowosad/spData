#' @name worldbank_df
#' @aliases worldbank_df
#' @title World bank data
#'
#' @description The object loaded is a \code{data.frame} object containing a data from World Bank
#' 
#' @format Formal class 'data.frame'; the data contains a data.frame with 217 obs. of 7 variables:
#' \itemize{
#'     \item{name} {factor of country names}
#'     \item{iso_a2} {factor of ISO 2 character country codes}
#'     \item{HDI} {human development index (HDI)}
#'     \item{urban_pop} {urban population}
#'     \item{unemployment} {unemployment, total (\% of total labor force)}
#'     \item{pop_growth} {population growth (annual \%)}
#'     \item{literacy} {adult literacy rate, population 15+ years, both sexes (\%)}
#' }
#' 
#' @seealso 
#' See the wbstats package: https://cran.r-project.org/web/packages/wbstats
#' 
#' @source \url{http://data.worldbank.org/}
#' @docType data
#' @keywords datasets
#' @examples 
#' data(worldbank_df)
#' # or
#' worldbank_df <- st_read(system.file("misc/worldbank_df.gpkg", package="spData"))
#' 
#' summary(worldbank_df)
#' 

NULL
