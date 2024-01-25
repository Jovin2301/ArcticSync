{{ config(
   materialized='view',
) }}

select
    -- from raw_employee
    e.EmployeeId,
    et.TerritoryId as EmployeeTerritoryId,  -- Qualified to avoid ambiguity

    -- from raw_territory
    t.TerritoryId,
    t.TerritoryDescription,

    -- from raw_region
    r.RegionId,
    r.RegionDescription,

    -- from raw_employee
    e.LastName,
    e.FirstName,
    -- ... (other employee columns)

    -- from raw_order
    o.CustomerId,
    -- ... (other order columns)

    -- from raw_order_details
    od.ProductId,
    -- ... (other order details columns)

from {{ ref('raw_employee') }} as e
left join {{ ref('raw_employee_territory') }} as et
    on e.EmployeeId = et.EmployeeId
left join {{ ref('raw_region') }} as r
    on r.RegionId = t.RegionId  -- Assuming correct join condition
left join {{ ref('raw_territory') }} as t
    on t.TerritoryId = et.TerritoryId  -- Corrected to reference et.TerritoryId
left join {{ ref('raw_order')}} as o
    on o.EmployeeId = e.EmployeeId
left join {{ ref('raw_order_details')}} as od
    on od.OrderId = o.OrderId
