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
#' @importFrom getPass getPass
getToken <- function(username) {
  # get user password
  password <- getPass::getPass(msg = paste0("ICES password for ", username, ":"))
  x <- taf_webservice("getToken",
                      username = username,
                      password = password)

  x
}

