# Data Science Report — Membership Dataset

## Business understanding

Project Plan states the UMKM's current member and membership validity records were kept in a physical book, which makes retrieval and status checking difficult. This analysis demonstrates structured data checks and simple descriptive summaries on synthetic data only.

## Data understanding and source

`datasets/sample_membership_data.csv` contains five synthetic examples created for this capstone package. They are not actual Power Gym customer records. Fields include member ID, name, phone, package, start/end dates, administrative status, creation date, and data origin.

## Cleaning and preparation

The notebook reads the CSV, checks shape, dtypes, missing values, duplicate member IDs, date parsing, invalid date ranges, and derives effective membership status based on end date. Phone and name columns are treated as identifiers/descriptive attributes, not model features.

## Analysis

Notebook produces descriptive statistics, status counts, package distribution, and registration month counts. Because the data is intentionally tiny and synthetic, these charts demonstrate the method and do not establish business trends, customer retention, churn, or actual membership growth.

## Modeling

No machine-learning model is trained. The supplied Project Plan requires structured dummy data and descriptive membership analytics; it does not specify a prediction target. Training a model on five synthetic rows would not be methodologically defensible. Revisit modeling only if the official Data Science quest checklist requires it and sufficient authorized real or realistic labeled data is available.

## Reproducibility

Open `notebooks/power_gym_membership_analysis.ipynb` and run all cells from top to bottom with Python 3, pandas, numpy, and matplotlib installed.
