-- source from: https://www.youtube.com/watch?v=CsH2sB6gwlw&ab_channel=DataEngineeringSimplified

-- query for order details, given order ID

CREATE OR REPLACE PROCEDURE GetOrderDetails(orderId STRING)
    RETURNS VARIANT
    LANGUAGE JAVASCRIPT
    EXECUTE AS CALLER
AS
$$
    try {
        // Use a parameterized query to avoid SQL injection
        var sql_command = "SELECT * FROM RAW_ORDER WHERE ORDERID = :orderId";

        // Use the same name in the binds array
        var statement1 = snowflake.createStatement({
            sqlText: sql_command,
            binds: { orderId: orderId }  // Use an object with a named parameter
        });

        // Executing the statement and fetch results
        var resultSet1 = statement1.execute();
        var result = resultSet1.fetchAll({format: 'json'});

        // Lastly, we return the results
        return result;

    } catch (err) {
        var errorMessage = err.message || 'Error message not available';
        snowflake.execute("INSERT INTO error_log (error_message) VALUES (:1)", [errorMessage]);

        // Rethrow the error, propagating it to the caller
        throw err;
    }
$$;
CALL GetOrderDetails('10248');




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
