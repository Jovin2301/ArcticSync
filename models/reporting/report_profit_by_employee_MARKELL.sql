select 
EMPLOYEEID,
FIRSTNAME,
SUM(Profit) As ProfitByEmployee
FROM {{ ref('stg_markell') }}
GROUP BY EMPLOYEEID, FIRSTNAME
