.pkgenv <- new.env(parent=emptyenv())

.onLoad  <- function(libname, pkgname) {
        has_data <- requireNamespace("spDataLarge", quietly = TRUE)
        .pkgenv[["has_data"]] <- has_data
}

.onAttach <- function(libname, pkgname) {
        if (!.pkgenv$has_data) {
                msg <- paste("To use this package, you must install the",
                             "spDataLarge package. To install that ",
                             "package, run `install.packages('spDataLarge',",
                             "repos='https://nowosad.github.io/drat/', type='source')`.")
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