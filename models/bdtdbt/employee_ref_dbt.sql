{{config 
(materialized="table",transient=false
)}}
    --select * from {{source('raw','EMPLOYEE')}} e
    --inner join {{ref("country_add_codes")}} c on e.country_code=c."country_code"

    select * from {{ref('country_codes')}} e
    inner join {{ref("country_add_codes")}} c on e.country_code=c."country_code"