#####################################
### File:   04_data_univariate.R
### Author: Dantz Farrow
### Date:   2026-03-29
#####################################

### Load cleaned data
df <- read.csv("data/snap_enrollment_oklahoma_clean.csv")

### All_Participation_Persons
#   Heavily right-skewed, driven by urban counties with denser populations.
summary(df$SNAP_All_Participation_Persons)
hist(df$SNAP_All_Participation_Persons,
     main = "Histogram of SNAP All Participation (Persons)",
     xlab = "Number of Persons",
     ylab = "Frequency",
     col = "lightblue"
  )
df_test <- df[df$SNAP_All_Participation_Persons > 50000, "GeoDesc"]
print(unique(df_test)) # Oklahoma and Tulsa County (urban outliers)

### PA_Persons v.s. NPA_Persons
#   NPA Participation dwarfs PA Participation. 
#   Why? Is this common?
summary(df$SNAP_PA_Participation_Persons)
summary(df$SNAP_NPA_Participation_Persons)

### All_Issuance
#   Same distribution shape as participation, with urban outliers driving skew.
summary(df$SNAP_All_Issuance)
hist(df$SNAP_All_Issuance / 1000000,
     ylim = c(0, 1200),
     xlim = c(0, max(df$SNAP_All_Issuance / 1000000)),
     main = "Histogram of SNAP All Issuance",
     xlab = "Total Issuance ($ Millions)",
     ylab = "Frequency",
     col = "cornflowerblue"
     )