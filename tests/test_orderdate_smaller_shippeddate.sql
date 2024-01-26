-- CHECKING IF THE ORDERS ARE MADE BEFORE THE THE REQUIREDDATE
SELECT orderDate, shippeddate FROM raw_order
WHERE shippeddate < orderDate AND year(SHIPPEDDATE) != 1970 --null shippeddates were set to 1970