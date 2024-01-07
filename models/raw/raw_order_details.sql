{{ config (materialized='table')}}

SELECT * FROM {{ source('NWT', 'ORDER_DETAIL')}}