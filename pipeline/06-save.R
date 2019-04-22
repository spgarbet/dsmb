  ###########################################################################
 ##
##  Save the data to disk.
## 
##    All transformed data is saved at this step.
## 
#############################################################################
  
  ###########################################################################
 ##
##  Load the current timestamp and goto current data directory
CURRENT <- readLines("pipeline/current-timestamp.txt", n=1)
dir     <- paste0("data/",CURRENT)
origin  <- getwd() # remember working directory
setwd(dir)

  ###########################################################################
 ##
##  Save Data locally here

save(demographics, file="demographics.RData")

setwd(origin) # return to original working directory

  ###########################################################################
 ##
## Continue the PIPELINE
source("pipeline/07-load.R")