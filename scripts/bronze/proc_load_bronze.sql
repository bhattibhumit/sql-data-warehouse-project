/*
========================================================================================================
Stored Procedure : Load Bronze Layer (Source --> Bronze)
========================================================================================================

Script Purpose :

This Stored Procedure loads data into the 'bronze' schema from external CSV Files.
It perform the Follwoing actions :
  - Truncate the bronze table before loading data
  - Uses the 'BULK INSERT' command to load data from CSV Files to Bronze tables

Parameters : NONE (This Stored Procedure does not accept any Parameters or return any values

USAGE Example : EXEC bronze.load_bronze;

===========================================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME , @end_time DATETIME , @batch_start_time DATETIME ,@batch_end_time DATETIME ;
    BEGIN TRY
        SET @batch_start_time = GETDATE()
        PRINT '===========================================';
        PRINT 'Loading Bronze Layer';
        PRINT '===========================================';


        PRINT '*******************************************';
        PRINT 'Loading CRM table';
        PRINT '*******************************************';

        PRINT '--------------------------------------------'
        SET @start_time = GETDATE();
        PRINT '>> Truncate Table:bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\bhatt\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH 
        (
		         FIRSTROW = 2,
                 FIELDTERMINATOR = ',',  
                 TABLOCK
        );
        PRINT '>> Insert Into Table:bronze.crm_cust_info';
        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
        PRINT '--------------------------------------------'
        -- SELECT COUNT(*) FROM bronze.crm_cust_info;

        --------------------------------------------------
        PRINT '--------------------------------------------'
        SET @start_time = GETDATE();
        PRINT '>> Truncate Table:bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\bhatt\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH 
        (
		         FIRSTROW = 2,
                 FIELDTERMINATOR = ',',  
                 TABLOCK
        );
        PRINT '>> Insert Into Table:bronze.crm_prd_info';
        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
        PRINT '--------------------------------------------'
        -- SELECT COUNT(*) FROM bronze.crm_prd_info;

        --------------------------------------------------------------
        PRINT '--------------------------------------------'
        SET @start_time = GETDATE();
        PRINT '>> Truncate Table:bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\bhatt\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH 
        (
		         FIRSTROW = 2,
                 FIELDTERMINATOR = ',',  
                 TABLOCK
        );
        PRINT '>> Insert Into Table:bronze.crm_sales_details';
        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
        PRINT '--------------------------------------------'
        -- SELECT COUNT(*) FROM bronze.crm_sales_details;

        ----------------------------------------------------------

        PRINT '*******************************************';
        PRINT 'Loading ERP table';
        PRINT '*******************************************';

        PRINT '--------------------------------------------'
        SET @start_time = GETDATE();
        PRINT '>> Truncate Table:bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\bhatt\Downloads\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH 
        (
		         FIRSTROW = 2,
                 FIELDTERMINATOR = ',',  
                 TABLOCK
        );
        PRINT '>> Insert Into Table:bronze.erp_cust_az12';
        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
        PRINT '--------------------------------------------'
        -- SELECT COUNT(*) FROM bronze.erp_cust_az12;

        ----------------------------------------------------------------------

        PRINT '--------------------------------------------'
        SET @start_time = GETDATE();
        PRINT '>> Truncate Table:bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\bhatt\Downloads\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH 
        (
		         FIRSTROW = 2,
                 FIELDTERMINATOR = ',',  
                 TABLOCK
        );
         PRINT '>> Insert Into Table:bronze.erp_loc_a101';
         SET @end_time = GETDATE();
         PRINT '>> Load Duration : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
         PRINT '--------------------------------------------'
        -- SELECT COUNT(*) FROM bronze.erp_loc_a101;

        -----------------------------------------------------------------
        PRINT '--------------------------------------------'
        SET @start_time = GETDATE();
        PRINT '>> Truncate Table:bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\bhatt\Downloads\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH 
        (
		         FIRSTROW = 2,
                 FIELDTERMINATOR = ',',  
                 TABLOCK
        );
        PRINT '>> Insert Into Table:bronze.erp_px_cat_g1v2';
        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
        PRINT '--------------------------------------------'
        
        -- SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;
        SET @batch_end_time = GETDATE();
    END TRY
    
    BEGIN CATCH 
        PRINT '===========================================';
        PRINT 'ERROR OCCUR DURING LOADING bronze Layer';
        PRINT 'ERROR MESSAGE : '+ ERROR_MESSAGE();
        PRINT 'ERROR NUMBER : '+ CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'ERROR NUMBER : '+ CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '===========================================';

    END CATCH
END
