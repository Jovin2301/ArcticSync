with
order_detail as (
    select * from {{ ref('raw_order_details') }}
)

select
    orderid,
    productid,
    sum(unitprice) as total_up
from order_detail
group by orderid, productid -- verifying each row in the table
having total_up < 0