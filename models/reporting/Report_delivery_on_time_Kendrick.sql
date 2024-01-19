-- a line chart to show the different percentage of on time delivery across the different year 
-- to allow NWT have a guage on the tardiness of different periods by suppliers and categories
SELECT
  supplierid,
  companyName,
  city,
  country,
  COUNT(DISTINCT orderid) AS total_deliveries,
  SUM(on_time_delivery) AS on_time_deliveries,
  SUM(on_time_delivery) / COUNT(DISTINCT orderid) AS on_time_delivery_rate
FROM stg_Kendrick
  
GROUP BY
  supplierid, 
  companyName, 
  city, 
  country,
  shippeddate
ORDER BY
  supplierid