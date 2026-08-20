# Data Warehouse Project

This is a personal data warehousing project I built as an exercise to practice working with SQL Server, ETL pipelines, data modeling, and analytical SQL.

The project takes sales data from two source systems (ERP and CRM) and brings them together into a small analytical data warehouse. The goal was to go through the full process myself, from loading raw CSV files to cleansing the data and creating queries for analysis.

## Architecture & Data Model

The warehouse follows the Medallion architecture to process and refine the data:

* **Bronze** – Raw data loaded directly from the ERP and CRM CSV files with minimal changes.
* **Silver** – Cleaned and standardized data. This is where I handled real-world data quality issues like invalid values, inconsistent formats, and duplicates.
* **Gold** – The final, business-ready data organized into a **star schema**. By building fact and dimension tables, I made the data easy to query and analyze from different perspectives, such as customers, products, and dates.

## What I Practiced

Throughout this project, I worked on:

* Building **ETL pipelines** to extract, transform, and load multi-source data.
* Writing SQL for **data cleansing, integration, and analysis**.
* Designing and implementing a dimensional **star schema** for analytical workloads.
* Extensively documenting and visualizing the warehouse structure to make the project easier to understand and maintain.

## Project Scope

The main focus was understanding the practical steps involved in building a data warehouse rather than creating a massive, production-ready platform. For this exercise, I focused on the **latest available dataset**. Advanced concepts like historical tracking and slowly changing dimensions (SCDs) are currently outside the scope of this project.

## Repository Structure

This repository contains the SQL scripts and documentation I used throughout the project, including the different warehouse layers, data transformations, and analytical queries.

## License

This project is for personal learning and practice. It is based on mocked datasets and a general project structure used specifically for this exercise.
