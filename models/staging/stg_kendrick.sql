SELECT
  -- from raw_supplier (for location and supplier company)
  s.supplierid,
  s.companyName,
  s.city,
  s.country,
  s.contactName,
  s.contactTitle,

  -- from raw_product (product continuation status)
  p.productid,
  p.productname,
  p.discontinued,
  p.reorderLevel,
  p.unitsInStock, -- Include unitsInStock in the GROUP BY clause
--p.unitprice,
  p.UnitCost,
  -- Profit Margin Calculation
  (od.unitprice - p.unitcost) * od.quantity * (1 - od.discount) AS profit_margin,


  -- from raw_orderdetail (order details)
  od.orderid,
  o.shippedDate,
  o.requireddate,

  -- Calculate On-Time Delivery Performance Card
  CASE
    WHEN DATEDIFF('day', o.shippeddate, o.requireddate) >= 0 THEN 'Shipment On Time'
    ELSE 'Shipment Delayed'
  END AS delivery_performance,

  -- Calculate On-Time Delivery Performance line chart
  CASE
    WHEN DATEDIFF('day', o.shippeddate, o.requireddate) >= 0 THEN 1
    ELSE 0
  END AS on_time_delivery,
    
  SUM(on_time_delivery) AS on_time_deliveries,
  SUM(on_time_delivery) / COUNT(DISTINCT orderid) AS on_time_delivery_rate,

  -- from raw_category (product detail)
  c.categoryID,
  c.categoryName,

  -- Individual unit price, quantity, and discounted price
  od.unitprice AS unitprice,
  od.quantity,
  (od.unitprice * od.quantity * (1 - od.discount)) AS discountedprice,
  od.discount,

  -- creates a new binary column for order
  CASE
    WHEN p.unitsInStock - p.reorderLevel < 0 THEN 1
    ELSE 0
  END AS reorder

FROM
  {{ ref('raw_supplier') }} as s
LEFT JOIN
  {{ ref('raw_product') }} as p ON s.supplierid = p.supplierid
LEFT JOIN
  {{ ref('raw_order_details') }} as od ON p.productid = od.productid
LEFT JOIN
  {{ ref('raw_order') }} as o ON od.orderid = o.orderid -- Join the "order" table
LEFT JOIN
  {{ ref('raw_category') }} as c ON p.categoryID = c.categoryID
