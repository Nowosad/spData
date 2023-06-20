# Aim: update 'world' object

# Load libraries
library(mapedit)
world = spData::world
names(world)

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


# Test 2: Edit only Ukraine and Russia's features
ukr2 = mapedit::editFeatures(ukr)
# Plot just Ukraine:
ukr2 |>
  subset(name_long == "Ukraine") |>
  plot()

# Update geometry of Ukraine in world object:
world_new = world
world_new$geom[world$name_long == "Ukraine"] = ukr2$geom[ukr2$name_long == "Ukraine"]
waldo::compare(world, world_new)

# Update geometry of Russia in world object:
russia = ukr2 |>
  subset(grepl("Russia", name_long))
# Fails to edit sub-components of Russia:
russia2 = mapedit::editFeatures(russia)

# Cast Russia to POLYGON:
russia3 = russia |>
  sf::st_cast("POLYGON")
crimea_centroid = tmaptools::geocode_OSM("Crimea", as.sf = TRUE) 
crimea_polygon = russia3[crimea_centroid, ]
plot(crimea_polygon)
# Remove Crimea from Russia:
russia4 = russia3[crimea_centroid, , op = sf::st_disjoint]
lengths(sf::st_intersects(russia3, crimea_centroid))
#  [1] 0 0 0 1 0 0 0 0 0 0 0 0 0 0 
# 4th element is Crimea
nrow(russia3) - nrow(russia4)
russia4_union = sf::st_union(russia4)
# Extract Crimea from Russia and plot lines:
plot(russia$geom[[1]][[4]][[1]], type = "l")
# Remove Crimea from Russia:
russia$geom[[1]][[4]] = NULL
mapview::mapview(russia)

# Update geometry of Russia in world object:
world_new$geom[grepl("Russia", world_new$name_long)] = russia$geom
# Check results:
mapview::mapview(world_new)
waldo::compare(world, world_new)
usethis::use_data(world, overwrite = TRUE)

# Test world object
devtools::load_all()
mapview::mapview(world)
