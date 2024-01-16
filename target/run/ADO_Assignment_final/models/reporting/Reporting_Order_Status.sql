
  
    

        create or replace transient table ASSIGNMENT2.NWT.Reporting_Order_Status
         as
        (SELECT
ORDERDATE,
SHIPPEDDATE,
REQUIREDDATE,
SHIPVIA,
ORDERID,
CUSTOMERID

from ASSIGNMENT2.NWT.stg_faris
        );
      
  