USE nyc_taxi_ldw;

IF OBJECT_ID('silver.vendor') IS NOT NULL
    DROP EXTERNAL TABLE silver.vendor
GO

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


 SELECT * FROM silver.vendor; 
