USE ASSIGNMENT2.NWT;

UPDATE RAW_ORDER
SET SHIPPEDDATE = '1970-01-01 00:00:00'
WHERE SHIPPEDDATE IS NULL;

SELECT 'HELLO';
