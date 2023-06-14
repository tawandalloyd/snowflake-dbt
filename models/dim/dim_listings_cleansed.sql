{{
    config(
        materialized = 'view' 
    )
}}
WITH dim_cleansed AS (
    SELECT * FROM {{ ref("src_listings")}}
)
    SELECT 
    listing_id,
    listing_name,
    room_type,
        CASE 
            WHEN  minimum_nights = 0 THEN 1
            ELSE minimum_nights
        END AS minimum_nights,
    host_id,
    replace (
        price_str,
        '$'
    ) :: number (
        10,
        2
    ) as price,
    created_at,
    updated_at
    FROM 
    dim_cleansed
