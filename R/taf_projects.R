#' List all available TAF projects
#'
#' List all TAF projects and related information that is available
#' to the requesting user.  All requests are sent with a token so
#' that the web service can identify which projects are visible.
#'
#' @export
taf_projects <- function() {
  out <- taf_webservice("project")

  httr::content(out, simplifyVector = TRUE)
}
