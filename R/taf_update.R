# update a stock assessment
taf_update <- function(StockKeyLabel, ActiveYear, path, message, jwt) {
  # create a repo object
  files <- dir(path, pattern = "*.R$", recursive = TRUE)

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


  taf_patch(taf_uri(paste0("jwt/assessments/", ActiveYear, "/", StockKeyLabel)),
            body = body,
            jwt = jwt)
}
