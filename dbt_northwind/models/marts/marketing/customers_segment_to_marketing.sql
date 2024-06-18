{{ config(
    schema='gold',
    materialized='table'
) }}

with customers_to_marketing as(
    select 
        company_name,
        sum(unit_price * quantity * (1 - discount)) as total_spent,
        ntile(5) over (order by sum(unit_price * quantity * (1 - discount)) desc) as customer_segment

    from {{ ref('int_marketing_customers') }}
    group by company_name
    order by total_spent desc
)

select * from customers_to_marketing
