SELECT d.productID, orderid, d.unitPrice, UnitCost FROM raw_order_details d 
INNER JOIN raw_product p ON d.productid = p.productid
WHERE d.unitPrice <= UnitCost;