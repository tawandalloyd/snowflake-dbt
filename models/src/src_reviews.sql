with raw_reviews as(
    SELECT * FROM {{ source('airbnb','reviews')}}
)
    SELECT
      listing_id,
      date as review_date,
      reviewer_name,
      comments as reviewer_text,
      sentiment as review_sentiment
    FROM
        RAW_REVIEWS