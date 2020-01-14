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
  out <- taf_webservice("assessments")

  out <-
    do.call(
      rbind,
      lapply(out,
        function(x) {
          x <- c(x[names(x) != "stockDb"], x$stockDb)
          as.data.frame(x)
        }
      )
    )

  # filter on args here? or in api call?
  out
}
