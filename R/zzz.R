.pkgenv <- new.env(parent = emptyenv())

.onLoad  <- function(libname, pkgname) {
        has_data <- requireNamespace("spDataLarge", quietly = TRUE)
        .pkgenv[["has_data"]] <- has_data
        # repos = getOption("repos")
        # repos["nowosaddrat"] = "https://nowosad.github.io/drat/"
        # options(repos = repos)
        # invisible(repos)
}

.onAttach <- function(libname, pkgname) {
        if (!.pkgenv$has_data) {
                msg <- paste("To access larger datasets in this package, install the",
                             "spDataLarge package with:\n",
                             "`install.packages('spDataLarge',", 
                             "repos='https://nowosad.github.io/drat/', type='source')`")
                msg <- paste(strwrap(msg), collapse="\n")
                packageStartupMessage(msg)
        }
}

hasData <- function(has_data = .pkgenv$has_data) {
        if (!has_data) {
                msg <- paste("To use this function, you must have the",
                             "`spDataLarge` package installed.")
                msg <- paste(strwrap(msg), collapse="\n")
                stop(msg)
        }
}