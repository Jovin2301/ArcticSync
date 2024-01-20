/*Trying to fix the raw_test.yml test case where we replace order date that is
earlier than 1900, to 1900 */

merge into raw_order
using (
  select ORDERID, DATEADD(YEAR, 1900, orderdate) as orderdate2
  from raw_order
  where orderdate < '1900-01-01'
) as src
on raw_order.ORDERID = src.ORDERID
when matched then
  update set raw_order.orderdate = src.orderdate2;

merge into raw_order
using (
  select ORDERID, DATEADD(YEAR, 1900, requireddate) as requireddate2
  from raw_order
  where requireddate < '1900-01-01'
) as src
on raw_order.ORDERID = src.ORDERID
when matched then
  update set raw_order.requireddate = src.requireddate2;

merge into raw_order
using (
  select ORDERID, DATEADD(YEAR, 1900, shippeddate) as shippeddate2
  from raw_order
  where shippeddate < '1900-01-01'
) as src
on raw_order.ORDERID = src.ORDERID
when matched then
  update set raw_order.shippeddate = src.shippeddate2;

update raw_order
set shippeddate = '1900-01-01'
where shippeddate is null;