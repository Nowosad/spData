set.seed(2017-12-16)
library(terra)
elev = rast(nrow = 6, ncol = 6, res = 0.5, 
              xmin = -1.5, xmax = 1.5, ymin = -1.5, ymax = 1.5,
              vals = 1:36)
names(elev) = "elev"

grain_size = c("clay", "silt", "sand")
grain = rast(nrow = 6, ncol = 6, res = 0.5, 
               xmin = -1.5, xmax = 1.5, ymin = -1.5, ymax = 1.5,
               vals = factor(sample(grain_size, 36, replace = TRUE), 
                             levels = grain_size))
names(grain) = "grain"

writeRaster(elev, "inst/raster/elev.tif")
writeRaster(grain, "inst/raster/grain.tif")
