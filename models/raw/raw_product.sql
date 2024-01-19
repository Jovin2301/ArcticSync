-- USE SCHEMA NWT
{{ config(materialized='table') }}

SELECT * FROM {{ source('NWT', 'PRODUCT')}}

--select * from raw_product

