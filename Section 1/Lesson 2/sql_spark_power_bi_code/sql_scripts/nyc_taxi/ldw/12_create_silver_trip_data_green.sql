USE nyc_taxi_ldw;

/*
IF OBJECT_ID('silver.trip_data_green') IS NOT NULL
    DROP EXTERNAL TABLE silver.trip_data_green
GO

CREATE EXTERNAL TABLE silver.trip_data_green
    WITH
    (
        DATA_SOURCE = nyc_taxi_src,
        LOCATION = 'silver/trip_data_green',
        FILE_FORMAT = parquet_file_format
    )
AS
SELECT *
  FROM bronze.trip_data_green_csv;


SELECT * FROM silver.trip_data_green; 

*/

EXEC silver.usp_silver_trip_data_green '2020', '01'
EXEC silver.usp_silver_trip_data_green '2020', '02'
EXEC silver.usp_silver_trip_data_green '2020', '03'
EXEC silver.usp_silver_trip_data_green '2020', '04'
EXEC silver.usp_silver_trip_data_green '2020', '05'
EXEC silver.usp_silver_trip_data_green '2020', '06'
EXEC silver.usp_silver_trip_data_green '2020', '07'
EXEC silver.usp_silver_trip_data_green '2020', '08'
EXEC silver.usp_silver_trip_data_green '2020', '09'
EXEC silver.usp_silver_trip_data_green '2020', '10'
EXEC silver.usp_silver_trip_data_green '2020', '11'
EXEC silver.usp_silver_trip_data_green '2020', '12'
EXEC silver.usp_silver_trip_data_green '2021', '01'
EXEC silver.usp_silver_trip_data_green '2021', '02'
EXEC silver.usp_silver_trip_data_green '2021', '03'
EXEC silver.usp_silver_trip_data_green '2021', '04'
EXEC silver.usp_silver_trip_data_green '2021', '05'
EXEC silver.usp_silver_trip_data_green '2021', '06'





