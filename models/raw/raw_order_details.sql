
-- {{ config (materialized='table')}}

-- SELECT * FROM {{ source('NWT', 'ORDER_DETAIL')}}

{{ config (materialized='table')}}

{{ config(materialized='incremental', unique_key='ORDERID') }}

SELECT *
FROM {{ ref('fresh_order_detail') }}
{% if is_incremental() %}
WHERE (CAST(ORDERID AS BIGINT)) > 
      (SELECT MAX(CAST(ORDERID AS BIGINT)) FROM {{this}})
{% endif %}

--select * from raw_order_details