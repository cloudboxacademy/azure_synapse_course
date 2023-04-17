USE nyc_taxi_ldw
GO


CREATE OR ALTER PROCEDURE silver.usp_silver_calendar
AS
BEGIN
    IF OBJECT_ID('silver.calendar') IS NOT NULL
        DROP EXTERNAL TABLE silver.calendar;

    CREATE EXTERNAL TABLE silver.calendar
        WITH
        (
            DATA_SOURCE = nyc_taxi_src,
            LOCATION = 'silver/calendar',
            FILE_FORMAT = parquet_file_format
        )
    AS
    SELECT *
    FROM bronze.calendar;
END;
