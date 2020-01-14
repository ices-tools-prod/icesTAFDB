# webservice utilities

taf_uri <- function(service, ...) {
  # set up api url
  query <- list(...)

  # return url
  httr::modify_url("",
                   scheme = getOption("icesTAFWeb.scheme"),
                   hostname = getOption("icesTAFWeb.hostname"),
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



taf_post <- function(uri, body = list(), jwt = NULL, verbose = TRUE) {
  if (getOption("icesTAFweb.messages"))
    message("POSTing ... ", uri)

  # set up args
  args <-
    list(uri,
         body = body,
         encode = "json")
  if (!is.null(jwt))
    args <- c(args, list(httr::add_headers(Authorization = paste("Bearer", jwt$token))))
  if (verbose)
    args <- c(args, list(httr::verbose()))

  # read url contents
  resp <- do.call(httr::POST, args)

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

