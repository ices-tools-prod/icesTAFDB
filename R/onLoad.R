

.onLoad <- function(libname, pkgname) {
  # set some default TAF options
  opts <-
    c(icesTAFWeb.messages = "TRUE",
      icesTAFWeb.hostname = "'taf.ices.dk'",
      icesTAFWeb.scheme = "'https'")

  for (i in setdiff(names(opts), names(options()))) {
        eval(parse(text = paste0("options(", i, "=", opts[i], ")")))
  }

  invisible()
}
