USE nyc_taxi_discovery;

SELECT TOP 100
       *
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) AS trip_data;

SELECT TOP 100
       *
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/year=2020',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) AS trip_data;  

EXEC sp_describe_first_result_set N'
SELECT TOP 100
       *
   FROM OPENROWSET(
       BULK ''trip_data_green_delta/'',
       DATA_SOURCE = ''nyc_taxi_data_raw'',
       FORMAT = ''DELTA''
   ) AS trip_data'

SELECT TOP 100
       *
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) 
   WITH (
       VendorID INT,
        lpep_pickup_datetime datetime2(7),
        lpep_dropoff_datetime datetime2(7),
        store_and_fwd_flag CHAR(1),
        RatecodeID INT,
        PULocationID INT,
        DOLocationID INT,
        passenger_count INT,
        trip_distance FLOAT,
        fare_amount FLOAT,
        extra FLOAT,
        mta_tax FLOAT,
        tip_amount FLOAT,
        tolls_amount FLOAT,
        ehail_fee INT,
        improvement_surcharge FLOAT,
        total_amount FLOAT,
        payment_type INT,
        trip_type INT,
        congestion_surcharge FLOAT,
        year VARCHAR(4),
        month VARCHAR(2)
   )AS trip_data;  

SELECT TOP 100
       *
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) 
   WITH (
        tip_amount FLOAT,
        trip_type INT,
        year VARCHAR(4),
        month VARCHAR(2)
   )AS trip_data;  

SELECT COUNT(DISTINCT payment_type)
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) AS trip_data;  

SELECT COUNT(DISTINCT payment_type)
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) AS trip_data
 WHERE year = '2020' AND month = '01';  

