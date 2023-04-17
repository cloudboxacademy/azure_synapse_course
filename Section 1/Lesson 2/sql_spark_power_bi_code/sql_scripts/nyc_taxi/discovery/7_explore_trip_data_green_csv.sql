USE nyc_taxi_discovery;

-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=2020/month=01/green_tripdata_2020-01.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]

-- Select data from a folder
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=2020/month=01/*.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]
-- Select data from subfolders
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=2020/**',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]

-- Get data from more than one file
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK ('trip_data_green_csv/year=2020/month=01/*.csv',
        'trip_data_green_csv/year=2020/month=03/*.csv'),
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]

-- Use more than 1 wildcard character
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=*/month=*/*.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]

-- File metadata function filename()
SELECT
    TOP 100 
    result.filename() AS file_name,
    result.*
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=*/month=*/*.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]


SELECT
    result.filename() AS file_name,
    COUNT(1) AS record_count
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=*/month=*/*.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]
GROUP BY result.filename()
ORDER BY result.filename();

-- Limit Data using filename()
SELECT
    result.filename() AS file_name,
    COUNT(1) AS record_count
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=*/month=*/*.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]
WHERE result.filename() IN ('green_tripdata_2020-01.csv', 'green_tripdata_2021-01.csv')
GROUP BY result.filename()
ORDER BY result.filename();

-- Use filepath function
SELECT
    result.filepath(1) AS year,
    result.filepath(2) AS month,
    COUNT(1) AS record_count
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=*/month=*/*.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]
GROUP BY result.filename(), result.filepath(1), result.filepath(2)
ORDER BY result.filename(), result.filepath(1), result.filepath(2);

-- Use file path in the where clause
SELECT
    result.filepath(1) AS year,
    result.filepath(2) AS month,
    COUNT(1) AS record_count
FROM
    OPENROWSET(
        BULK 'trip_data_green_csv/year=*/month=*/*.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]
--WHERE result.filepath(1) = '2020'
--  AND result.filepath(2) IN ('06', '07', '08')
GROUP BY result.filename(), result.filepath(1), result.filepath(2)
ORDER BY result.filename(), result.filepath(1), result.filepath(2);

