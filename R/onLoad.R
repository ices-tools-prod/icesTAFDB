

.options.setup <- function(local = FALSE) {
  if (local) {
    options(icesTAFWeb.scheme = "http")
    options(icesTAFWeb.hostname = "localhost:5012")
  } else {
    options(icesTAFWeb.scheme = "https")
    options(icesTAFWeb.hostname = "taf.ices.dk/api")
  }
}

.onLoad <- function(libname, pkgname) {
  # set some default TAF options
  .options.setup(local = FALSE)

  invisible()
}
