-- with source_table as 
-- (
--     select * from {{source ('g_ads_data','campaign_main')}} 
-- ),

-- with final as 
-- ( 
SELECT
    segments_date::date as segments_date,
    -- segments_device as device,
    ad_group_ad_ad_id::bigint as ad_group_ad_id, -- primary key 
    ad_group_id::bigint as ad_group_id, 
    --campaign_id::bigint as campaign_id,
    ad_group_ad_ad_name as ad_group_ad_name,
    ad_group_ad_ad_responsive_search_ad_headlines,
    -- campaign_name as campaign_name,
    -- ad_group_name as ad_group_name,
    ad_group_ad_status as ad_group_ad_status,
    ad_group_ad_ad_type as ad_group_ad_type,
    ad_group_ad_ad_strength as ad_group_ad_strength,
    ad_group_ad_ad_final_urls as ad_group_ad_final_urls,
    ad_group_ad_ad_expanded_text_ad_headline_part1 as ad_group_ad_expanded_text_ad_headline_part1,
    ad_group_ad_ad_expanded_text_ad_headline_part2 as ad_group_ad_expanded_text_ad_headline_part2,
    ad_group_ad_ad_expanded_text_ad_headline_part3 as ad_group_ad_expanded_text_ad_headline_part3,
    ad_group_ad_ad_expanded_text_ad_description as ad_group_ad_expanded_text_ad_description,
    ad_group_ad_ad_expanded_text_ad_description2 as ad_group_ad_expanded_text_ad_description2,
    ad_group_ad_policy_summary_approval_status as ad_group_ad_policy_summary_approval_status
    -- metrics_clicks::bigint  as clicks,
    -- metrics_impressions::bigint  as impressions,
    -- metrics_ctr::numeric as ctr,
    -- metrics_average_cpc::numeric as avg_cpc,
    -- metrics_cost_micros::bigint as cost_micros
FROM {{source ('g_ads_data_all_without_legacy_data','ad_group_ad_main')}}
WHERE segments_date >= '2021-01-01' --segments_date BETWEEN '2021-01-01' AND '2024-08-18'
--AND campaign.status != 'REMOVED'
