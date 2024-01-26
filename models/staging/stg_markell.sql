
select
--from raw_employee
e.employeeID,
e.firstname,
e.lastname,
e.title,
e.hiredate,
e.city,
e.country,
e.photo,
e.photopath,
e.reportsto,
-- from order
o.orderID,
o.customerID, -- needed for KPI
o.orderDate,
o.freight,

-- from orderdetail
od.ProductID,
od.UnitPrice, 
od.Quantity,
od.Discount,
-- from customer
c.CompanyName,
c.country as CustomerCountry,
c.city as CustomerCity,

-- from product (added later, not in original dataset)
p.UnitCost,

(od.UnitPrice * od.Quantity) as OrderPrice,
(od.UnitPrice * od.Quantity * (1-od.Discount)) as DiscountedOrderPrice,
(p.UnitCost * od.Quantity + freight) as OrderCost,
(DiscountedOrderPrice - OrderCost) as Profit
--total cost = (unitcost * quantity) + frieght
--Profit = discountedorderprice - total cost


from {{ ref ('raw_employee')}} as e

left join {{ ref ('raw_order')}} as o
on e.Employeeid = o.Employeeid

left join {{ ref ('raw_order_details')}} as od
on o.OrderID = od.OrderID

left join {{ ref ('raw_customer')}} as c
on o.CustomerID = c.CustomerID

left join {{ref ('raw_product')}} as p
on p.ProductID = od.ProductID

--where o.OrderDate >= '1996-01-01'

