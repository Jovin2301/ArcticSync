-- {{ config (materialized='table')}}

-- SELECT * FROM {{source('NWT', 'ORDERS')}}

/*UPDATE raw_order SET orderdate = DATEADD(YEAR, 1900, orderdate) -- add 1900 to dates with years 0096, 0097 and 0098

WHERE orderdate < '1900-01-01';

UPDATE raw_order SET requireddate = DATEADD(YEAR, 1900, requireddate) -- add 1900 to dates with years 0096, 0097 and 0098
WHERE requireddate < '1900-01-01';

UPDATE raw_order SET shippeddate = DATEADD(YEAR, 1900, shippeddate) -- add 1900 to dates with years 0096, 0097 and 0098
WHERE shippeddate < '1900-01-01';


UPDATE raw_order
SET SHIPPEDDATE = '1970-01-01 00:00:00'
WHERE SHIPPEDDATE is null

select * from raw_order where SHIPPEDDATE is null

<<<<<<< HEAD
select * from raw_order*/

=======
select * from raw_order */
>>>>>>> 8ec5dc234f1b97961af0fd0db7e32238d6d5ea40

{{ config (materialized='table')}}

{{ config(materialized='incremental', unique_key='ORDERID') }}

SELECT *
FROM {{ ref ('fresh_orders') }}
{% if is_incremental() %}
WHERE CAST(ORDERID AS BIGINT) > (SELECT MAX(CAST(ORDERID AS BIGINT))  FROM {{this}})
{% endif %}

<<<<<<< HEAD
=======


>>>>>>> 8ec5dc234f1b97961af0fd0db7e32238d6d5ea40
