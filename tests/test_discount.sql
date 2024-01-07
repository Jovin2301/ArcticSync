with
order_detail as (
    select * from {{ ref('raw_order_details') }}
)

select
    orderid,
    productid,
    sum(discount) as total_discount
from order_detail
group by orderid, productid
having total_discount < 0 or total_discount > 1