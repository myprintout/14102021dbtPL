{{ config(materialized='table') }}

with source_data as (

select t1.*,t2.CLAIMS_AMOUNT from {{ source('src1', 'Insurance2_Updated1') }} as t1
left join {{ source('src1', 'Amount') }} as t2 on t1.smoker=t2.smoker

),
final as(
    select * from source_data
)

select * from final
