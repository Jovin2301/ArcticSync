-- select * from raw_order
-- where ORDERID = '10248'

---------------------------------------------------------------
-- we can create a view, if we want to return more columns.
-- right now, we only query one column.
-- however in theory, stored procedure (SP) is more useful for more complex
-- queries, and if we insert data into inner joined tables.\

-- CURRENT VERSION
-----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE GET_ORDER_DETAILS(ORDERID STRING)
RETURNS DATE
LANGUAGE SQL
EXECUTE AS CALLER
AS
'
BEGIN
RETURN (SELECT ORDERDATE FROM RAW_ORDER WHERE ORDERID = :ORDERID);
END
';

-- Replace '10248' with the desired ORDERID
SET ORDERID = '10248';

-- Declare a variable to store the result
DECLARE RESULT_TABLE VARIANT;

-- Execute the stored procedure
CALL GET_ORDER_DETAILS(:ORDERID) INTO :RESULT_TABLE;

-- Fetch and display the result
SELECT * FROM TABLE(RESULT_SCAN(:RESULT_TABLE));


CALL GET_ORDER_DETAILS('10248')


-- JAVASCRIPT VERSION
-- ----------------------------------------
-- create or replace procedure GetOrderDetails(orderId string)
--     returns variant
--     language javascript
--     execute as caller
-- as
-- $$
--     try {
--         var resultSet1 = snowflake.execute('select * from raw_order where ORDERID = :1', [ORDERID]);
--         var result = resultSet1.fetchAll({format:'json'});
--         return result;
--     }
--     catch (err) {
--         var errorMessage = err.message || 'Error message not available';
--         snowflake.execute('insert into error_log (error_message) values (:1)', [errorMessage]);
--         throw err;
--     }
-- $$;

-- ALTERNATE SQL VERSION
---------------------------------------------
-- CREATE OR REPLACE PROCEDURE ASSIGNMENT2.NWT.GETORDERDETAILS("ORDERID" VARCHAR)
-- RETURNS VARIANT
-- LANGUAGE SQL
-- EXECUTE AS CALLER
-- AS
-- $$
-- BEGIN
--     DECLARE result VARIANT;
    
--     -- Execute the SQL query directly
--     SELECT OBJECT_INSERT(OBJECT_CONSTRUCT(*), 'custom_field', 'custom_value')
--     INTO :result
--     FROM raw_order
--     WHERE ORDERID = :ORDERID;

--     -- Return the result
--     RETURN :result;
-- END;
-- $$;

