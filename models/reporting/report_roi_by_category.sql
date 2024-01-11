{{ config(  materialized='table') }}
SELECT * FROM {{ref('raw_category')}}
