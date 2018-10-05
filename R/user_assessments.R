# get user analyses
user_assessments <- function(jwt) {
  taf_webservice("user/assessments", jwt = jwt)
}

# get user expert groups
user_expertgroups <- function(jwt) {
  taf_webservice("user/expertgroups", jwt = jwt)
}
