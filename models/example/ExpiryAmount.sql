{{ config(materialized='table') }}

with source_data as (

SELECT * FROM {{ source('src1', 'INSURANCETABLE') }} WHERE PLENDT='1-Sep-21'

),
final as(
    select * from source_data
)

select * from final