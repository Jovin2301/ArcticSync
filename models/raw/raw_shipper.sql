{{ config(materialized='table') }}

SELECT * FROM {{ source('NWT', 'SHIPPER')}}