-- source from: https://www.youtube.com/watch?v=CsH2sB6gwlw&ab_channel=DataEngineeringSimplified

-- query for order details, given order ID

create or replace procedure GetOrderDetails(orderId string)
    returns variant
    language javascript
    execute as caller
as

$$
    try {
        var sql_command = 'select * from raw_order where orderId = :1'

        var statement1 = snowflake.createStatement({
            sqlText: sql_command,
            binds: [orderId]

    });

        var resultsSet1 = statement1.execute();
        var result = resultSet1.fetchAll({format:'json'});

        return result;

    }
    catch (err) {
        var errorMessage = err.message || 'Error message not available';
        snowflake.execute('insert into error_log (error_message) values (:1)', [errorMessage]);
        
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
