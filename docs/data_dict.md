## Data Dictionary

**Description**: Semi-annual county-level SNAP enrollment and issuance data 
for the state of Oklahoma, subsetted from the USDA FNS national dataset via BigQuery.

**Source**: United States Department of Agriculture (USDA), Food and Nutrition Service (FNS)  
**Webpage**: [FNS SNAP Data Tables](https://www.fns.usda.gov/pd/supplemental-nutrition-assistance-program-snap)  
**Source data**: [BigQuery Public Dataset](https://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sbigquery-public-data!2ssdoh_snap_enrollment!3ssnap_enrollment)

| Field | Type | Description | Notes |
|---|---|---|---|
| GeoDesc | chr | Substate/Region with Program | Contains county name; concatenated label encoding region ID, delivery mechanism, program type, and county name; possibly parse county name |
| SNAP_PA_Participation_Persons | int | Count of persons receiving SNAP via Public Assistance pathway | PA = categorically eligible through TANF/SSI |
| SNAP_NPA_Participation_Persons | int | Count of persons receiving SNAP via Non-Public Assistance pathway | NPA = eligible on income/assets alone |
| SNAP_All_Participation_Persons | int | Total persons receiving SNAP (PA + NPA) | Calculated field |
| SNAP_PA_Participation_Households | int | Count of households receiving SNAP via PA pathway | |
| SNAP_NPA_Participation_Households | int | Count of households receiving SNAP via NPA pathway | |
| SNAP_All_Participation_Households | int | Total households receiving SNAP (PA + NPA) | Calculated field |
| SNAP_All_Issuance | int | Total dollar value of SNAP benefits issued | Calculated field; min of 0 warrants investigation |
| Date | chr | Date of enrollment data | Semi-annual (January & July); convert from chr to date |
| FIPS | int | Federal Information Processing Standard code | standard numeric ID for counties; used as filter key for OK (40--); convert from int to chr |
| SubCounty | int | Sub-county assigned number | Nearly all values are 1; max of 2 warrants investigation |
| Program | chr | Program abbreviation | All values are EBT; no variation in OK, though other values (SSI, GRH, and WRI) appear nationally |
