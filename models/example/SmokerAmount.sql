{{ config(materialized='table') }}

with source_data as (

select *, iff((SMOKER=1),CHARGES*2,CHARGES) as Updated_Smoker_Charges from  {{ source('src1', 'INSURANCETABLE') }}

),
final as(
    select * from source_data
)

select * from final