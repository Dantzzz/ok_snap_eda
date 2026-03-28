#####################################
### File:   03_data_cleaning.R
### Author: Dantz Farrow
### Date:   2026-03-28 
#####################################

### Load
df <- read.csv("data/snap_enrollment_oklahoma.csv")

### Review
colnames(df)
class(df$Date)
class(df$FIPS)

### Clean data types
df$Date <- as.Date(df$Date, format = "%Y-%m-%d") # Convert Date to Date
class(df_clean$Date) # Verify Date type

df$FIPS <- as.character(df$FIPS) # Convert FIPS to char
class(df_clean$FIPS) # Verify char type 

### Investigate SubCounty == 2
chk_subcounty <- df_clean[df_clean$SubCounty == 2, ]
nrow(df_clean[df_clean$FIPS == '40109' & df_clean$SubCounty != 2, ]) # all FIPS 40109 have SubCounty == 2

### Investigate SNAP_All_Issuance == 0
chk_all_issuance <- df_clean[df_clean$SNAP_All_Issuance == 0, ]
unique(chk_all_issuance$FIPS) # 13 distinct FIPS with zero issuance
paste0("Date Range: ", min(chk_all_issuance$Date), " to ", max(chk_all_issuance$Date)) # show date range
