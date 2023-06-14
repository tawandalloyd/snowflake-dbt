with raw_listings as(
    SELECT * FROM {{ source('airbnb','listings')}}
)
    SELECT
        ID AS listing_id,
        name as listing_name,
        listing_url,
        room_type,
        minimum_nights,
        host_id,
        price as price_str,
        created_at,
        updated_at
    FROM
    RAW_LISTINGS