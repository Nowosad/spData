# install.packages("wbstats")
# devtools::install_github("ropenscilabs/rnaturalearth")
library(wbstats)
library(rnaturalearth)
library(dplyr)
library(tidyr)
library(sf)

# query_lifeexp = wbsearch(pattern = "life expectancy")
# query_gdp = wbsearch("GDP")

wb_data_create = function(indicator, our_name, year, ...){
        df = wb(indicator = indicator, startdate = year, enddate = year, ...) %>%
                as_data_frame() %>%
                select(iso_a2=iso2c, value) %>%
                mutate(indicator = our_name) %>%
                spread(indicator, value)
        return(df)
}

## IMPORTANT - repeat if a server is down

data_pop = wb_data_create(indicator = "SP.POP.TOTL", our_name = "pop",
                          year = 2014, country = "countries_only")
data_lifeexp = wb_data_create(indicator = "SP.DYN.LE00.IN", our_name = "lifeExp",
                              year = 2014, country = "countries_only")
data_gdp = wb_data_create("NY.GDP.PCAP.PP.KD", our_name = "gdpPercap",
                          year = 2014, country = "countries_only")

world = ne_countries(returnclass = "sf") %>%
        left_join(., data_pop, by = c("iso_a2")) %>%
        left_join(., data_lifeexp, by = c("iso_a2")) %>%
        left_join(., data_gdp, by = c("iso_a2")) %>%
        mutate(area_km2 = raster::area(as(., "Spatial")) / 1000000) %>%
        select(iso_a2, name_long, continent, region_un, subregion,
               type, area_km2, pop, lifeExp, gdpPercap)

usethis::use_data(world)
