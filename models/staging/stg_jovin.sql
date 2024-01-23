SELECT 

-- from raw_order_details
d.orderID, 
d.productID,
d.unitPrice, -- the price of product that customer bought the item
d.quantity,
d.discount, 

--from raw_customer
cr.customerID, 
cr.companyName, 

-- from raw_order
o.employeeID, 
o.orderDate, 
o.requiredDate,
o.shipCountry,
o.shipCity,
o.freight,
o.shipVia,

--from raw_product
p.productName, 
p.unitPrice -- the current pricing of the product

--from raw_employee
lastname, 
firstname, 
title, 

--from raw_category
categoryName, 

-- additional calculation
((d.unitPrice * (1-discount) * quantity) + freight) as productPrice, -- total cost for each of the product at the time of purchase

(d.unitPrice * quantity * (1-discount)) as totalSales, -- the price of per product 

((d.unitPrice - unitCost) * quantity * (1-discount)) as profitMargin,

(d.unitPrice * discount) as discountGiven



-- FROM {{ ref ('raw_order')}} as o
-- LEFT JOIN {{ ref('raw_order_details')}} as d
-- ON o.orderID = d.orderID
-- LEFT JOIN {{ ref('raw_product')}} as p
-- ON d.productID = p.productID 
-- LEFT JOIN {{ ref('raw_category')}} as c
-- ON p.categoryID = c.categoryID
-- LEFT JOIN {{ ref('raw_employee')}} as e
-- ON o.employeeID = e.employeeID
-- LEFT JOIN {{ ref('raw_customer')}} as cr
-- ON o.customerID = cr.customerID


FROM Assignment2.NWT.raw_order as o
LEFT JOIN Assignment2.NWT.raw_order_details as d
ON o.orderID = d.orderID
LEFT JOIN Assignment2.NWT.raw_product as p
ON d.productID = p.productID 
LEFT JOIN Assignment2.NWT.raw_category as c
ON p.categoryID = c.categoryID
LEFT JOIN Assignment2.NWT.raw_employee as e
ON o.employeeID = e.employeeID
LEFT JOIN Assignment2.NWT.raw_customer as cr
ON o.customerID = cr.customerID
--select * from stg_jovin
GROUP BY 
o.orderID,
d.orderID,
d.productID,
d.unitprice, 
d.discount,
d.quantity,
cr.customerID, 
cr.companyName,
o.employeeID, 
o.orderDate, 
o.requiredDate,
o.shipCountry,
o.shipCity,
o.freight,
o.shipVia,
p.productName, 
p.unitPrice,
lastname, 
firstname, 
title, 
categoryname,
productPrice,
totalSales,
profitMargin,
discountGiven

select * from stg_jovin


--DROP VIEW NWT.stg_jovin