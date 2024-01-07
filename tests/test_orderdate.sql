with
raw_order as (
    select * from {{ ref('raw_order') }}
)

SELECT ORDERDATE
FROM raw_order
WHERE YEAR(ORDERDATE) < 1990 -- excel sheet inputted had datetime format of 4-Jul-96 which snowflake translated to 0096-07-04 00:00:00.000
-- the year is obviously not right
-- format is year - month - day