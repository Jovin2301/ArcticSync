--map plot for dominating supplying company
-- to show the location of the different suppliers and the number of stocks they supply
-- to identify the different location demands and how trustworthy the suppliers are
{{ config(  materialized='table') }}
SELECT
  supplierid,
  categoryID,
  companyName,
  city,
  country,
  shippeddate,
  --delivery_performance,


  -- Sum of quantities for each supplier
  SUM(quantity) AS total_quantity

FROM {{ ref('stg_kendrick') }}
GROUP BY
  supplierid,
  categoryID,
  companyName, 
  city, 
  country,
  shippeddate

ORDER BY
  total_quantity DESC
--LIMIT 5; ---this can be set in powerbi
