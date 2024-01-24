-- MERGING UPDATES FOR ORDER DATE
MERGE INTO raw_order
USING (
    SELECT ORDERID, DATEADD(YEAR, 1900, orderdate) AS orderdate2
    FROM raw_order
    WHERE orderdate < '1900-01-01'
) AS src
ON raw_order.ORDERID = src.ORDERID
WHEN MATCHED THEN
    UPDATE SET raw_order.orderdate = src.orderdate2;

-- MERGING UPDATES FOR REQUIRED DATE
MERGE INTO raw_order
USING (
    SELECT ORDERID, DATEADD(YEAR, 1900, requireddate) AS requireddate2
    FROM raw_order
    WHERE requireddate < '1900-01-01'
) AS src
ON raw_order.ORDERID = src.ORDERID
WHEN MATCHED THEN
    UPDATE SET raw_order.requireddate = src.requireddate2;

-- MERGING UPDATES FOR SHIPPED DATE
MERGE INTO raw_order
USING (
    SELECT ORDERID, DATEADD(YEAR, 1900, shippeddate) AS shippeddate2
    FROM raw_order
    WHERE shippeddate < '1900-01-01'
) AS src
ON raw_order.ORDERID = src.ORDERID
WHEN MATCHED THEN
    UPDATE SET raw_order.shippeddate = src.shippeddate2;
