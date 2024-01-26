{{ config(materialized='table') }}

SELECT * FROM {{ source('NWT', 'CATEGORY') }}

--select * from raw_category

/* Issue lies in having duplicated values for CATEGORY ID in 
raw_category. Hence, we query the duplicated values.
This shows the CATEGORY ID values that have more than one
occurrence. We should expect 8 of them. */
/*SELECT CATEGORYID, COUNT(*)
FROM raw_category
GROUP BY CATEGORYID
HAVING COUNT(*) > 1; */

-- SELECT DISTINCT * FROM {{ source('NWT', 'CATEGORY') }}
-- CREATE TABLE raw_category AS
-- SELECT DISTINCT * FROM raw_category;
-- ALTER TABLE raw_category ADD UNIQUE (categoryID);

