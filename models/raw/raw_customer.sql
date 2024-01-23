{{ config(materialized='table') }}


SELECT * FROM {{ source('NWT', 'CUSTOMER')}}

select * from customer