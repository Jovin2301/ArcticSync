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
lastname, 
firstname, 
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
<<<<<<< HEAD
<<<<<<< HEAD
(p.unitPrice * quantity * (1-discount)) as totalSales, -- the price of per product 
=======
<<<<<<< HEAD
(p.unitPrice * quantity * (1-discount)) as totalSales -- the price of per product 
=======
(p.unitPrice * quantity * (1-discount)) as totalSales,-- the price of per product 
>>>>>>> 5b737518a6c39a8076b66dd40d637698d1d23877
>>>>>>> 327ab8de3b25891c527e6386a24021662c3209b0
=======

(p.unitPrice * quantity * (1-discount)) as totalSales -- the price of per product 

>>>>>>> fa2287807e3904a3555ffa4a73fa103239ba6e78
-- ((d.unitPrice - unitCost) * quantity * (1-discount)) as profitMargin, 



FROM
ASSIGNMENT2.NWT.raw_order as o
LEFT JOIN ASSIGNMENT2.NWT.raw_order_details as d
ON o.orderID = d.orderID
LEFT JOIN ASSIGNMENT2.NWT.raw_product as p
ON d.productID = p.productID
LEFT JOIN ASSIGNMENT2.NWT.raw_category as c
ON p.categoryID = c.categoryID
LEFT JOIN ASSIGNMENT2.NWT.raw_employee as e
ON  o.employeeID = e.employeeID

--select * from stg_jovin
