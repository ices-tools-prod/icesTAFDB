#' Show user information
#'
#' Return a list of information for the logged in user
#'
#' @param use_token should a user token be checked
#' @param verbose should verbose output be shown
#' @param quiet minimal output to user or none
#' @param dev should the development webservce be called
#'
#' @export
test <- function(use_token = TRUE, verbose = FALSE, quiet = FALSE, dev = FALSE) {
  out <- get("whoami", use_token = use_token, verbose = verbose, quiet = quiet, dev = dev)
  content(out, simplifyVector = TRUE)
}
