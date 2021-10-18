{{ config(materialized='table') }}

with source_data as (

select id,bmi,age, iff(((bmi>=25) and (age>=50)),CHARGES*1.25,CHARGES) as Updated_Charges from  {{ source('src1', 'INSURANCETABLE') }}

),
final as(
    select * from source_data
)

select * from final