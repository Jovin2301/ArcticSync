USE ASSIGNMENT2.NWT;
merge into PRODUCT as p
using FRESH_PRODUCT as fp
on p.ProductID = fp.ProductID
when MATCHED then
  update set p.UnitCost = fp.UnitCost
  where p.UnitCost is null;
