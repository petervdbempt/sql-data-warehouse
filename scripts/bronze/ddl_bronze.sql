/* ==============================================================================
   Script Name: ddl_bronze.sql
   Description: Creates tables in the 'bronze' schema for CRM and ERP source data.
   
   WARNING: 
   This script drops existing tables in the 'bronze' schema if they exist. 
   All stored data within these bronze tables will be permanently deleted!
   Ensure data pipelines or backups are managed before executing.
   ============================================================================== */

-- ==============================================================================
-- CRM System Tables
-- ==============================================================================

-- Check if the CRM Customer Info table exists and drop it
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

-- Create table to store raw CRM Customer Information
CREATE TABLE bronze.crm_cust_info (
    cst_id             INT,
    cst_key            NVARCHAR(50),
    cst_firstname      NVARCHAR(50),
    cst_lastname       NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr           NVARCHAR(50),
    cst_create_date    DATE
);
GO

-- Check if the CRM Product Info table exists and drop it
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

-- Create table to store raw CRM Product Information
CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);
GO

-- Check if the CRM Sales Details table exists and drop it
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

-- Create table to store raw CRM Sales and Transaction Details
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);
GO

-- ==============================================================================
-- ERP System Tables
-- ==============================================================================

-- Check if the ERP Location table exists and drop it
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

-- Create table to store raw ERP Location Information
CREATE TABLE bronze.erp_loc_a101 (
    cid   NVARCHAR(50),
    cntry NVARCHAR(50)
);
GO

-- Check if the ERP Customer table exists and drop it
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

-- Create table to store raw ERP Customer Demographic Data
CREATE TABLE bronze.erp_cust_az12 (
    cid   NVARCHAR(50),
    bdate DATE,
    gen   NVARCHAR(50)
);
GO

-- Check if the ERP Product Category table exists and drop it
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

-- Create table to store raw ERP Product Categories and Subcategories
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id          NVARCHAR(50),
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50)
);
GO
