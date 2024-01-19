{{ config(materialized='view') }}

SELECT * FROM {{ source('NWT', 'EMPLOYEETERRITORY')}}
