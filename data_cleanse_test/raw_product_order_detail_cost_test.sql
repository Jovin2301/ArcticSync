with productcost as (
    select UnitCost
    from {{ ref('raw_product') }}
),
orderdetailcost AS (
    select UnitPrice
    from {{ ref('raw_order_details') }}
)
select *
from productcost
cross join orderdetailcost
where productcost.UnitCost < orderdetailcost.UnitPrice
