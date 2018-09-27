# webservice utilities

taf_uri <- function(service, ...) {
  # set up api url
  query <- list(...)
  scheme <- "http"

  # return url
  httr::modify_url("",
                   scheme = scheme,
                   hostname = getOption("icesTAFweb.hostname"),
                   path = service,
                   query = if (length(query) == 0) NULL else query)
}


taf_webservice <- function(service, jwt = NULL, ...) {

  # form uri of webservice
  uri <- taf_uri(service, ...)

  # preform request
  taf_get(uri, jwt)
}


taf_get <- function(uri, jwt = NULL) {
  if (getOption("icesTAFweb.messages"))
    message("GETing ... ", uri)

  # read url contents
  resp <-
    if (is.null(jwt)) {
      httr::GET(uri, httr::verbose())
    } else {
      httr::GET(uri,
                httr::add_headers(Authorization = paste("Bearer", jwt$token)),
                httr::verbose())
    }

  # check return code
  httr::stop_for_status(resp)

  # return as list
  httr::content(resp)
}



taf_post <- function(uri, body = list(), jwt = NULL) {
  if (getOption("icesTAFweb.messages"))
    message("GETing ... ", uri)

  # read url contents
  resp <-
    if (is.null(jwt)) {
      httr::POST(uri,
                 body = body,
                 encode = "json",
                 httr::verbose())
    } else {
      httr::POST(uri,
                 body = body,
                 encode = "json",
                 httr::add_headers(Authorization = paste("Bearer", jwt$token)),
                 httr::verbose())
    }

  # return as list
  httr::content(resp)
}













taf_get2 <- function(uri) {
  if (getOption("icesTAF.messages"))
    message("GETing ... ", uri)

  # read url contents
  resp <- try(httr::GET(uri))

  # if this errored then there is probably no internet connection
  if (inherits(resp, "try-error")) {
    warning("Attempt to access webservice failed:\n", attr(resp, "condition"))
    return(NULL)
  } else
  # check server is not down by inspecting response for internal server error message
  if (httr::http_error(resp)) {
    warning(#"Web service failure: the server is not accessible, please try again later.\n",
            "http status message: ", httr::http_status(resp)$message, call. = FALSE)
  }

  # return as list
  httr::content(resp)
}
