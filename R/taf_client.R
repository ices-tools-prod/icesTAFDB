
# webservice utilities

#' @importFrom icesConnect ices_get_jwt
api_url <- function(dev = FALSE) {
  if (dev) {
    "https://localhost:7172"
  } else {
    "https://adminweb06.ices.dk/api"
  }
}

#' @importFrom httr parse_url build_url
api <- function(service, dev = TRUE, ...) {
  url <- paste0(api_url(dev = dev), "/", service)
  url <- parse_url(url)
  url$query <- list(...)
  url <- build_url(url)
  url
}

#' @importFrom icesConnect ices_token
get <- function(service, use_token = TRUE, verbose = TRUE, quiet = FALSE, dev = TRUE) {
  ices_get_jwt(
    api(service, dev = dev),
    jwt = if (use_token) ices_token() else "",
    verbose = verbose,
    quiet = quiet
  )
}
