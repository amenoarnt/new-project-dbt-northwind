{{ config(
    schema='gold',
    materialized='table'
) }}

with top_10_products as (
    select 
        product_name,
        sum(unit_price * quantity * (1 - discount)) as total_revenue
    from {{ ref('int_product_products') }}
    group by product_name
    order by total_revenue desc
    limit 10
)

select * from top_10_products