  ###########################################################################
 ##
##  Save the Raw Data
## 
##    For reference purposes the raw data used for a report should be
##  preserved as is. This is also very useful for saving time by not
##  loading the raw data from it's source repeatedly (especially given
##  that the source may be changing and accruing further data).
##
##    Data filenames should start with "raw-". 
## 
##    This triggers the loading of the raw data that was just saved. This 
##  may seem superfluous, but is necessary for having a restartable pipeline.
##
##  NOTE: This overwrites the file pipeline/current-timestamp.txt to denote
## what the most recent data to work with in later stages is.
## 
#############################################################################


# Retrieve current timestamp
CURRENT <- format(Sys.time(), "%Y%m%d-%H%M")

# Save the current timestamp of interest
writeLines(CURRENT, "pipeline/current-timestamp.txt")

# Create the directory to save the data into
dir <- paste0("data/", CURRENT)
dir.create(dir)

origin <- getwd() # remember where we came from
setwd(dir)

############################################
# DO WORK HERE -- just save the files
# Your CODE
# VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
############################################
vars <- c("AD1", "AD2", "AD3", "ASD", "ASE", "ASF", "ASG", "ASI", "ASL", 
"ASM", "ASP", "CHP", "D51", "DEM", "DSM", "DXS", "DXU", "EC0051A", 
"EC0051B", "EC0051Z", "ENROLL", "EOM", "ER0051A", "ER0051B", 
"ER0051Z", "FND", "HAM", "INA", "INF", "INJ", "INX", "LAB", "MHX", 
"MMC", "MML", "MMT", "MOT", "MVF", "NMS", "NXC", "NXW", "PBC", 
"PCL", "PDR", "PDV", "PEX", "PO1", "PRG", "QLE", "QLP", "RAB", 
"SOW", "STR", "STT", "T51", "TAP", "TRL", "TUH", "TXS", "UDS", 
"VAS", "VIS", "VNS", "XRP")

for(i in vars) save(list=i, file=paste0("raw-", i,".RData"))

############################################
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# End Your CODE
############################################


setwd(origin) # return to working directory

  ###########################################################################
 ##
## Continue the PIPELINE
source("pipeline/03-load-raw.R")