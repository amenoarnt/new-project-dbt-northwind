{{ config(
    materialized='view'
    ) 
}}

with orders_cte as (
    select
        order_id,
        order_date,
        freight
    from {{ ref('stg_orders') }}
),
order_details_cte as (
    select
        order_id,
        unit_price,
        quantity,
        discount
    from {{ ref('stg_order_details') }}
)

select
    o.order_id,
    o.order_date,
    c.quantity,
    c.unit_price,
    c.discount,
    o.freight
from orders_cte o
join order_details_cte c on o.order_id = c.order_id