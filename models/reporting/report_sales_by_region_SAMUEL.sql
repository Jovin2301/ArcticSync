{{ config(  materialized='table') }}

-- This is a SQL file, not a dbt model file
SELECT RegionDescription, AVG(UnitPrice) as AvgUnitPrice
FROM {{ ref('stg_samuel') }}
GROUP BY RegionDescription