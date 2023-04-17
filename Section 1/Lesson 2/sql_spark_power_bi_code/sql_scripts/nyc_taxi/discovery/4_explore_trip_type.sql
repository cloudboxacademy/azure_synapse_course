USE nyc_taxi_discovery;

SELECT *
  FROM OPENROWSET(
      BULK 'trip_type.tsv',
      DATA_SOURCE = 'nyc_taxi_data_raw',
      FORMAT = 'CSV',
      PARSER_VERSION = '2.0',
      HEADER_ROW = TRUE,
      FIELDTERMINATOR = '\t'
  ) AS trip_type;