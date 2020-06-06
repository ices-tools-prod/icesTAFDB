#' Update a TAF stock assessment
#'
#' @param message a commit message for the changes being submitted
#' @param jwt a valid token identifying the user
#' @param path the path to the local repository (default = ".")
#'
#' @return a named list contianing the j web token and the expiration date
#' @export
#' @examples
#' \dontrun{
#' jwt <- getToken("colin")
#' jwt
#' }
#' @importFrom getPass getPass
taf.update <- function(message, path = ".") {
  # create a repo object
  files <- dir(path, pattern = "*.(R|Rmd)$", recursive = TRUE)

  # get repo name from readme
  repoName <-  readChar(file.path(path, "README.md"), nchar = 100)
  repoName <- gsub("# ", "", title)

  body <-
    list(
      Files =
        lapply(files, function(x) {
          txt <- readLines(file.path(path, x))
          txt <- paste(txt, collapse = "\r\n")
          txt <- openssl::base64_encode(txt)

          list(Name = x, Contents = txt)
        }),
      CommitMessage = message)

  taf_patch(taf_uri(paste0("jwt/update/", repoName)),
            body = body)
}
