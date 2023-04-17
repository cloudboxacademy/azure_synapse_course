-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://synapsecoursedl.dfs.core.windows.net/demo/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'
    ) AS [result]

