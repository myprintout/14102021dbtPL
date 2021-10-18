{{ config(materialized='table') }}

with source_data as (

select id,bmi,age, iff(((bmi>=25) and (age>=50)),125,100) from  {{ source('src1', 'Insurance2_Updated1') }} as claims_amount

),
final as(
    select * from source_data
)

select * from final
