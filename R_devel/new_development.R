makeMetaDataBody <- function(code_type, key, json = FALSE) {
  body <-
    getCodeList(code_type) %>%
    filter(Key == key) %>%
    rename(
      icesVocabId = GUID,
      name = Key,
      description = Description
    ) %>%
    mutate(
      codeType = code_type
    ) %>%
    select(
      icesVocabId, codeType, name, description
    ) %>%
    as.list()

  if (json) {
    jsonlite::toJSON(body, auto_unbox = TRUE)
  } else {
    body
  }
}

#' @importFrom icesConnect ices_post_jwt
postMetaData <- function(code_type, key, dev = FALSE) {
  ices_post_jwt(
    api("runMetaData", dev = dev),
    body = makeMetaDataBody(code_type, key),
    verbose = FALSE
  )
}
