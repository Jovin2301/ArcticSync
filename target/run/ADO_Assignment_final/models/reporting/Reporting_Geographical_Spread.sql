
  
    

        create or replace transient table ASSIGNMENT2.NWT.Reporting_Geographical_Spread
         as
        (SELECT

SHIPCOUNTRY,
SHIPCITY,
-- SHIPREGION,
SHIPPOSTALCODE,
SHIPADDRESS,
ADDRESS,
CITY,
-- REGION,
POSTALCODE,
COUNTRY,
CUSTOMERID,
ORDERID

from ASSIGNMENT2.NWT.stg_faris
        );
      
  