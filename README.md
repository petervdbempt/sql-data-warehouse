# Data Warehouse and Analytics Project

This is a personal data warehousing and analytics project I built as an exercise to practice working with SQL Server, ETL, data modeling, and analytical SQL.

The project takes sales data from two source systems, ERP and CRM, and brings them together into a small analytical data warehouse. The goal was to go through the full process myself, from loading raw CSV files to cleaning the data, building the warehouse, and creating queries for analysis.

## Architecture

The warehouse follows the Medallion architecture, using **Bronze, Silver, Gold** layers.

* **Bronze** – Raw data loaded from the ERP and CRM CSV files with minimal changes.
* **Silver** – Cleaned and standardized data. This is where issues such as invalid values, inconsistent formats, and duplicates are handled.
* **Gold** – Business-ready data organized into a star schema for reporting and analysis.

## What I Practiced

Through this project, I worked on:

* .
* .
* .

## Data Warehouse

The main purpose of the warehouse is to make the sales data easier to query and analyze.

The Gold layer contains the final analytical model, with fact and dimension tables that can be used to look at sales from different perspectives, such as customers, products, and dates.

Below is a visualization of the architecture:

*INSERT DIAGRAM*

## Project Scope

This project focuses on the **latest available dataset**. Historical tracking and slowly changing dimensions are outside the scope of this exercise.

The main focus was understanding the practical steps involved in building a data warehouse rather than creating a production-ready platform.

## Repository Structure

The repository contains the SQL scripts and documentation used throughout the project, including the different warehouse layers, data transformations, and analytical queries.

## License

This project is for personal learning and practice. It is based on the datasets and general project structure used for this exercise.
