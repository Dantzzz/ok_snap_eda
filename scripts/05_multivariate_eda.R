#####################################
### File:   05_multivariate_eda.R
### Author: Dantz Farrow
### Date:   2026-04-01 
#####################################

### Load Clean Data
df <- read.csv("data/snap_enrollment_oklahoma_clean.csv")

### Structural Questions:
##  - Why does NPA participation dwarf PA participation?
##  - Participation vs issuance; are there instances in which participation > issuance?

##  Time-Series Analysis:
##  - Seasonality: Does Participation spike in Jan or Jul?
##  - Does SNAP participation/issuance increase over time?
##  - Are there differences in trends between PA and NPA over time?

