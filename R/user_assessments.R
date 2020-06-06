# get user analyses
user_assessments <- function() {
  taf_webservice("user/assessments")
}

# get user expert groups
user_expertgroups <- function() {
  taf_webservice("user/expertgroups")
}
