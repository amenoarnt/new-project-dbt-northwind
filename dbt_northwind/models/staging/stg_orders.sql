with orders_source as (
    select * from {{ source('northwind', 'orders') }}
)

 select * from orders_source