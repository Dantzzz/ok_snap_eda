#####################################
### File:        03_data_cleaning.R
### Author:      Dantz Farrow
### Description: Clean and prepare SNAP enrollment data for analysis, 
###              including data type conversions and preliminary investigation.
### Date:        2026-03-28 
#####################################

### Load
df <- read.csv("data/snap_enrollment_oklahoma.csv")

### Review
paste0(min(df$Date), " - ", max(df$Date)) # Jan12 - Jan19
colnames(df)
class(df$Date)
class(df$FIPS)

### Transform data types
df_clean <- df # copy original for cleaning
df_clean$Date <- as.Date(df_clean$Date, format = "%Y-%m-%d") # Convert Date to Date
class(df_clean$Date) # Verify Date type

df_clean$FIPS <- as.character(df_clean$FIPS) # Convert FIPS to char
class(df_clean$FIPS) # Verify char type 

### Investigate SubCounty == 2
chk_subcounty <- df_clean[df_clean$SubCounty == 2, ]
nrow(df_clean[df_clean$FIPS == '40109' & df_clean$SubCounty != 2, ]) # all OK County (FIPS 40109) have SubCounty == 2

### Investigate SNAP_All_Issuance == 0
chk_all_issuance <- df_clean[df_clean$SNAP_All_Issuance == 0, ]
unique(chk_all_issuance$FIPS) # 13 distinct FIPS with zero issuance
paste0("Date Range: ", min(chk_all_issuance$Date), " to ", max(chk_all_issuance$Date)) # show date range

### Preliminary Questions:
##  - 15 time periods across 7 years (plus Jan2019); 1155 observations doesn't add up.
##  - For BigQuery: Is Oklahoma anomalous vis-a-vis Program == 'EBT'?

source("scripts/03b_data_tidy.R") # Tidy Date and GeoDesc cols

### Export cleaned dataset
write.csv(df_clean, "data/snap_enrollment_oklahoma_clean.csv", row.names = FALSE)

rm(df, df_clean, chk_subcounty, chk_all_issuance) # Clean up environment)