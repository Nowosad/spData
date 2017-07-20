#' @name us_states_df
#' @title the American Community Survey (ACS) data
#'
#' @description The object loaded is a \code{data.frame} object containing the US states data from the American Community Survey (ACS)
#' 
#' @format Formal class 'data.frame'; the data contains a data.frame with 51 obs. of 5 variables:
#' \itemize{
#'     \item{NAME} {character vector of state names}
#'     \item{median_income_10} {numerical vector of median income in 2010}
#'     \item{median_income_15} {numerical vector of median income in 2010}
#'     \item{poverty_level_10} {numerical vector of number of people with income below poverty level in 2010}
#'     \item{poverty_level_15} {numerical vector of number of people with income below poverty level in 2015}
#' }
#' 
#' @seealso 
#' See the tidycensus package: https://cran.r-project.org/package=tidycensus
#' 
#' @source \url{https://www.census.gov/programs-surveys/acs/}
#' @docType data
#' @keywords datasets
#' @examples 
#' data(us_states_df)
#' 
#' summary(us_states_df)
#' 

NULL
