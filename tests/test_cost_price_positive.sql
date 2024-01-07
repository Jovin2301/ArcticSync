-- CHECKING IF THERE ARE ANY PRODUCTCOST THAT IS NEGATIVE
-- which also helps check if the unitprice and quantity is 0 or negative
SELECT d.unitPrice * quantity as productCost FROM
raw_order_details d INNER JOIN raw_product p 
--ON d.orderid = p.orderID
WHERE (d.unitPrice * quantity) <= 0