/*
===============================================================================
Script Name: quality_checks_silver.sql
Description: Performs data quality checks on tables in the 'silver' schema to
             validate data consistency, accuracy, and standardization.

Checks Performed:
    - NULL or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and values.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after loading the Silver Layer.
    - Investigate and resolve any discrepancies identified by the checks.
===============================================================================
*/


-- ==============================================================================
-- CRM Customer Information
-- ==============================================================================

-- Check for NULL or Duplicate Customer IDs
-- Expectation: No Results
SELECT 
    cst_id,
    COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for Unwanted Spaces in Customer Key
-- Expectation: No Results
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Check Customer Marital Status Standardization
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;


-- ==============================================================================
-- CRM Product Information
-- ==============================================================================

-- Check for NULL or Duplicate Product IDs
-- Expectation: No Results
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for Unwanted Spaces in Product Name
-- Expectation: No Results
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for NULL or Negative Product Costs
-- Expectation: No Results
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Check Product Line Standardization
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- Check for Invalid Product Date Ranges
-- Expectation: No Results
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;


-- ==============================================================================
-- CRM Sales Details
-- ==============================================================================

-- Check for Invalid Sales Due Dates in Bronze Source Data
-- Expectation: No Invalid Dates
SELECT 
    NULLIF(sls_due_dt, 0) AS sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
    OR LEN(sls_due_dt) != 8 
    OR sls_due_dt > 20500101 
    OR sls_due_dt < 19000101;

-- Check for Invalid Sales Date Order
-- Expectation: No Results
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Check Sales Amount Consistency
-- Expectation: No Results
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;


-- ==============================================================================
-- ERP Customer Information
-- ==============================================================================

-- Check for Out-of-Range Customer Birthdates
-- Expectation: Birthdates between 1924-01-01 and Today
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- Check Customer Gender Standardization
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;


-- ==============================================================================
-- ERP Location Information
-- ==============================================================================

-- Check Country Standardization and Consistency
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;


-- ==============================================================================
-- ERP Product Category Information
-- ==============================================================================

-- Check for Unwanted Spaces in Category Fields
-- Expectation: No Results
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Check Maintenance Value Standardization
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
