{{ config(materialized='table') }}


select c.c_custkey as key,c.c_name as name ,c.c_nationkey as nation, sum(o.O_TOTALPRICE) as total  from {{source('tpch_sf1','CUSTOMER')}} c
LEFT JOIN {{source('tpch_sf1','ORDERS')}} O ON C.C_CUSTKEY = O.O_CUSTKEY

GROUP BY C.C_CUSTKEY,C.C_NAME,C.C_NATIONKEY
having total > 0