
-- could be a card where higher number is bad as the product is supplied by supplier
{{ config(  materialized='table') }}
SELECT
  companyName,
  MAX(shippeddate) AS latest_shippeddate,
  productid,
  categoryName,
  COUNT(DISTINCT productid) AS total_discontinued_products
FROM
  {{ ref('stg_kendrick') }}
WHERE
  discontinued = 1
GROUP BY
  companyName,
  productid,
  categoryName,
  shippeddate
