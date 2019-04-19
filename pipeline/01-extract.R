  ###########################################################################
 ##
##  Extract the raw data from its source location.
## 
##    Sometimes this extraction can be complicated. Sometimes not, but the
##  cohesive purpose of this script is extraction only.
##  
##    This is also the first link of the data processing pipeline. As such
##  it automatically triggers the next step of the pipeline 02-save-raw.R.
##  Each stage triggers the next, so one can restart the pipeline from
##  any of the positions and expect all the downstream tasks to achieve
##  their purposes. E.g., one is debugging the transform stage, one could
##  make changes to the transform script and just run "03-load-raw.R" and
##  the pipeline would start with loading the raw data, patching and then
##  applying the transforms. (https://www.youtube.com/watch?v=NkQ58I53mjk)
##
##    NOTE: **NEVER** put API keys in this file 
##  They should be loaded from a file that is not part of this project 
##  directory. Something in one's home directory is better.
##  These files typically get committed to source
##  control and shared with collaborators. An API key *is* a 
##  password into a controlled data source. If the API key
##  is written into this file in any way the risk of it leaking
##  outside of control is very high. Don't be that guy.
## 
#############################################################################
  
  ###########################################################################
 ##
## Extraction Code
  
# This is where your extraction from RedCap or other source would go
# Important: NO API KEYS in this code.
# 
# This examples is a from a publically available dataset, CPU-0016, on opiod addiction
# treatment.
  
for(file in list.files(path="NIDA-CTN-0051/CSV", pattern="*.csv"))
{
  assign(substring(file, 1, nchar(file)-4), read.csv(paste0("NIDA-CTN-0051/CSV/",file)))
}


  ###########################################################################
 ##
## Continue the PIPELINE
source("pipeline/02-save-raw.R")