  ###########################################################################
 ##
##  Patch the raw data in memory
## 
##    It is an unfortunate reality that raw data can contain mistakes and 
##  issues that are not correctable at the source. Patching the data
##  should not be done lightly, but as a last resort when the upstream
##  source cannot. Document the decision makers and date for each patch
##  with a comment.
##
##    By containing all patches in this file, there is a *single* source
##  of truth about what patches were applied. 
## 
##    The reason it is *highly* preferred to patch raw data is that 
##  all downstream processing will see the same patches. Patching
##  transformed data is poor practice as either the transform was
##  incorrect in some manner--or the upstream data had issues. Patching
##  transformed data leads to differing viewpoints of the same raw data.
##  This creates patches which propagate outward in ones reports and
##  tables and summaries can end up with differing viewpoints. 
## 
#############################################################################
  
# DO WORK HERE

  ###########################################################################
 ##
## Continue the PIPELINE
source("pipeline/05-transform.R")