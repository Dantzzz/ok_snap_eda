#####################################
### File: 01_data_acquisition.R
### Author: Dantz Farrow
### Date: 2026-03-27 
#####################################

### Set up environment and load libraries
library(DBI)
library(bigrquery)

### Set up connection to BigQuery
conn <- dbConnect(
  drv = bigquery(),
  project = "bigquery-public-data",
  dataset = "sdoh_snap_enrollment",
  billing = "dbeaver-test-project"
)

### Query to retrieve SNAP enrollment data
query <- dbGetQuery(conn, "
                    SELECT *
                    FROM `bigquery-public-data.sdoh_snap_enrollment.snap_enrollment`
                    WHERE FIPS LIKE '40%';
                    ")
### Save output as CSV
write.csv(query, "data/snap_enrollment_oklahoma.csv", row.names = FALSE)