/*SELECT
COMPANYNAME,
FIRSTNAME,
EMPLOYEEID,
COUNT(ORDERID) AS OrderCount
FROM {{ ref('stg_markell') }}
GROUP BY EMPLOYEEID, FIRSTNAME, COMPANYNAME
QUALIFY RANK() OVER (PARTITION BY COMPANYNAME ORDER BY COUNT(ORDERID) DESC) = 1  -- firstly, seperates out by company, orders the count of orders for 
-- employees and ranks them from highest to lowest, choose the highest 
-- QUALIFY clause is used to filter based on the ranking. For each company, only choose the employee with the highest order count
*/
