{{ config(
   materialized='table',
   schema='ASSIGNMENT2.NWT'
) }}

SELECT * FROM {{ source('NWT', 'SHIPPER')}}