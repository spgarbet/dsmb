  ###########################################################################
 ##
##  Load the Raw Data
## 
##    This script loads the raw data into memory. It uses the configured
##  pipeline/current-timestamp.txt to determine which directory to load
## 
#############################################################################

# Load the current timestamp and derive directory
CURRENT <- readLines("pipeline/current-timestamp.txt", n=1)
dir     <- paste0("data/",CURRENT)
  
# Load the files
for(file in list.files(dir, "raw-.*\\.RData")) load(paste0(dir,"/",file))

  ###########################################################################
 ##
## Continue the PIPELINE
source("pipeline/04-patch.R")