
-- could be a card where higher number is bad as the product is supplied by supplier
SELECT
  companyName,
  MAX(shippeddate) AS latest_shippeddate,
  productid,
  categoryName,
  COUNT(DISTINCT productid) AS total_discontinued_products
FROM
  STG_KENDRICK
WHERE
  discontinued = 1
GROUP BY
  companyName,
  productid,
  categoryName,
  shippeddate

