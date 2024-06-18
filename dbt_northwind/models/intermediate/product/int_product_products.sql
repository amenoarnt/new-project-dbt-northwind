{{ config(
    materialized='view'
    ) 
}}

with products_cte as (
    select
        product_id,
        product_name
    from {{ ref('stg_products') }}
),
customers_cte as (
    select
        customer_id,
        contact_name,
        country
    from {{ ref('stg_customers') }}
),
order_details_cte as (
    select
        order_id,
        product_id,
        unit_price,
        quantity,
        discount

    from {{ ref('stg_order_details') }} 
),
orders_cte as (
    SELECT
        order_id,
        customer_id
    from {{ ref('stg_orders') }}
)

select 
    o.order_id,
    o.customer_id,
    od.unit_price,
    od.quantity,
    od.discount,
    c.contact_name,
    c.country,
    p.product_name
from orders_cte o
join order_details_cte od on o.order_id = od.order_id
join customers_cte c on o.customer_id = c.customer_id
join products_cte p on od.product_id = p.product_id

