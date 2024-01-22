
{{
    config(
        materialized='incremental',
        unique_key='product_id',
        incremental_strategy='merge'
    )
}}
WITH using_clause AS (
    SELECT
        p.ProductID,
        fp.UnitCost
    FROM FRESH_PRODUCT AS p
    JOIN PRODUCT AS fp
    ON p.ProductID = fp.ProductID
),
updates AS (
    SELECT
        ProductID,
        UnitCost
    FROM using_clause
    WHERE UnitCost IS NOT NULL
),
inserts AS (
    SELECT
        ProductID,
        UnitCost
    FROM using_clause
    WHERE ProductID NOT IN (SELECT ProductID FROM updates)
)
SELECT *
FROM updates
UNION ALL
SELECT *
FROM inserts