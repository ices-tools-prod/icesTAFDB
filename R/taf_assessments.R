#' get a list of public taf assessments
#'
#' @param year the year the assessments were conducted
#' @param stock the ices stock code
#' @param type the type of analysis, assessment, forecast,
#'             exploratory, etc.
#' @param what should the function return results, scripts, or a summary,
#'             Default is summary.
#'
#' @return a named list
#' @export
#' @examples
#' \dontrun{
#' assessments <- taf_assessments()
#' jwt
#' }
taf_assessments <- function(year, stock, type, what) {

  # build api call
  if (!missing(stock) && missing(year)) {
    stop("stock can only be supplied if year is supplied.")
  }

  api <- "assessments"
  if (!missing(year)) api <- paste0(api, "/", year)
  if (!missing(stock)) api <- paste0(api, "/", stock)

  out <- taf_webservice(api)

  # if getting one result...
  if (!is.null(names(out))) {
    out <- list(out)
  }

  out <-
    do.call(
      rbind,
      lapply(out,
        function(x) {
          x <- c(x[names(x) != "stockDb"], x$stockDb)
          x[sapply(x, is.null)] <- NA #  !! this implies a bug in the web service
          data.frame(x)
        }
      )
    )

  # filter on args here? or in api call?
  out
}
