USE master
GO

CREATE DATABASE nyc_taxi_ldw
GO

ALTER DATABASE nyc_taxi_ldw COLLATE Latin1_General_100_BIN2_UTF8
GO

USE nyc_taxi_ldw
GO

CREATE SCHEMA bronze
GO

CREATE SCHEMA silver
GO

CREATE SCHEMA gold
GO
