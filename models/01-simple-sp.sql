-- source from: https://www.youtube.com/watch?v=CsH2sB6gwlw&ab_channel=DataEngineeringSimplified

CREATE OR REPLACE PROCEDURE SelectAllEmployees()
    RETURNS STRING
    LANGUAGE JAVASCRIPT
    EXECUTE AS CALLER
AS
$$
    var sql_command = "SELECT * FROM Employee;";
    var statement1 = snowflake.createStatement({sqlText: sql_command});
    var resultSet1 = statement1.execute();
    return resultSet1;
$$;
CALL SelectAllEmployees();
