-- source from: https://www.youtube.com/watch?v=CsH2sB6gwlw&ab_channel=DataEngineeringSimplified

-- query for order details, given order ID
CREATE OR REPLACE PROCEDURE GetOrderDetails(orderId STRING)
    RETURNS VARIANT
    LANGUAGE JAVASCRIPT
    EXECUTE AS CALLER
AS
$$
    // Use parameterized query to avoid SQL injection
    var sql_command = "SELECT * FROM RAW_ORDER WHERE ORDERID = :1;";
    
    // we now use a parameterised query, by creating a statement
    var statement1 = snowflake.createStatement({
        sqlText: sql_command, 
        binds: [ORDERID]
        });
    
    //we then execute the statement, using .execute(), and
    //saving it as a variable
    var resultSet1 = statement1.execute();
    
    // fetch all rows as a variant (JSON-like) object
    var result = resultSet1.fetchAll({format: 'json'});
    
    // return the result
    return result;
$$;




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
