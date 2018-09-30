# get user analyses
user_assessments <- function(jwt) {
  taf_webservice("user/assessments", jwt = jwt)
}
