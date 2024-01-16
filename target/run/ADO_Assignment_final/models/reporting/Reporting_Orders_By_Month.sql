
  
    

        create or replace transient table ASSIGNMENT2.NWT.Reporting_Orders_By_Month
         as
        (SELECT

ORDERID,
CUSTOMERID,
ORDERDATE,
PRODUCTNAME

from ASSIGNMENT2.NWT.stg_faris
        );
      
  