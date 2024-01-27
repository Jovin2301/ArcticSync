/*select 
EMPLOYEEID,
FIRSTNAME,
SUM(Quantity) AS OrderQuantity
FROM {{ ref('stg_markell') }}
GROUP BY EMPLOYEEID, FIRSTNAME*/
