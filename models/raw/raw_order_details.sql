-- <<<<<<< HEAD
-- -- {{ config (materialized='table')}}
-- =======
-- {{ config(
--    materialized='table',
--    schema='ASSIGNMENT2.NWT'
-- ) }}
-- >>>>>>> 70358637c8d023cf905c3340f2b09a0963368665

-- SELECT * FROM {{ source('NWT', 'ORDER_DETAIL')}}

{{ config (materialized='table')}}

{{ config(materialized='incremental', unique_key='ORDERID') }}

SELECT *
FROM {{ ref('fresh_order_detail') }}
{% if is_incremental() %}
WHERE (CAST(ORDERID AS BIGINT)) > 
      (SELECT MAX(CAST(ORDERID AS BIGINT)) FROM {{this}})
{% endif %}
