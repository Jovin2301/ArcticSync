select 
EMPLOYEEID,
FIRSTNAME,
SUM(OrderPrice) As RevenueByEmployee
FROM {{ ref('stg_markell') }}
GROUP BY EMPLOYEEID, FIRSTNAME
