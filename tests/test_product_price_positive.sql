-- CHECKING IF THERE ARE ANY PRODUCTPRICE THAT IS NEGATIVE
SELECT unitPrice * (1-discount) * quantity as productPrice FROM
raw_order_details 
WHERE unitPrice * (1-discount) * quantity < 0
