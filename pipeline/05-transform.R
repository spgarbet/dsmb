  ###########################################################################
 ##
##  Transform raw data into a useable form for reporting
## 
##    This is the heart of the data operation. It takes the scattered, 
##  covered, smothered format of the raw data and transforms it into a
##  very easily used form for reporting purposes. The end result
##  should be fully cleaned and in the desired format.
##
##    This script expects the raw patched data in memory. It should usually
##  be started from pipeline/03-load-raw.R instead of running directly. To
##  test reproducibility and eliminate any in memory effects of development
##  of this pipeline.
## 
#############################################################################
  
# DO WORK HERE
  
library(dplyr)
demographics <- transmute(DEM,
  id       = PATID,
  site     = SITE,
  age      = DEBRTHDT,
  gender   = recode_factor(DEGENDER, `1`="Male", `2`="Female"),
  married  = recode_factor(DEMARTL,  `1`="Married",
                              `2`="Remarried",
                              `3`="Widowed",
                              `4`="Separated",
                              `5`="Divorced",
                              `6`="Never married", 
                              .default = NA_character_),
  hispanic = recode_factor(DEHISPNC, `0`="No", `1`="Yes", .missing="No"),
  white    = recode_factor(DEWHITE,  `0`="No", `1`="Yes", .missing="No"),
  black    = recode_factor(DEBLACK,  `0`="No", `1`="Yes", .missing="No"),
  native   = ifelse(!is.na(DEAMEIND) | !is.na(DEALASKA), "Yes", "No"),
  pacific  = ifelse(!is.na(DEHAWAII) | !is.na(DEGUAM)  |
                    !is.na(DESAMOAN) | !is.na(DEPACISL),
                    "Yes", "No"),
  asian    = ifelse(!is.na(DEASAIND) | 
                    !is.na(DECHINA) | !is.na(DEFILIPN) | !is.na(DEJAPAN) |
                    !is.na(DEKOREA) | !is.na(DEVIETNM) | !is.na(DEASIAN),
                    "Yes", "No"),
  other    = recode_factor(DERACEOT, `0`="No", `1`="Yes", .missing="No"),
  race_unknown = recode_factor(DERACEDK, `0`="No", `1`="Yes", .missing="No"),
  race_refused = recode_factor(DERACERF, `0`="No", `1`="Yes", .missing="No"),
  education = ifelse(DEEDUCTN==99, NA, DEEDUCTN),
  employment_status = recode_factor(DEJOB, `1`="Employment without Supports",
                                    `2`="Extended Employment",
                                    `3`="Self-employment",
                                    `4`="Business Enterprise Program",
                                    `5`="Homemaker",
                                    `6`="Unpaided Family Worker",
                                    `7`="Employment with Supports",
                                    `8`="Not employed: Student Secondary Ed",
                                    `9`="Not employed: Other Student",
                                    `10`="Not employed: Trainee, Intern or Volunteer",
                                    `11`="Not employed: Other",
                                    .default = NA_character_)
                                   
) %>% left_join(transmute(ENROLL, id=PATID,randomization=TRTSHOWN), by="id")

attr(demographics$age,               "label") <- "Age at Enrollement"
attr(demographics$gender,            "label") <- "Gender"
attr(demographics$married,           "label") <- "Marital Status"
attr(demographics$hispanic,          "label") <- "Hispanic"
attr(demographics$white,             "label") <- "White"
attr(demographics$black,             "label") <- "Black"
attr(demographics$native,            "label") <- "Native American"
attr(demographics$pacific,           "label") <- "Pacific Islander"
attr(demographics$asian,             "label") <- "Asian"
attr(demographics$other,             "label") <- "Other Race"
attr(demographics$race_unknown,      "label") <- "Race Unknown"
attr(demographics$race_refused,      "label") <- "Race Refused"
attr(demographics$education,         "label") <- "Education (years)"
attr(demographics$employment_status, "label") <- "Employment Status"


  ###########################################################################
 ##
## Continue the PIPELINE
source("pipeline/06-save.R")