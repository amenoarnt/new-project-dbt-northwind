
with renamed as (
    SELECT
        category_id as id,
        category_name as name,
        description,
        picture,
        updated_at
    FROM 
        {{ ref('raw_crm_new_table') }}
)

SELECT * FROM renamed