# dsmb

Reproducible Clinical Trial Data and Safety Monitoring Board (DSMB) Reporting with R and tangram

This project is a best practices template for constructing a complex reporting task, in this case a DSMB report. The data pipeline is carefully constructed to be restartable from any point, and it creates a clear separation of concerns. Spreading the data pipeline code throughout a report is bad practice and generally results in copy and paste errors and tables that don't agree. By utilizing this data pipeline strategy and making a small investment in structuring your project, one can save a lot of frustration and effort in the bigger scope of the project. 

## Project Directories

* `data/YYYYMMDD-HHMM` contains all data from a given date (raw and transformed).
* `pipeline` contains data pipeline processing code. This pipeline is restartable from any script in the chain. It continues execution till the end of the chain by design.

## Project files

* `dsmb-open-example.Rmd` is the example Rmarkdown for an open report.
* `dsmb-closed-example.Rmd` is the example Rmarkdown for a closed report.
* `dsmb-report.template` is the main LaTeX shell for the report.
* `pipeline/01-extract.R` Extract raw data script.
* `pipeline/02-save-raw.R` Save the raw data asis for reproducibility.
* `pipeline/03-load-raw.R` Load the raw data into memory.
* `pipeline/04-patch.R` Apply any necessary raw data patches.
* `pipeline/05-transform.R` Transform the raw data into something easily used in reporting.
* `pipeline/06-save.R` Save the transformed data in a useful format.
* `pipeline/07-load.R` Load the transformed data into memory. This is the only script required to compile a report if the pipeline is complete.
* `pipeline/current-timestamp.txt` The timestamp of which directory to use in the `data` directory for working with data. This is overwritten by `02-save-raw.R` when a new extraction is done.