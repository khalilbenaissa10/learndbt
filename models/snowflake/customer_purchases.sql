{{ config(materialized='table') }}


select c.c_custkey as key,c.c_name as name ,c.c_nationkey as nation, sum(o.O_TOTALPRICE) as total  from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS O ON C.C_CUSTKEY = O.O_CUSTKEY

GROUP BY C.C_CUSTKEY,C.C_NAME,C.C_NATIONKEY