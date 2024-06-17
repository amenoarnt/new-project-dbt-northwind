with customer_source as (
    select * from {{ source('northwind', 'customers') }}
)

 select * from customer_source