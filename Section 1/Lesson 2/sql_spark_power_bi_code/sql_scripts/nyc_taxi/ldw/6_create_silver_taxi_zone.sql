USE nyc_taxi_ldw;

IF OBJECT_ID('silver.taxi_zone') IS NOT NULL
    DROP EXTERNAL TABLE silver.taxi_zone
GO

CREATE EXTERNAL TABLE silver.taxi_zone
    WITH
    (
        DATA_SOURCE = nyc_taxi_src,
        LOCATION = 'silver/taxi_zone',
        FILE_FORMAT = parquet_file_format
    )
AS
SELECT *
  FROM bronze.taxi_zone;


 SELECT * FROM silver.taxi_zone; 
