

.onLoad <- function(libname, pkgname) {
  # set some default TAF options
  opts <-
    c(icesTAFweb.messages = "TRUE",
      #icesTAFweb.hostname = "'taf.ices.local/TAFtest'")
      icesTAFweb.hostname = "'localhost:1234'")

  for (i in setdiff(names(opts), names(options()))) {
        eval(parse(text = paste0("options(", i, "=", opts[i], ")")))
  }

  invisible()
}
