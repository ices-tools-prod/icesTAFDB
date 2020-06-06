
# webservice utilities

taf_webservice <- function(service, ..., verbose = TRUE, username = NULL) {

  # form uri of webservice
  uri <- taf_uri(service, ...)

  # preform request
  taf_get(uri, verbose = verbose, username = username)
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


# http requests
taf_get <- function(uri, verbose = FALSE, username = NULL) {
  taf_request(type = "GET", uri = uri, verbose = verbose, username = username)
}

taf_post <- function(uri, body = list(), verbose = TRUE, username = NULL) {
  taf_request(type = "POST", uri = uri, body = body, verbose = verbose, username = username)
}

taf_patch <- function(uri, body = list(), verbose = TRUE, username = NULL) {
  taf_request(type = "PATCH", uri = uri, body = body, verbose = verbose, username = username)
}

taf_request <- function(type = c("GET", "POST", "PATCH"),
                        uri,
                        body = NULL,
                        verbose = TRUE,
                        username = NULL) {

  type <- match.arg(type)

  if (getOption("icesTAFWeb.messages")) {
    message(paste0(type, "ing ... ", uri))
  }

  # set up args
  args <-
    list(
      uri,
      body = body,
      encode = "json", # only needed when body present
      taf_auth(username)
    )
  if (verbose) {
    args <- c(args, list(httr::verbose(info = TRUE)))
  }

  # read url contents
  if (type == "GET") {
    resp <- do.call(httr::GET, args)
  } else if (type == "POST") {
    resp <- do.call(httr::POST, args)
  } else if (type == "PATCH") {
    resp <- do.call(httr::PATCH, args)
  }

  # check return code
  httr::stop_for_status(resp)

  # return as list
  httr::content(resp)

}


# authorisation

taf_auth <- function(username = NULL) {
  if (is.null(username)) {
    username <- getOption("icesTAFWeb.username")
    if (is.null(username)) {
      ## message to user about adding username to options
      icesTAF::msg("Consider adding a default username using:\n\t\toptions(icesTAFWeb.username = <add username here>)")
    } else {
      icesTAF::msg("using default username:", username)
    }
  }
  # NULL means use no authentication
  if (is.null(username)) {
    return(NULL)
  }

  # try get stored token
  token <- try(
    keyring::key_get(
      service = "ices",
      username = username
    ),
    silent = TRUE
  )

  # check for expiry?

  # if (expired or) not there then fetch a new token
  if (inherits(token, "try-error")) {
    jwt <- getToken(username)
    keyring::key_set_with_value(
      service = "ices",
      username = username,
      password = jwt$token
    )
    token <- keyring::key_get("ices", username)
  }

  httr::authenticate("", token)
}


ices_pass <- function(msg = "Password: ") {
  res <- getPass::getPass(msg = msg)
  # try once more if null response from user
  if (is.null(res)) {
    res <- getPass::getPass(msg = msg)
  }
  res
}
