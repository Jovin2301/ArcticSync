
  
    

        create or replace transient table ASSIGNMENT2.NWT.report_best_employee_jovin
         as
        (SELECT 
    LASTNAME, 
    FIRSTNAME, 
    TITLE, 
    ORDERID,
    PRODUCTID,
    QUANTITY,
    DISCOUNT,
    orderDate,
    REQUIREDDATE, 
    PRODUCTNAME,
    CATEGORYNAME, 
    PRODUCTPRICE,
    TOTALSALES,
    PHOTOPATH
FROM ASSIGNMENT2.NWT.stg_jovin
GROUP BY 
    ORDERID,
    PRODUCTID,
    PRODUCTNAME,
    TOTALSALES, 
    PRODUCTPRICE,
    CATEGORYNAME,
    PRODUCTNAME, 
    LASTNAME,
    FIRSTNAME,
    TITLE,
    QUANTITY,
    DISCOUNT,
    ORDERDATE,
    REQUIREDDATE,
    PHOTOPATH
        );
      
  