# Aim: update 'world' object

# Load libraries
library(mapedit)
world = spData::world
names(world)
sf::st_geometry_type(world$geom) |> table()

# Test 1: Edit all of the features (too slow)
# world2 = mapedit::editFeatures(world)

ukraine = world |>
  subset(grepl("Ukraine", name_long))

russia = world |>
  subset(grepl("Russia", name_long))

russia_polygons = russia |>
  sf::st_cast("POLYGON")
crimea_centroid = tmaptools::geocode_OSM("Crimea", as.sf = TRUE) 
crimea_polygon = russia_polygons[crimea_centroid, ]
plot(crimea_polygon)

russia_updated = sf::st_difference(russia_polygons, crimea_polygon)
mapview::mapview(russia_updated)
russia_updated_union = sf::st_union(russia_updated)
sf::st_geometry_type(russia_updated_union)

ukraine_updated = sf::st_union(ukraine, crimea_polygon) |>
  sf::st_cast("MULTIPOLYGON")
mapview::mapview(ukraine_updated)
sf::st_geometry_type(ukraine_updated)

sf::st_geometry_type(world$geom) |> table() # All MultiPolygon

world$geom[grepl("Russia", world$name_long)] = russia_updated_union
# Update Ukraine:
world$geom[grepl("Ukraine", world$name_long)] = ukraine_updated$geom
mapview::mapview(world)

waldo::compare(spData::world, world)
usethis::use_data(world, overwrite = TRUE)

# Test world object
devtools::load_all()
mapview::mapview(world)
