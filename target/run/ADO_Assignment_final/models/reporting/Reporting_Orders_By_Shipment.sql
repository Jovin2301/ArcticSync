
  
    

        create or replace transient table ASSIGNMENT2.NWT.Reporting_Orders_By_Shipment
         as
        (-- count of orders shipped by shipment types

SELECT
SHIPVIA,
ORDERID,
CUSTOMERID

from ASSIGNMENT2.NWT.stg_faris
        );
      
  