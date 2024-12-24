
-- with final as 
-- ( 
SELECT
    segments_date::date as segments_date,
    customer_id::bigint as customer_id,
    campaign_id::bigint as campaign_id,
    campaign_name as campaign_name,
    campaign_status as campaign_status,
    segments_ad_network_type as campaign_type,
    ad_group_id::bigint as ad_group_id, 
    ad_group_name as ad_group_name,
    ad_group_ad_ad_id::bigint as ad_group_ad_id, -- primary key 
    ad_group_ad_status as ad_group_ad_status,
    ad_group_status as ad_group_status,
    --ad_group_ad_ad_name as ad_group_ad_name, -- NOT HERE TAKE IT FROM AD_GROUP_AD TABLE
    ad_group_ad_ad_type as ad_group_ad_type,
    ad_group_ad_ad_strength as ad_group_ad_strength,
    ad_group_ad_ad_final_urls as ad_group_ad_final_urls,
    ad_group_ad_ad_expanded_text_ad_headline_part1 as ad_group_ad_expanded_text_ad_headline_part1,
    ad_group_ad_ad_expanded_text_ad_headline_part2 as ad_group_ad_expanded_text_ad_headline_part2,
    ad_group_ad_ad_expanded_text_ad_headline_part3 as ad_group_ad_expanded_text_ad_headline_part3,
    ad_group_ad_ad_expanded_text_ad_description as ad_group_ad_expanded_text_ad_description,
    ad_group_ad_ad_expanded_text_ad_description2 as ad_group_ad_expanded_text_ad_description2,
    ad_group_ad_policy_summary_approval_status as ad_group_ad_policy_summary_approval_status,
    metrics_clicks::bigint as clicks,
    metrics_impressions::bigint as impressions,
    metrics_conversions::bigint as conversions,
    metrics_interactions::bigint as interactions,
    metrics_ctr::numeric as ctr,
    metrics_average_cpc::numeric as avg_cpc,
    metrics_cost_micros::bigint as cost_micros,
    _airbyte_extracted_at as extracted_at
FROM {{source('gads_raw','ad_group_ad_legacy_main')}}
WHERE segments_date >= '2021-01-01' --segments_date BETWEEN '2021-01-01' AND '2024-08-18'