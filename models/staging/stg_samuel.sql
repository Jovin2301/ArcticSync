{{ config(
   materialized='view',
) }}

select
--from raw_employeeTerridtory
e.EmployeeId,
t.TerritoryId,

--from raw_territory
TerritoryId,
r.RegionId,
TerritoryDescription,

--from raw_region
RegionId,
RegionDescription,

--from raw_employee
EmployeeId,
LastName,
FirstName,
Title,
TitleOfCourtesy,
BirthDate,
HireDate,
Address, 
City,
Region,
PostalCode,
Country,
HomePhone,
Extension,
Photo,
Notes, ReportsTo, PhotoPath,

-- from raw_order
CustomerId,
OrderDate,
RequiredDate,
ShippedDate,
ShipVia,
Freight,
ShipName,
ShipAddress,
ShipCity,
ShipRegion,
ShipPostalCode,
ShipCountry,

-- from raw_order_details
ProductId,
UnitPrice,
Quantity,
Discount

from {{ ref('raw_employee') }} as e
left join {{ ref('raw_employee_territory') }} as et
on e.EmployeeId = et.EmployeeId
left join {{ ref('raw_region') }} as r
on r.RegionId = t.RegionId
left join {{ ref('raw_territory') }} as t
on t.TerritoryId = et.TerritoryId
left join {{ ref('raw_order')}} as o
on o.EmployeeId = e.EmployeeId
left join {{ ref('raw_order_details')}} as od
on od.OrderId = o.OrderId