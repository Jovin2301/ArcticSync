{{ config (materialized='view') }}

SELECT
-- Analyze geographical spread of customers

SHIPCOUNTRY,
-- o.ORDERID
SHIPCITY,
SHIPREGION,
SHIPPOSTALCODE,
SHIPADDRESS,
p.ADDRESS,
p.CITY,
p.REGION,
p.POSTALCODE,
p.COUNTRY,

-- Track order status
ORDERDATE,
SHIPPEDDATE,
REQUIREDDATE,
SHIPVIA,

-- No of Orders by Month
-- ORDERDATE,
-- o.ORDERID

-- Identify top customers by orders placed
SHIPNAME,
-- p.COMPANYNAME,
p.CONTACTNAME,
p.CONTACTTITLE,
o.CUSTOMERID,
-- o.ORDERID
s.shipperID,
s.COMPANYNAME,
d.productName,
-- Analyze total orders received
o.ORDERID
--COUNT(DISTINCT o.ORDERID) AS total_orders_received,

-- Understand customer demographics
-- SHIPCITY,
-- SHIPREGION,
-- SHIPPOSTALCODE
-- SHIPCOUNTRY
from {{ ref('raw_order') }} as o
left join {{ ref('raw_shipper') }} as s
on o.SHIPVIA = s.shipperID
left join {{ ref('raw_customer') }} as p
on o.customerid = p.customerid
left join {{ ref('raw_order_details') }} as c
on o.orderid = c.orderid
left join {{ ref('raw_product') }} as d
on c.productID = d.productID

/*GROUP BY -- necessary as count distinct used
  SHIPCOUNTRY,
  ORDERDATE,
  SHIPPEDDATE,
  o.CUSTOMERID,
  SHIPCITY,
  SHIPREGION,
  SHIPPOSTALCODE*/
