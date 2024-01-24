-- source from: https://www.youtube.com/watch?v=CsH2sB6gwlw&ab_channel=DataEngineeringSimplified

-- query for order details, given order ID

CREATE OR REPLACE PROCEDURE GetOrderDetails(orderId STRING)
    RETURNS VARIANT
    LANGUAGE JAVASCRIPT
    EXECUTE AS CALLER
AS
$$
    try {
        // we can use a parameterized query, 
        //avoid SQL injection
        var sql_command = "SELECT * FROM RAW_ORDER WHERE ORDERID = :orderId";

        // Use the same name in the binds array
        var statement1 = snowflake.createStatement({
            sqlText: sql_command,
            binds: { orderId: orderId }  // Use an object with named parameter
        });

        
        //executing the statement and fetch results
        var resultSet1 = statement1.execute();
        var result = resultSet1.fetchAll({format: 'json'});

        // lastly, we return the results
        return result;

    } catch (err) {
        // Log the error specifically
        snowflake.execute("INSERT INTO error_log (error_message) VALUES (:1)", [err.message || 'Error message not available']);

        // rethrow the error, propagating it to the caller
        throw err;
    }
$$;
CALL GetOrderDetails('1');



-- simple query to query all employees
-- -------------------------------------------------------
-- CREATE OR REPLACE PROCEDURE SelectAllEmployees()
--     RETURNS STRING
--     LANGUAGE JAVASCRIPT
--     EXECUTE AS CALLER
-- AS
-- $$
--     var sql_command = "SELECT * FROM Employee;";
--     var statement1 = snowflake.createStatement({sqlText: sql_command});
--     var resultSet1 = statement1.execute();
--     return resultSet1;
-- $$;
-- CALL SelectAllEmployees();
