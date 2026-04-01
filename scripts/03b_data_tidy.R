#####################################
### File:        03b_data_tidy.R
### Author:      Dantz Farrow
### Description: Sidecar file for 03_data_cleaning; decompose data
###              into smaller units for cleaner analysis.    
### Date:        2026-04-01 
#####################################

library(tidyverse)

### Decompose data from GeoDesc
### GeoDesc contains redundant data; filter down to relevant pieces.
df_clean <- df_clean %>% 
  separate(GeoDesc, 
           into = c("FIPS_dr", "State", "Program_dr", "County"),
           sep = " ",
           extra = "merge") %>%                      # split GeoDesc into 4 columns; merge extra into County
  mutate(County = str_remove(County, " COUNTY")) %>% # drop "COUNTY" from County name
  mutate(County = str_to_title(County)) %>%          # convert County names to title case
  select(-FIPS_dr, -Program_dr)                      # drop redundant columns

### Decompose Date into Year and Month
### For time series analysis; full Date col retained
df_clean <- df_clean %>% 
  mutate(Year = year(Date),
         Month = month(Date)) %>% 
  select(everything())