-- CHECKING IF THE ORDERS ARE MADE BEFORE THE THE REQUIREDDATE
SELECT orderDate, requiredDate FROM raw_order
WHERE requiredDate < orderDate