{{ config (materialized='table')}}

SELECT * FROM {{source('NWT', 'ORDERS')}}

UPDATE raw_order SET orderdate = DATEADD(YEAR, 1900, orderdate) -- add 1900 to dates with years 0096, 0097 and 0098
WHERE orderdate < '1900-01-01';

UPDATE raw_order SET requireddate = DATEADD(YEAR, 1900, requireddate) -- add 1900 to dates with years 0096, 0097 and 0098
WHERE requireddate < '1900-01-01';

UPDATE raw_order SET shippeddate = DATEADD(YEAR, 1900, shippeddate) -- add 1900 to dates with years 0096, 0097 and 0098
WHERE shippeddate < '1900-01-01';

select * from raw_order