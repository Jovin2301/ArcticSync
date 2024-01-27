/*
select 
EMPLOYEEID,
FIRSTNAME,
COUNT(DISTINCT CustomerCountry) AS CountryCount
FROM {{ ref('stg_markell') }}
GROUP BY 
EMPLOYEEID, FIRSTNAME


*/
