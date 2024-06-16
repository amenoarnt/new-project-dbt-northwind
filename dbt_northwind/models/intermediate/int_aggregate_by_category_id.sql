with int_aggregate_by_category_id as (
    select 
        id,
        count(*)
    FROM
        {{ ref('stg_crm_new_table') }}
    group by 
        id
)   

select * from int_aggregate_by_category_id
