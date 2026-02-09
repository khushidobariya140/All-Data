:-:-:-  Sales & Customer Intelligence Dashboard – Project Explanation : Project Overview

-> This project focuses on building a comprehensive Sales & Customer Intelligence Dashboard using Power BI.
The goal is to transform raw sales data into meaningful insights through an efficient data model, advanced DAX calculations,
interactive visuals, and user-friendly navigation. The dashboard helps stakeholders analyze sales performance,
customer behavior, regional trends, and time-based growth effectively.

-> Objectives:-

The main objectives of this project are to design a robust star schema data model,
apply a wide range of DAX formulas for KPIs and measures, and implement time intelligence analysis such as YOY, MOM, and YTD. The project also aims to create a fully interactive multi-page Power BI report with drillthrough, tooltips, and slicers, while ensuring mobile compatibility and enhanced user experience.

-> Dataset Overview:-

The dataset is imported from Excel files and follows a fact and dimension table structure.
The tables used in this project are:

Date_Dim – Stores calendar and time-related data

Customer_Dim – Contains customer details and segmentation

Product_Dim – Holds product information

Sales_Fact – Stores sales transactions

Returns_Fact – Captures returned sales data

Region_Dim – Contains region details with geographic mapping

This structure supports efficient analysis and scalability.

-> Data Modeling:-

A clean star schema is implemented by creating relationships between fact tables and dimension tables using primary and foreign keys. Unnecessary fields are hidden to improve report performance and readability. Consistent naming conventions are followed to maintain clarity across the data model.

-> DAX Measures & Calculated Columns:-

Various DAX functions are used to create dynamic measures and KPIs, including:

CALCULATE, FILTER, ALL, SUMX, COUNTX, AVERAGEX

SWITCH for KPI classification

RELATED for retrieving values from related tables

Calculated columns are created for profit margin classification, customer full names (First + Last), and formatted Year-Month fields to support reporting needs.

-> Time Intelligence:-

Time-based analysis is implemented using:

Year-over-Year (YOY) comparisons

Month-over-Month (MOM) growth

Year-to-Date (YTD) sales and returns

These calculations help identify seasonal patterns and long-term trends.

-> Dashboard Layout & Visuals:-

The dashboard is designed with one main summary page, two detailed analysis pages, 
and one drillthrough page. It uses Cards, KPI Cards, Line Charts, Bar Charts, Donut Charts, and Matrix visuals.
Top N Products and Top N Customers analysis is included, along with trend lines and forecasts for better decision-making.

-> Filtering & Interaction:-

Interactive slicers are added for Product, Customer Segment, Region, and Date.
Drill-up, drill-down, and drillthrough features allow users to explore data at different levels.
Numeric range parameters are used for custom filtering.

-> Navigation & User Experience:-

Custom buttons and bookmarks are implemented for smooth page navigation.
A collapsible slicer panel improves screen space usage. Tooltips with mini visuals provide additional insights on hover,
and advanced conditional formatting enhances data interpretation.

-> Mobile Layout:-

Key pages are optimized for mobile viewing, focusing on KPI cards and Top N visuals to ensure usability on smaller screens.