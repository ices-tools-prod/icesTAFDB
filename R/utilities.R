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
    message("POSTing ... ", uri)

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





taf_patch <- function(uri, body = list(), jwt = NULL) {
  if (getOption("icesTAFweb.messages"))
    message("PATCHing ... ", uri)

  # read url contents
  resp <-
    if (is.null(jwt)) {
      httr::PATCH(uri,
                  body = body,
                  encode = "json",
                  httr::verbose())
    } else {
      httr::PATCH(uri,
                  body = body,
                  encode = "json",
                  httr::add_headers(Authorization = paste("Bearer", jwt$token)),
                  httr::verbose())
    }

  # return as list
  httr::content(resp)
}

