  ###########################################################################
 ##
##  Load the Transformed Data
## 
##    This script loads the transformed data into memory. It uses the configured
##  pipeline/current-timestamp.txt to determine which directory to load
##
##    If the design of the pipeline is respected, this script should not
##  require editing.
## 
#############################################################################

  ###########################################################################
 ##
##  Load the current timestamp and find current data directory
CURRENT <- readLines("pipeline/current-timestamp.txt", n=1)
dir     <- paste0("data/",CURRENT)
  
  ###########################################################################
 ##
##  Load the final files into memory
for(file in grep("^(?!raw-).*", list.files(dir), perl=TRUE, value=TRUE)) load(paste0(dir,"/",file))

  ###########################################################################
 ##
## DATA PIPELINE COMPLETE!