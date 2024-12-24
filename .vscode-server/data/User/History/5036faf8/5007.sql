{{
    config(
        materialized='incremental',
        unique_key='segments_date||ad_group_id||ad_group_ad_ad_type||ad_group_ad_status||campaign_status||segments_ad_network_type||ad_group_status||campaign_id||customer_id||ad_group_ad_ad_id'
    )
}}

WITH ad_legacy_data AS (
    SELECT
        *
    FROM {{ ref('stg_gads__ad_group_ad_legacy') }}
    {% if is_incremental() %}
        WHERE segments_date > (SELECT max(segments_date) FROM {{ this }} - interval '14 days')
    {% endif %}
),

final AS (
    SELECT
        *,
        '{{ invocation_id }}' as batch_id
    FROM ad_legacy_data
)

SELECT * FROM final
