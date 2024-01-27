
-- could be a card where higher number is good as the product is in demand by supplier
{{ config(  materialized='table') }}
SELECT
  companyName,
  shippeddate,
  COUNT(DISTINCT productid) AS total_reorder_products
FROM
  STG_KENDRICK
WHERE
  reorder = 1
GROUP BY
  companyName,
  shippeddate
  
