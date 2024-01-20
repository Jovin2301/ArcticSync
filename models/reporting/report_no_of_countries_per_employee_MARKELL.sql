
select 
EMPLOYEEID,
FIRSTNAME,
COUNT(DISTINCT SHIPCOUNTRY) AS CountryCount
FROM {{ ref('stg_markell') }}
GROUP BY 
EMPLOYEEID, FIRSTNAME


