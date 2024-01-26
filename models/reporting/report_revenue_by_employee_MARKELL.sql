select 
EMPLOYEEID,
FIRSTNAME,
ORDERDATE,
SUM(OrderPrice) As RevenueByEmployee
FROM {{ ref('stg_markell') }}
GROUP BY EMPLOYEEID, FIRSTNAME, ORDERDATE
