SELECT

ORDERID,
CUSTOMERID,
ORDERDATE,
PRODUCTNAME

from {{ ref('stg_faris') }}
