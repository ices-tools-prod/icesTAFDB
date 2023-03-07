

.onLoad <- function(libname, pkgname) {
  # set some default TAF options
  opts <-
    c(icesTAFDB.messages = "TRUE",
      icesTAFDB.hostname = "'taf.ices.dk'",
      icesTAFDB.scheme = "'https'")

  for (i in setdiff(names(opts), names(options()))) {
        eval(parse(text = paste0("options(", i, "=", opts[i], ")")))
  }

  invisible()
}
