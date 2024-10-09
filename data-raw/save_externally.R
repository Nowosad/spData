library(purrr)
rda2list = function(file) {
        e = new.env()
        load(file, envir = e)
        li = list(as.list(e))
        names(li) = tools::file_path_sans_ext(basename(file))
        return(li)
}

single_saver = function(x, filepath){
        print(filepath)
        if (inherits(x, "sf")){
                sf::write_sf(x, paste0(filepath, ".gpkg"))
        } else if (inherits(x, "sp")) {
                sf::write_sf(st_as_sf(x), paste0(filepath, ".gpkg"))
        } else if (inherits(x, "data.frame") || inherits(x, "matrix") || inherits(x, "numeric")) {
                write.csv(x, paste0(filepath, ".csv"), row.names = FALSE)
        } else if (inherits(x, "nb") && !inherits(x, "listw")){
                spdep::write.nb.gal(x, paste0(filepath, ".gal"))
        }
        #         
        # } else if (inherits(x, "matrix"))
}

saver = function(x, outdir){
        for (i in seq_along(x)){
                name = names(x)[i]
                switch_name = switch (name,
                        "aggregating_zones_aggregating_zones" = "aggregating_zones",
                        "coffee_data_coffee_data" = "coffee_data",
                        "cycle_hire_osm_cycle_hire_osm" = "cycle_hire_osm",
                        "cycle_hire_cycle_hire" = "cycle_hire",
                        "nc.sids_nc.sids" = "nc.sids",
                        "nz_height_nz_height" = "nz_height",
                        "urban_agglomerations_urban_agglomerations" = "urban_agglomerations",
                        "us_states_df_us_states_df" = "us_states_df",
                        "us_states_us_states" = "us_states",
                        "used.cars_used.cars" = "used.cars",
                        "worldbank_df_worldbank_df" = "worldbank_df"
                )
                if (!is.null(switch_name)) name = switch_name
                name_parts = strsplit(name, "[_\\.]")[[1]]
                if (length(name_parts) > 1 && name_parts[1] == name_parts[2]) {
                        name = paste0(name_parts[1], "", tools::file_ext(name))
                }
                single_saver(x[[i]], paste0(outdir, "/", name))
        }
}

dir.create("../spData_files/data", showWarnings = FALSE)
dir("data", full.names = TRUE) |>
        lapply(rda2list) |>
        lapply(list_flatten, name_repair = "minimal") |>
        list_flatten() |>
        saver("../spData_files/data")

ext_files = c(
        dir("inst/misc", full.names = TRUE),
        dir("inst/raster", full.names = TRUE),
        dir("inst/weights", full.names = TRUE),
        dir("inst/shapes", full.names = TRUE, pattern = "*.(gpkg|geojson)")
)

file.copy(ext_files, "../spData_files/data/", overwrite = FALSE)
