{{ config(  materialized='table') }}

-- This is a SQL file, not a dbt model file
SELECT CategoryName, AVG(UnitPrice) as AvgUnitPrice
FROM {{ ref('stg_samuel') }}
GROUP BY CategoryName