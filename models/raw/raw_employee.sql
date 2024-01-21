{{ config(materialized='table') }}

SELECT * FROM {{ source('NWT', 'EMPLOYEE')}}

/*UPDATE raw_employee
SET reportsTo = 2
WHERE reportsTo = 'NULL' AND title = 'Vice President Sales'

select * from raw_employee*/