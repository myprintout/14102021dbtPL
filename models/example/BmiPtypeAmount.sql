{{ config(materialized='table') }}

with source_data as (

SELECT * FROM {{ source('src1', 'INSURANCETABLE') }} WHERE BMI>45 AND POICYTYP='Personal'

),
final as(
    select * from source_data
)

select * from final