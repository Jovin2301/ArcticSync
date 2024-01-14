SELECT 
-- from raw_order_details
d.orderID, 
d.productID,
d.unitPrice,
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
--from raw_product
productName, 
p.unitPrice as costPrice,
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
(d.unitPrice * (1-discount) * quantity) as productPrice,
(p.unitPrice * quantity) as productCost
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