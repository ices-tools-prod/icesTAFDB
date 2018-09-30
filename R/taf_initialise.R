
# initialise a stock assessment
taf_initialise <- function(StockKeyLabel, ActiveYear, path = NULL, jwt) {

  if (!is.null(path)) {
    # create a repo object
    files <- dir(path, pattern = "*.R")

    body <-
      list(
        Files =
          lapply(files, function(x) {
            txt <- readLines(file.path(path, x))
            txt <- paste(txt, collapse = "\r\n")
            txt <- openssl::base64_encode(txt)

            list(Name = x, Contents = txt)
          }))
  }

  taf_post(taf_uri(paste0("jwt/assessments/", ActiveYear, "/", StockKeyLabel)),
           body = body,
           jwt = jwt)
}
