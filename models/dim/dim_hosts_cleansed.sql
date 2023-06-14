{{
    config(
        materialized = 'view' 
    )
}}
WITH dim_host as(

    SELECT * FROM {{ ref("src_hosts")}}
)
    SELECT 
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) as host_name,
    is_superhost,
    created_at,
    updated_at
    FROM
    dim_host