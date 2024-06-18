{{ config(
    schema='gold',
    materialized='table'
) }}

with total_revenue_per_customer as (
    select 
        company_name, 
        sum(unit_price * quantity * (1.0 - discount)) as total
    from {{ ref('int_marketing_customers') }}
    group by 
        company_name
    order by 
        total desc
)

select * from total_revenue_per_customer
