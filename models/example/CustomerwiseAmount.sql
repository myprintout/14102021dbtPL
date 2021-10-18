{{ config(materialized='table') }}

with source_data as (

SELECT ID,CHARGES FROM {{ source('src1', 'INSURANCETABLE') }}

),
final as(
    select * from source_data
)

select * from final