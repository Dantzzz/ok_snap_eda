# Oklahoma SNAP Participation - Exploratory Data Analysis

### Overview
This project is an exploratory data analysis (EDA) of SNAP enrollment data 
sourced from the USDA Food and Nutrition Service (FNS) via [Google BigQuery public dataset](https://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sbigquery-public-data!2ssdoh_snap_enrollment!3ssnap_enrollment).
The analysis focuses on Oklahoma county-level enrollment and issuance data spanning 2012-2019.

--- 

### Analysis Phases

### Phase 0 — Project Setup

Initialized a Git repository and established a clear project structure before introducing any data or analysis.
Set up a `.gitignore` to protect credentials (`.Renviron`) and omit raw data files (`data/`) from version control.
Folder structure: `data/`, `scripts/`, `outputs/`, `docs/`.

### Phase 1 - Data Acquisition

Connected to the Google BigQuery public dataset using the `bigrquery` and `DBI` packages in R.
Stored billing project ID in `.Renviron`. It is retrieved at runtime via `Sys.getenv()` to avoid exposing database credentials in version control.
A SQL query filters the national SNAP enrollment table to include Oklahoma counties using a `FIPS` code prefix match. This returns 1,155 observations across 12 fields.
Saved the raw output locally as a raw CSV file for use in downstream scripts.
```sql
SELECT *
FROM `bigquery-public-data.sdoh_snap_enrollment.snap_enrollment`
WHERE FIPS LIKE '40%';
```

### Phase 2 - Data Inspection & Documentation

Performed an initial inspection of the raw data to assess shape, structure, and contents. 
Findings were documented in a data dictionary (`docs/data_dict.md`), covering field definitions, data types, and flagged anomalies — including zero 
issuance values despite non-zero participation counts, and no variation in the `Program` field across Oklahoma records. 
These findings directly informed the cleaning and analysis phases that followed.

### Phase 3 - Data Cleaning and Processing

### Phase 4 - Univariate EDA

###  Phase 5 - Multivariate EDA and Time Series Analysis

### Phase 6 - Summary & Refined Questions
