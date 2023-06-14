{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}
WITH fct_review AS (

    SELECT * FROM {{ref ("src_reviews")}}
)
SELECT * FROM fct_review
    WHERE reviewer_text IS NOT NULL
{% if is_incremental() %}
    AND review_date > (SELECT max(review_date) FROM {{ this }})
{% endif  %}
