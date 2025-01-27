{{
    config(
        materialized = 'incremental',
        incremental_strategy='delete+insert'
    )
}}

WITH ad_legacy_data AS (
    SELECT
        segments_date,
        customer_id,
        campaign_id,
        campaign_name,
        campaign_status,
        campaign_type,
        ad_group_id, 
        ad_group_name,
        ad_group_ad_id, -- primary key 
        ad_group_ad_status,
        ad_group_status,
        ad_group_ad_type,  -- Changed from ad_group_ad_ad_type to ad_group_ad_type
        ad_group_ad_strength,
        ad_group_ad_final_urls,
        clicks,
        impressions,
        conversions,
        interactions,
        ctr,
        avg_cpc,
        cost_micros
    FROM {{ ref('stg_gads__ad_group_ad_legacy') }}
    {% if is_incremental() %}
        WHERE segments_date >= (SELECT max(segments_date) FROM {{ this }}) - interval '14 days'
    {% endif %}
),

final AS (
    SELECT
        segments_date,
        customer_id,
        campaign_id,
        campaign_name,
        campaign_status,
        campaign_type,
        ad_group_id, 
        ad_group_name,
        ad_group_ad_id, -- primary key 
        ad_group_ad_status,
        ad_group_status,
        ad_group_ad_type,  -- Changed from ad_group_ad_ad_type to ad_group_ad_type
        ad_group_ad_strength,
        ad_group_ad_final_urls,
        clicks,
        impressions,
        conversions,
        interactions,
        ctr,
        avg_cpc,
        cost_micros,
        '{{ invocation_id }}' as batch_id
    FROM ad_legacy_data
)

SELECT * FROM final