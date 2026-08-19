/* ==============================================================================
   Script Name: init_database.sql
   Description: Creates the DataWarehouse database and its base schemas.
   
   WARNING: 
   This script drops the existing [DataWarehouse] database if it exists. 
   All existing data, tables, and configurations will be permanently deleted!
   Do not run in a production environment without verifying backups.
   ============================================================================== */

-- Switch to the master database to perform system-level operations
USE master;
GO

-- Check if the DataWarehouse database already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force all active user connections to disconnect immediately
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Drop the existing database
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a fresh instance of the database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created database
USE DataWarehouse;
GO

-- ==============================================================================
-- Schema Creation (Medallion Architecture)
-- ==============================================================================

-- Create schema for raw, ingested data
CREATE SCHEMA bronze;
GO

-- Create schema for cleansed and conformed data
CREATE SCHEMA silver;
GO

-- Create schema for business-level aggregations and analytics
CREATE SCHEMA gold;
GO
