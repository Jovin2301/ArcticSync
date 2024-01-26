

SELECT p.UnitCost, od.UnitPrice, p.ProductID, od.OrderID from raw_order_details od
INNER JOIN raw_product p on od.ProductID = p.ProductID
WHERE od.unitPrice <= p.UnitCost