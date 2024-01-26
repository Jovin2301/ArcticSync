-- scatter Plot for Units in Stock vs. Total Reorders
-- to check the supplier is doing well in supplying and 
-- whether the company see a potential selling point on their products (when x and y increase)
{{ config(  materialized='table') }}
SELECT 
    contactName, 
    contactTitle,
    companyName,
    shippeddate,
    SUM(UNITSINSTOCK) AS TotalUnitsInStock,
    SUM(REORDER) AS TotalReorders
FROM {{ ref('stg_kendrick') }}
WHERE
    discontinued = 0
GROUP BY 
    contactName,
    contactTitle,
    companyName,
    shippeddate
