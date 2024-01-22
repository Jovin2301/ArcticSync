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
        var sql_command = "SELECT * FROM RAW_ORDER WHERE ORDERID = :1";
        
        var statement1 = snowflake.createStatement({
            sqlText: sql_command,
            binds: [orderId]
        });
        
        var resultSet1 = statement1.execute();
        var result = resultSet1.fetchAll({format: 'json'});

        return result;
    } catch (err) {
        
        snowflake.execute("INSERT INTO error_log (error_message) VALUES (:1)", [err.message]);
        
        throw err;
    }
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
