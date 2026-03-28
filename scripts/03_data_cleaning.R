#####################################
### File:   03_data_cleaning.R
### Author: Dantz Farrow
### Date:   2026-03-28 
#####################################

### Load
library(dplyr)
df <- read.csv("data/snap_enrollment_oklahoma.csv")

### Review
colnames(df)
class(df$Date)
class(df$FIPS)

### Clean
df_clean <- df %>%
  mutate(
    Date = as.Date(Date, format = "%Y-%m-%d"),
         FIPS = as.character(FIPS)
    )
### Verification
class(df_clean$Date)
class(df_clean$FIPS)