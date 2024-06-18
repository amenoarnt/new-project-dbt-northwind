{{ config(
    schema='gold',
    materialized='table'
) }}

with uk_clients_who_pay_more_than_1000 as (
    select 
        contact_name, 
        sum(unit_price * quantity * (1.0 - discount) * 100) / 100 as payments
    from {{ ref('int_marketing_customers') }}
    where country = 'UK'
    group by 
        contact_name
    having sum(unit_price * quantity * (1.0 - discount) * 100) / 100 > 1000
    order by 
        payments desc
)

select * from uk_clients_who_pay_more_than_1000