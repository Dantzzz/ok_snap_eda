#####################################
### File:   02_data_inspection.R
### Author: Dantz Farrow
### Date:   2026-03-27 
#####################################

### Load
df <- read.csv("data/snap_enrollment_oklahoma.csv")

### Inspect
dim(df)      # Shape: Rows and columns
str(df)      # Structure: Data types and column names
head(df)     # Preview: First few rows
summary(df)  # Summary statistics: Min, Max, Mean, etc.; No missing values