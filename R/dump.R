#' Get a list of possible meta data tags
#'
#' List all meta data tags available to annotate a repository or data object
#'
#' @param dev should the development webservce be called
#'
#' @export
getMetaData <- function(dev = FALSE) {
  out <- get("runMetaData", dev = dev, verbose = FALSE, quiet = TRUE)
  content(out, simplifyVector = TRUE)
}

#' Title
#'
#' sub title
#'
#' @param dev should the development webservce be called
#'
#' @export
#' @importFrom httr content
getRepositories <- function(dev = FALSE) {
  out <- get("repositories", dev = dev, verbose = FALSE, quiet = TRUE)
  content(out, simplifyVector = TRUE)
}

#' Title
#'
#' sub title
#'
#' @param dev should the development webservce be called
#'
#' @export
#' @importFrom httr content
getRepositoryAccess <- function(dev = FALSE) {
  out <- get("repositoryaccess", dev = dev, verbose = FALSE, quiet = TRUE)
  content(out, simplifyVector = TRUE)
}


#' @importFrom glue glue
#' @importFrom icesConnect ices_post_jwt
postRepositories <- function(name, org, dev = FALSE) {
  ices_post_jwt(
    api("repositories", dev = dev),
    body = list(name = name, org = org, url = glue("https://github.com/{org}/{name}")),
    verbose = FALSE
  )
}
