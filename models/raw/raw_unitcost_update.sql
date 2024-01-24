-- -- Update records where unit cost is greater than unit price
-- UPDATE product_fresh
-- SET
--   unit_cost = unit_price,
--   unit_price = unit_cost
-- WHERE
--   unit_cost > unit_price;
-- /* 
-- we reflect on why we do not change it

-- for example, for txt and whole numbers, we do not change them (?)
-- for example, if there is a promotion running, there are a lot of factors
-- behind the null imputation of unitcost

-- However we cannot make the unit price equal to unit cost

-- */