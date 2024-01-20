WITH product_unit_cost AS (
    SELECT UnitCost
    FROM {{ ref('raw_product') }}
),
order_detail_unit_price AS (
    SELECT UnitPrice
    FROM {{ ref('raw_order_details') }}
)
SELECT *
FROM product_unit_cost
CROSS JOIN order_detail_unit_price
WHERE product_unit_cost.UnitCost < order_detail_unit_price.UnitPrice