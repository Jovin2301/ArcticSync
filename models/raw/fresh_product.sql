
-- UPDATE Product
-- set p.UNITCOST = (select fp.UnitCost from fresh_product fp
-- inner join product p 
-- ON p.productid = fp.productid)
-- where p.UNITCOST IS NULL



-- UPDATE Product p
-- SET p.UNITCOST = (SELECT fp.UnitCost FROM fresh_product fp  
-- inner join product p ON p.productid = fp.productid)
-- WHERE p.UNITCOST = NULL;
UPDATE Product p
SET p.UNITCOST = (
    SELECT MAX(fp.UnitCost)
    FROM fresh_product fp
    WHERE p.productid = fp.productid
)
WHERE p.UNITCOST IS NULL;
