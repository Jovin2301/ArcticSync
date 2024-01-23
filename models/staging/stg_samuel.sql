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

FROM {{ ref('raw_employee') }} e
LEFT JOIN {{ ref('raw_employee_territory') }} et 
ON e.EmployeeId = et.EmployeeId
LEFT JOIN {{ ref('raw_territory') }} t 
ON et.TerritoryId = t.TerritoryId
LEFT JOIN {{ ref('raw_region') }} r 
ON t.RegionId = r.RegionId
LEFT JOIN {{ ref('raw_order') }} o 
ON e.EmployeeId = o.EmployeeId
LEFT JOIN {{ ref('raw_order_details') }} od 
ON o.OrderId = od.OrderId;