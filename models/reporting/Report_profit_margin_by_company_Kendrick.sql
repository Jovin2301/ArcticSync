-- to show and find the profit margin of the different suppliers. This is extremely crucial as the company (bar chart)
-- would want to make profit. Thus, identifying the profitable suppliers would be key in a sustaining a successful business
{{ config(  materialized='table') }}
SELECT
  --s.companyName,
  supplierid,
  COUNT(DISTINCT orderid) AS total_orders,
  SUM((unitprice - unitcost) * quantity * (1 - discount)) AS total_profit,
  AVG((unitprice - unitcost) * quantity * (1 - discount)) AS average_profit_margin,

  -- Add other relevant columns if needed
  MAX(shippedDate) AS latest_shipped_date,
  MIN(requireddate) AS earliest_required_date
FROM
  STG_KENDRICK
GROUP BY
  --s.companyName,
  supplierid
ORDER BY
  total_profit DESC -- Order by total profit in descending order
  
