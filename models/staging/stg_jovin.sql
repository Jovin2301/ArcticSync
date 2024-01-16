SELECT 
-- from raw_order_details
d.orderID, 
d.productID,
d.unitPrice, -- the price of product that customer bought the item
quantity,
discount, 

--from raw_customer
customerID, 
country,

-- from raw_order
o.employeeID, 
orderDate, 
requiredDate,
shipCountry,
shipCity,
freight,
shipVia,

--from raw_product
productName, 
p.unitPrice -- the current pricing of the product

--from raw_employee
lastName, 
firstName, 
title, 
titleOfCourtesy,
photo, 
reportsTo,
photoPath,

--from raw_category
categoryName, 
picture, 

-- additional calculation
((d.unitPrice * (1-discount) * quantity) + freight) as productPrice, -- total cost for each of the product at the time of purchase
(p.unitPrice * quantity * (1-discount)) as totalSales,-- the price of per product 
-- ((d.unitPrice - unitCost) * quantity * (1-discount)) as profitMargin, 



FROM
{{ ref ('raw_order')}} as o

LEFT JOIN {{ ref('raw_order_details')}} as d
ON o.orderID = d.orderID

LEFT JOIN {{ ref('raw_product')}} as p
ON d.productID = p.productID

LEFT JOIN {{ ref('raw_category')}} as c
ON p.categoryID = c.categoryID

LEFT JOIN {{ ref('raw_employee')}} as e
ON  o.employeeID = e.employeeID

--select * from stg_jovin
