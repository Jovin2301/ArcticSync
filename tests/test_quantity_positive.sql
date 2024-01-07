with
order_detail as (
    select * from {{ ref('raw_order_details') }}
)

select
    orderid,
    productid,
    sum(quantity) as total_quantity
from order_detail
group by orderid, productid
having total_quantity < 0