               ---------------- PROJECT NAME - DATA LEVERAGER ---------------

1. Project Overview:-

This project is an ETL-only (Extract Transform Load) assignment using Power BI – Power Query Editor.
The main focus is on data cleaning, preparation, integration, and transformation.

2. Objective of the Project:-

The objective is to:
Extract data from multiple sources
Clean and standardize the data
Transform and reshape data
Combine datasets efficiently

3. Data Extraction (Sources Used):-

A) Sales Data (Folder Source)
Load 3 Excel files:
Sales_Jan.xlsx
Sales_Feb.xlsx
Sales_Mar.xlsx

B) Employee Data
Load an Excel file containing:
EmployeeID,Name,Department,Region,Join Date

4. Basic Data Transformations:-

-- to clean data:
Remove blank rows and columns
Promote first row as headers
Rename columns to meaningful names
Remove duplicate records
Filter or remove null values

5. Text Transformation Tools:-

Used to clean text fields:
UPPER() – Convert text to uppercase
LOWER() – Convert text to lowercase
TRIM() – Remove extra spaces
CLEAN() – Remove non-printable characters
REPLACE() – Replace incorrect values

6. Numeric Transformations:-

Round Revenue values to 2 decimal places
Create a new column
Profit = Revenue – Cost

7. Date & Time Transformations:-

Extract:
Day,Month,Year

8. Conditional & Index Columns:-

Sales Category Column:
Based on Revenue:
High → ≥ 2,00,000
Medium → 50,000
Low 

Index Columns:
Index starting from 0
Index starting from 1

9. Pivoting & Unpivoting:-

Pivot monthly columns into a single column
Unpivot data back into normalized format

10. Merging & Appending Data:-

Append sales data from Jan–Mar
Using Append Queries as New

11. Grouping & Aggregation:-

Group data by Region and calculate:
Total Sales
SUM OF INCOME
44214
45265
45202
44654
44548

Average Order Value
Transaction Count

12. Data Profiling & Quality Checks:-

This helps validate data accuracy and reliability.

