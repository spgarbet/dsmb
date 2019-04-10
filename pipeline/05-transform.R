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

  ###########################################################################
 ##
## Continue the PIPELINE
source("pipeline/06-save.R")