------------ Patient Health Data Cleaning Project ----------
-> Overview :-

This project focuses on cleaning a healthcare dataset by handling missing values and outliers using multiple techniques.
The goal is to transform raw data into a machine learning–ready dataset.

-> Part A: Handling Missing Values

:-:-:- Tasks Performed

Identified missing values using:
df.isnull().mean() * 100

:-:-:- Imputation Techniques Used

Simple Imputer (Numerical) :-
Replaced missing BMI with mean/median

Simple Imputer (Categorical) :-
Filled missing Region with most frequent value

Most Frequent Imputation :-
Replaced missing Gender values with mode

Missing Indicator + Random Sampling :-
Created a new column indicating missing values
Filled missing values using random sampling 
KNN Imputer :-
Used nearest neighbors to fill missing values
Preserves relationships between variables

MICE (Iterative Imputer) :-
Advanced technique using chained equations
Best for multivariate missing data

-> Key Insights

Simple methods are fast but may reduce data variability
KNN and MICE provide better accuracy and relationships

-> Part B: Handling Outliers

:-:-:- Techniques Applied

Z-score Method :-
Removed extreme values (threshold: ±3)

IQR Method :-
Used for skewed data (especially BMI)

Percentile Method :-
Capped values below 1% and above 99%

Winsorization :-
Replaced extreme values instead of removing them

-> Key Insights

Z-score works well for normal distributions
IQR is robust for skewed data
Winsorization helps retain dataset size

-> Before vs After Cleaning
Aspect	Before Cleaning	After Cleaning
Missing Values	Present	Removed
Outliers	Extreme values	Handled
Data Quality	Low	High
ML Readiness	No	Yes

-> Part C: Final Clean Dataset

:-:-:- Achievements

All missing values handled
Outliers treated using appropriate methods
Dataset optimized for:
Machine Learning
Data Visualization
Statistical Analysis

This project demonstrates:

Real-world data preprocessing techniques
Importance of data cleaning before modeling
Comparison of multiple imputation & outlier methods

After cleaning, the dataset becomes:
--- Reliable
--- Consistent
--- Ready for Machine Learning