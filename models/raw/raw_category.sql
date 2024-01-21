{{ config(materialized='table') }}

SELECT * FROM {{ source('NWT', 'CATEGORY') }}

/* Issue lies in having duplicated values for CATEGORY ID in 
raw_category. Hence, we query the duplicated values.
This shows the CATEGORY ID values that have more than one
occurrence. We should expect 8 of them. */
SELECT CATEGORYID, COUNT(*)
FROM raw_category
GROUP BY CATEGORYID
HAVING COUNT(*) > 1;
