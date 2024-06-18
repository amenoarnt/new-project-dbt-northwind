{{ config(
    schema='gold',
    materialized='table'
) }}

with monthly_revenue as (
    select 
        extract(year from order_date) as year,
        extract(month from order_date) as month,
        sum(unit_price * quantity * (1 - discount)) as monthly_revenue
    from {{ ref('int_finance_orders') }}
    group by 
        extract(year from order_date), 
        extract(month from order_date)
    order by 
        extract(year from order_date), 
        extract(month from order_date)
),

accrued_revenue as (
    select 
        year,
        month,
        monthly_revenue,
        sum(monthly_revenue) over (partition by year order by month) as revenue_YTD
    from monthly_revenue
)

select
    year,
    month,
    monthly_revenue,
    monthly_revenue - lag (monthly_revenue) over (partition by year order by month) as monthly_revenue_growth,
    revenue_YTD,
    (monthly_revenue - lag (monthly_revenue) over (partition by year order by month)) / lag (monthly_revenue) over (partition by year order by month) * 100 as monthly_revenue_growth_rate
from accrued_revenue
order by year, month