{{ config(
  materialized='table',
  schema='ASSIGNMENT2.NWT',
  identifier='SAMUEL_STAGING'
) }}
SELECT * FROM {{ source('NWT', 'CATEGORY') }}
