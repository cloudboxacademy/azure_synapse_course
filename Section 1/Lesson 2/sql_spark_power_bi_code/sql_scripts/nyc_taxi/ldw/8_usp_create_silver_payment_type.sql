USE nyc_taxi_ldw
GO


CREATE OR ALTER PROCEDURE silver.usp_silver_payment_type
AS
BEGIN

    IF OBJECT_ID('silver.payment_type') IS NOT NULL
        DROP EXTERNAL TABLE silver.payment_type;

    CREATE EXTERNAL TABLE silver.payment_type
        WITH
        (
            DATA_SOURCE = nyc_taxi_src,
            LOCATION = 'silver/payment_type',
            FILE_FORMAT = parquet_file_format
        )
    AS
    SELECT payment_type, description
    FROM OPENROWSET(
        BULK 'raw/payment_type.json',
        DATA_SOURCE = 'nyc_taxi_src',
        FORMAT = 'CSV',
        FIELDTERMINATOR = '0x0b',
        FIELDQUOTE = '0x0b'
    )
    WITH
    (
        jsonDoc NVARCHAR(MAX)
    ) AS payment_type
    CROSS APPLY OPENJSON(jsonDoc)
    WITH(
        payment_type SMALLINT,
        description VARCHAR(20) '$.payment_type_desc'
    );


END;