#' Show user information
#'
#' Return a list of information for the logged in user
#'
#' @export
taf_user <- function() {
  out <- taf_webservice("user")

  httr::content(out, simplifyVector = TRUE)
}
