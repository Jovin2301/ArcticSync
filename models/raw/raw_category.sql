{{ config(materialized='table') }}

SELECT * FROM {{ source('NWT', 'CATEGORY') }}

--select * from raw_category