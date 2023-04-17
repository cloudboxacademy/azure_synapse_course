USE nyc_taxi_ldw;

-- Create file format csv_file_format for parser version 2.0
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name ='csv_file_format')
  CREATE EXTERNAL FILE FORMAT csv_file_format  
  WITH (  
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS (  
        FIELD_TERMINATOR = ','  
      , STRING_DELIMITER = '"'
      , First_Row = 2
      , USE_TYPE_DEFAULT = FALSE 
      , Encoding = 'UTF8'
      , PARSER_VERSION = '2.0' )   
      );  

-- Create file format csv_file_format_pv1 for parser version 1.0
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name ='csv_file_format_pv1')
  CREATE EXTERNAL FILE FORMAT csv_file_format_pv1 
  WITH (  
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS (  
        FIELD_TERMINATOR = ','  
      , STRING_DELIMITER = '"'
      , First_Row = 2
      , USE_TYPE_DEFAULT = FALSE 
      , Encoding = 'UTF8'
      , PARSER_VERSION = '1.0' )   
      );  

-- Create file format tsv_file_format for parser version 2.0
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name ='tsv_file_format')
  CREATE EXTERNAL FILE FORMAT tsv_file_format  
  WITH (  
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS (  
        FIELD_TERMINATOR = '\t'  
      , STRING_DELIMITER = '"'
      , First_Row = 2
      , USE_TYPE_DEFAULT = FALSE 
      , Encoding = 'UTF8'
      , PARSER_VERSION = '2.0' )   
      );  

-- Create file format tsv_file_format for parser version 1.0
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name ='tsv_file_format_pv1')
  CREATE EXTERNAL FILE FORMAT tsv_file_format_pv1 
  WITH (  
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS (  
        FIELD_TERMINATOR = '\t'  
      , STRING_DELIMITER = '"'
      , First_Row = 2
      , USE_TYPE_DEFAULT = FALSE 
      , Encoding = 'UTF8'
      , PARSER_VERSION = '1.0' )   
      );  

-- Create external file format for parquet_file_format
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name ='parquet_file_format')
  CREATE EXTERNAL FILE FORMAT parquet_file_format  
  WITH (  
        FORMAT_TYPE = PARQUET,  
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'  
       ); 


-- Create external file format for delta_file_format
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name ='delta_file_format')
  CREATE EXTERNAL FILE FORMAT delta_file_format  
  WITH (  
        FORMAT_TYPE = DELTA,  
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'  
       ); 









