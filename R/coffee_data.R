#' @name coffee_data
#' @title World coffee production data
#'
#' @description A tiny dataset containing estimates of global coffee in thousands of 60 kg bags produced by country.
#' Purpose: teaching **not** research.
#' 
#' @format A data frame (tibble) with 58 for the following 12 variables:
#' \itemize{
#' \item{name_long} {name of country or coffee variety}
#' \item{y16} {production in 2016}
#' \item{y17} {production in 2017}
#' }
#' 
#' @details The examples section shows how this can be joined with spatial data to create a simple map.
#' @source The International Coffee Organization (ICO). See http://www.ico.org/ and
#' http://www.ico.org/prices/m1-exports.pdf
#' @docType data
#' @keywords datasets 
#' @examples 
#' head(coffee_data)
#' \dontrun{
#' library(tidyverse)
#' library(sf)
#' # found by searching for "global coffee data"
#' u = "http://www.ico.org/prices/m1-exports.pdf"
#' download.file(u, "data.pdf", mode = "wb")
#' install.packages("pdftables") # requires api key
#' pdftables::convert_pdf(input_file = "data.pdf", output_file = "coffee-data-messy.csv")
#' d = read_csv("coffee-data-messy.csv")
#' file.remove("coffee-data-messy.csv")
#' file.remove("data.pdf")
#' coffee_data = slice(d, -c(1:9)) %>% 
#'         select(name_long = 1, y16 = 2, y17 = 3) %>% 
#'         filter(!is.na(y16)) %>% 
#'         mutate_at(2:3, str_replace, " ", "") %>% 
#'         mutate_at(2:3, as.integer)
#' world_coffee = left_join(world, coffee_data)
#' plot(world_coffee[c("y16", "y17")])
#' # library(tmap)
#' # qtm(world_coffee, "y17", fill.title = "Thousand 60kg bags")
#' # tmap_mode("view") # for an interactive version
#' }
"coffee_data"
