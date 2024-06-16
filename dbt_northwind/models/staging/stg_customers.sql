with sources as (
    select * from {{ source('northwind', 'customers') }}
)

SELECT
    customer_id as id,
    contact_name as name, 
    phone as phone_number
from 
    sources