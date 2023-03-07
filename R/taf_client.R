
# webservice utilities

#' @importFrom icesConnect ices_get_jwt
taf_webservice <- function(service, ...,
                          username = NULL,
                          quiet = FALSE,
                          verbose = FALSE) {

  # form uri of webservice
  uri <- taf_uri(service, ...)

  # preform request
  icesConnect::ices_get_jwt(
    uri,
    username = username,
    retry = FALSE,
    quiet = quiet,
    verbose = verbose
  )
}

taf_uri <- function(service, ...) {
  # set up api url
  query <- list(...)

  # return url
  httr::modify_url(
    "",
    scheme = getOption("icesTAFWeb.scheme"),
    hostname = getOption("icesTAFWeb.hostname"),
    path = service,
    query = if (length(query) == 0) NULL else query
  )
}
