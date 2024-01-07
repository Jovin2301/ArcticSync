-- CHECKING IF THE ORDERS ARE MADE BEFORE THE THE REQUIREDDATE
SELECT orderDate, shippeddate FROM raw_order
WHERE shippeddate < orderDate