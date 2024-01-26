with
raw_order as (
    select * from {{ ref('raw_order') }}
)

SELECT SHIPPEDDATE
FROM raw_order
WHERE YEAR(SHIPPEDDATE) < 1990 AND YEAR(SHIPPEDDATE) != 1970
-- excel sheet inputted had datetime format of 4-Jul-96 which snowflake translated to 0096-07-04 00:00:00.000
-- as we set null values to 1970, add that in the condition statement as well
-- the year is obviously not right
-- format is year - month - day
