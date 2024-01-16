
  
    

        create or replace transient table ASSIGNMENT2.NWT.Reporting_Top_Customers
         as
        (SELECT
SHIPNAME,
COMPANYNAME,
CONTACTNAME,
CONTACTTITLE,
CUSTOMERID,
ORDERID,
ProductName

from ASSIGNMENT2.NWT.stg_faris
        );
      
  