USE nyc_taxi_ldw;

/*
Campaigns Requirement
Let's start with the SELECT statement required to satisfy the requirement (1)
*/

/*
SELECT td.year,
       td.month,
       tz.borough,
       CONVERT(DATE, td.lpep_pickup_datetime) AS trip_date,
       cal.day_name AS trip_day,
       CASE WHEN cal.day_name IN ('Saturday','Sunday') THEN 'Y' ELSE 'N' END AS trip_day_weekend_ind,
       SUM(CASE WHEN pt.description = 'Credit card' THEN 1 ELSE 0 END) AS card_trip_count,
       SUM(CASE WHEN pt.description = 'Cash' THEN 1 ELSE 0 END) AS cash_trip_count
  FROM silver.vw_trip_data_green td
  JOIN silver.taxi_zone tz ON (td.pu_location_id = tz.location_id)
  JOIN silver.calendar cal ON (cal.date = CONVERT(DATE, td.lpep_pickup_datetime))
  JOIN silver.payment_type pt ON (td.payment_type = pt.payment_type)
WHERE td.year = '2020'
  AND td.month = '01'
GROUP BY td.year,
       td.month,
       tz.borough,
       CONVERT(DATE, td.lpep_pickup_datetime),
       cal.day_name
*/

/*
Demand Forecast Requirement
Let's start with the SELECT statement required to satisfy the requirement (2)
*/

/*
SELECT td.year,
       td.month,
       tz.borough,
       CONVERT(DATE, td.lpep_pickup_datetime) AS trip_date,
       cal.day_name AS trip_day,
       CASE WHEN cal.day_name IN ('Saturday','Sunday') THEN 'Y' ELSE 'N' END AS trip_day_weekend_ind,
       SUM(CASE WHEN pt.description = 'Credit card' THEN 1 ELSE 0 END) AS card_trip_count,
       SUM(CASE WHEN pt.description = 'Cash' THEN 1 ELSE 0 END) AS cash_trip_count,
       SUM(CASE WHEN tt.trip_type_desc = 'Street-hail' THEN 1 ELSE 0 END) AS street_hail_trip_count,
       SUM(CASE WHEN tt.trip_type_desc = 'Dispatch' THEN 1 ELSE 0 END) AS dispatch_trip_count ,
       SUM(td.trip_distance) AS trip_distance,
       SUM(DATEDIFF(MINUTE, td.lpep_pickup_datetime, td.lpep_dropoff_datetime)) AS trip_duration,
       SUM(td.fare_amount) AS fare_amount
  FROM silver.vw_trip_data_green td
  JOIN silver.taxi_zone tz ON (td.pu_location_id = tz.location_id)
  JOIN silver.calendar cal ON (cal.date = CONVERT(DATE, td.lpep_pickup_datetime))
  JOIN silver.payment_type pt ON (td.payment_type = pt.payment_type)
  JOIN silver.trip_type tt ON (td.trip_type = tt.trip_type)
WHERE td.year = '2020'
  AND td.month = '01'
GROUP BY td.year,
       td.month,
       tz.borough,
       CONVERT(DATE, td.lpep_pickup_datetime),
       cal.day_name;
*/

EXEC gold.usp_gold_trip_data_green '2020', '01';
EXEC gold.usp_gold_trip_data_green '2020', '02';
EXEC gold.usp_gold_trip_data_green '2020', '03';
EXEC gold.usp_gold_trip_data_green '2020', '04';
EXEC gold.usp_gold_trip_data_green '2020', '05';
EXEC gold.usp_gold_trip_data_green '2020', '06';
EXEC gold.usp_gold_trip_data_green '2020', '07';
EXEC gold.usp_gold_trip_data_green '2020', '08';
EXEC gold.usp_gold_trip_data_green '2020', '09';
EXEC gold.usp_gold_trip_data_green '2020', '10';
EXEC gold.usp_gold_trip_data_green '2020', '11';
EXEC gold.usp_gold_trip_data_green '2020', '12';
EXEC gold.usp_gold_trip_data_green '2021', '01';
EXEC gold.usp_gold_trip_data_green '2021', '02';
EXEC gold.usp_gold_trip_data_green '2021', '03';
EXEC gold.usp_gold_trip_data_green '2021', '04';
EXEC gold.usp_gold_trip_data_green '2021', '05';
EXEC gold.usp_gold_trip_data_green '2021', '06';

