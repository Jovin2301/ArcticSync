-- {{ config (materialized='table')}}

-- SELECT * FROM {{source('NWT', 'ORDERS')}}

-- UPDATE raw_order SET orderdate = DATEADD(YEAR, 1900, orderdate) -- add 1900 to dates with years 0096, 0097 and 0098

-- WHERE orderdate < '1900-01-01';

-- UPDATE raw_order SET requireddate = DATEADD(YEAR, 1900, requireddate) -- add 1900 to dates with years 0096, 0097 and 0098
-- WHERE requireddate < '1900-01-01';

-- UPDATE raw_order SET shippeddate = DATEADD(YEAR, 1900, shippeddate) -- add 1900 to dates with years 0096, 0097 and 0098
-- WHERE shippeddate < '1900-01-01';


UPDATE raw_order
SET SHIPPEDDATE = '1970-01-01 00:00:00'
WHERE SHIPPEDDATE is null

select * from raw_employee where reportsTo = 'null'

select * from raw_order

{{ config (materialized='table')}}

{{ config(materialized='incremental', unique_key='ORDERID') }}

SELECT *
FROM {{ ref ('fresh_orders') }}
{% if is_incremental() %}
WHERE CAST(ORDERID AS BIGINT) > (SELECT MAX(CAST(ORDERID AS BIGINT))  FROM {{this}})
{% endif %}

--select * from raw_order

-- -- UPDATING THE ORDERDATE
-- MERGE into raw_order
-- using (
--   select ORDERID, DATEADD(YEAR, 1900, orderdate) as orderdate2
--   from raw_order
--   where orderdate < '1900-01-01'
-- ) as src
-- on raw_order.ORDERID = src.ORDERID
-- when matched then
--   update set raw_order.orderdate = src.orderdate2;

-- -- UPDATING THE REQUIREDDATE
-- merge into raw_order
-- using (
--   select ORDERID, DATEADD(YEAR, 1900, requireddate) as requireddate2
--   from raw_order
--   where requireddate < '1900-01-01'
-- ) as src
-- on raw_order.ORDERID = src.ORDERID
-- when matched then
--   update set raw_order.requireddate = src.requireddate2;

-- --UPDATING SHIPPEDDATE
-- merge into raw_order
-- using (
--   select ORDERID, DATEADD(YEAR, 1900, shippeddate) as shippeddate2
--   from raw_order
--   where shippeddate < '1900-01-01'
-- ) as src
-- on raw_order.ORDERID = src.ORDERID
-- when matched then
--   update set raw_order.shippeddate = src.shippeddate2;

