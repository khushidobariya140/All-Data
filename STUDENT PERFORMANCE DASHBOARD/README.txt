📊 Student Performance Analysis Dashboard
Power BI Project – Detailed README
📌 Project Overview

The Student Performance Analysis Dashboard is an interactive Power BI report developed to analyze and monitor students' academic performance, attendance records, and behavioral patterns. The objective of this project is to transform raw student data into meaningful insights using data modeling, DAX measures, and advanced visualizations.

This dashboard helps educators and administrators make informed academic decisions by identifying high-performing students, tracking attendance trends, and analyzing behavioral incidents.
-> Dataset Description:-:-:-:-

The project uses four datasets:

1️. Students.csv

This file contains basic student demographic information such as
StudentID, Name, Gender, Class, and Section.
It acts as the central reference table for connecting all other datasets.

2️. Scores.csv

This dataset contains academic performance data including
Subject, ExamType, Score, MaxScore, and Term.
It is used to calculate performance-related metrics
like percentage score and average scores.

3️. Attendance.csv

This file records student attendance with Date, Status (Present/Absent), and Reason.
It is used to compute attendance percentage and analyze attendance trends.

4️. Behavior.csv

This dataset stores behavioral records such as BehaviorType and Notes along with Date.
It helps analyze discipline-related patterns.

:-:-:- Data Modeling & Cleaning :-:-:-

All four datasets were loaded into Power BI and properly structured.

Relationships were created using StudentID as the primary key.

A Star Schema model was followed, where the Students table acts as the dimension
table and Scores, Attendance, and Behavior act as fact tables.

One-to-Many relationships were established from Students to other tables.

Data types were corrected (Date columns set to Date format, numeric fields set correctly).

Column names were cleaned and standardized.

Missing values were handled appropriately to avoid calculation errors.

This structured data model ensures efficient filtering, accurate aggregation, and better report performance.

:-:-:- DAX Measures Implemented :-:-:-

Several calculated measures were created using DAX to enhance analytical capabilities:

:-:- Percentage Score

Calculated as Score divided by MaxScore to evaluate individual subject performance.

:-:- Average Score per Subject

Used to analyze subject-wise academic strength.

:-:- Attendance Percentage

Calculated based on the ratio of Present days to total attendance records.

:-:- Behavior Count per Type

Used to count behavioral incidents categorized by type.

:-:- Performance Category

Students were classified into:

High Performance (Above 80%)

Medium Performance (40%–80%)

Low Performance (Below 40%)

This classification was implemented using IF or SWITCH functions in DAX.

These measures allow dynamic filtering and real-time calculations within the dashboard.

:-:-:- Visualizations Created

The report contains multiple interactive visuals to present insights clearly:

:-:- Bar Chart

Displays average scores by Subject and Class, allowing comparison across different classes.

:-:- Line Chart

Shows performance trends over different Terms to identify improvement or decline.

:-:- Donut Chart

Represents distribution of behavior types, helping identify common behavioral issues.

:-:- Table with Conditional Formatting

Displays student-wise performance data.

Green highlighting for scores above 80%

Red highlighting for scores below 40%

:-:- KPI Cards

Key performance indicators included:

Total Students

Average Attendance

Average Score

These KPIs provide a quick summary of overall performance.

:-:-:- Interactivity Features

To enhance user experience, the following interactive elements were implemented:

Slicers for Class, Section, Subject, and Term to filter data dynamically.

Drillthrough page to view detailed individual student profiles.

Tooltips displaying additional metrics on hover.

Bookmarks for switching between Academic View and Behavioral View.

Interactive cross-filtering between visuals.

These features allow users to explore data deeply and efficiently.

:-:- Mobile Layout

An optimized mobile layout was created to ensure accessibility on Power BI mobile applications, maintaining usability across devices.

-> Conclusion :-

This project successfully demonstrates the use of Power BI for educational data analysis. By combining data modeling, DAX calculations, and interactive visualizations, the dashboard provides meaningful insights into student academic performance, attendance consistency, and behavioral trends.

The dashboard enables data-driven decision-making and helps identify areas requiring improvement, ensuring better academic monitoring and management.