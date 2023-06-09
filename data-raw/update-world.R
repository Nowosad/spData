# Aim: update 'world' object

# Load libraries
library(mapedit)
world = spData::world
names(world)

# Test 1: Edit all of the features (too slow)
world2 = mapedit::editFeatures(world)

# Test 2: Edit only Ukraine and Russia's features
ukr = world |>
  subset(grepl("Ukraine|Russia", name_long)) 
ukr2 = mapedit::editFeatures(ukr)
# Plot just Ukraine:
ukr2 |>
  subset(name_long == "Ukraine") |>
  plot()

# Update geometry of Ukraine in world object:
world$geometry[world$name_long == "Ukraine"] = ukr2$geometry[ukr2$name_long == "Ukraine"]

# Update geometry of Russia in world object:
russia = ukr2 |>
  subset(grepl("Russia", name_long))
# Fails to edit sub-components of Russia:
russia2 = mapedit::editFeatures(russia)
