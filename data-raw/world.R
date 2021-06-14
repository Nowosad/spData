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

# fix world (post sf 1.0.0)
library(sf)
library(s2)
library(giscoR)
data("world", package = "spData")
sf_use_s2(FALSE)

bb = st_bbox(giscoR::gisco_get_countries())
world2 = st_intersection(world, st_as_sfc(bb))

sf_use_s2(TRUE)
world2$geom = s2::as_s2_geography(world2$geom, check = FALSE)
world2$geom = s2::s2_union(world2$geom)
world2$geom = s2::s2_rebuild(world2$geom, s2::s2_options(split_crossing_edges = TRUE))
world2$geom = st_as_sfc(world2$geom)

# isv = sf::st_is_valid(world2)
# world2$name_long[!isv]
world = world2
usethis::use_data(world, overwrite = TRUE)
write_sf(world, "inst/shapes/world.gpkg")
write_sf(world, "inst/shapes/world.shp")
