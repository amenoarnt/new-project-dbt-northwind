{{ config(
    schema='gold',
    materialized='table'
) }}

with total_revenue_1997 as (

    select 
        sum(unit_price * quantity * (1 - discount)) as total_revenue_1997
    from {{ ref('int_finance_orders') }}
    where extract(year from order_date) = 1997
)

select * from total_revenue_1997