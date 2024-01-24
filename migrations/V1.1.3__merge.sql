--USE ASSIGNMENT2.NWT;

UPDATE ASSIGNMENT2.NWT.raw_order 
SET ORDERDATE = DATEADD(YEAR, 1900, ORDERDATE) -- add 1900 to dates with years 0096, 0097 and 0098
WHERE ORDERDATE < '1900-01-01';

UPDATE ASSIGNMENT2.NWT.raw_order 
SET requireddate = DATEADD(YEAR, 1900, requireddate) -- add 1900 to dates with years 0096, 0097 and 0098
WHERE requireddate < '1900-01-01';

UPDATE ASSIGNMENT2.NWT.raw_order 
SET shippeddate = DATEADD(YEAR, 1900, shippeddate) -- add 1900 to dates with years 0096, 0097 and 0098
WHERE shippeddate < '1900-01-01';

UPDATE ASSIGNMENT2.NWT.raw_order
SET SHIPPEDDATE = '1970-01-01 00:00:00'
WHERE SHIPPEDDATE IS NULL;


