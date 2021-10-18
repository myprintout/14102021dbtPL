{{ config(materialized='table') }}

with source_data as (

SELECT ZIP,POICYTYP,SUM(CHARGES) FROM {{ source('src1', 'INSURANCETABLE') }} GROUP BY ZIP,POICYTYP

),
final as(
    select * from source_data
)

select * from final