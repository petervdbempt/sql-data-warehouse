/*
===============================================================================
Script Name: quality_checks_gold.sql
Description: Performs data quality checks on the 'gold' layer to validate the
             integrity, consistency, and accuracy of the analytical data model.

Checks Performed:
    - Uniqueness of surrogate keys in dimension views.
    - Referential integrity between fact and dimension views.
    - Connectivity between fact and dimension tables.

Usage Notes:
    - Run these checks after creating or refreshing the Gold Layer views.
    - Investigate and resolve any discrepancies identified by the checks.
===============================================================================
*/


-- ==============================================================================
-- Gold Customer Dimension
-- ==============================================================================

-- Check for Duplicate Customer Keys
-- Expectation: No Results
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


-- ==============================================================================
-- Gold Product Dimension
-- ==============================================================================

-- Check for Duplicate Product Keys
-- Expectation: No Results
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


-- ==============================================================================
-- Gold Sales Fact
-- ==============================================================================

-- Check Referential Integrity Between Fact and Dimension Views
-- Expectation: No Results
SELECT 
    * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL 
   OR c.customer_key IS NULL;
