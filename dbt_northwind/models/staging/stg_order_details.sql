with order_details_source as (
    select * from {{ source('northwind', 'order_details') }}
)

 select * from order_details_source