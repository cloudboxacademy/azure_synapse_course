IF (NOT EXISTS(SELECT * FROM sys.credentials WHERE name = 'synapse-course-cosmos-db'))
    CREATE CREDENTIAL [synapse-course-cosmos-db]
    WITH IDENTITY = 'SHARED ACCESS SIGNATURE', SECRET = 'add your secret here....'
GO

SELECT TOP 100 *
FROM OPENROWSET(​PROVIDER = 'CosmosDB',
                CONNECTION = 'Account=synapse-course-cosmos-db;Database=nyctaxidb',
                OBJECT = 'Heartbeat',
                SERVER_CREDENTIAL = 'synapse-course-cosmos-db'
) AS [Heartbeat]
