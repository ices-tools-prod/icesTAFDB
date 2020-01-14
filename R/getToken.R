#' get user token via query login
#'
#' @param username the ices login name of the user
#'
#' @return a named list contianing the j web token and the expiration date
#' @export
#' @examples
#' \dontrun{
#' jwt <- getToken("colin")
#' jwt
#' }
#' @importFrom askpass askpass
getToken <- function(username) {
  # get user password
  password <- askpass::askpass(msg = paste0("ICES password for ", username, ":"))

  # buld body and uri
  body <- list(username = username, password = password)
  uri <- taf_uri("auth/getToken")

  # request token - force verbose = FALSE to hide paylad
  taf_post(uri, body = body, verbose = FALSE)
}

