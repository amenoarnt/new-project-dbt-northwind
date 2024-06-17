{{ config(
    materialized='view'
    ) 
}}

with orders_cte as (
    select
        order_id,
        customer_id
    from {{ ref('stg_orders') }}
),
order_details_cte as (
    select
        order_id,
        unit_price,
        quantity,
        discount
    from {{ ref('stg_order_details') }}
),
customers_cte as (
    select
        customer_id,
        company_name,
        contact_name,
        contact_title,
        country
    from {{ ref('stg_customers') }}
)

select
    o.order_id,
    o.customer_id,
    od.unit_price,
    od.quantity,
    od.discount,
    c.company_name,
    c.contact_name,
    c.contact_title,
    c.country
from orders_cte o
join order_details_cte od on o.order_id = od.order_id
join customers_cte c on o.customer_id = c.customer_id