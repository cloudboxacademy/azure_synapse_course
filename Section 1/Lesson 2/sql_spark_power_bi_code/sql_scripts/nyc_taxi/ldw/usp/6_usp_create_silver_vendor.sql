USE nyc_taxi_ldw
GO


CREATE OR ALTER PROCEDURE silver.usp_silver_vendor
AS
BEGIN

    IF OBJECT_ID('silver.vendor') IS NOT NULL
        DROP EXTERNAL TABLE silver.vendor;

    CREATE EXTERNAL TABLE silver.vendor
        WITH
        (
            DATA_SOURCE = nyc_taxi_src,
            LOCATION = 'silver/vendor',
            FILE_FORMAT = parquet_file_format
        )
    AS
    SELECT *
    FROM bronze.vendor;


END;
