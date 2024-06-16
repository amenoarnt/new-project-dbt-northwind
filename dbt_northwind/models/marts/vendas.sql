with vendas as (
    select
        *
    from
        {{ ref('stg_crm_new_table') }}
)

select * from vendas