-- with source_table as 
-- (
--     select * from {{source ('g_ads_data','campaign_main')}} 
-- ),

-- with final as 
-- ( 
SELECT
    segments.date::date as date_full,
    segments.device as device,
    ad_group_ad.ad.id::bigint as ad_group_ad_id, 
    ad_group.id::bigint as ad_group_id, 
    campaign.id::bigint as campaign_id
    ad_group_ad.ad.name as ad_group_ad_name,
    campaign.name as campaign_name,
    ad_group.name as ad_group_name,
    ad_group_ad.status as ad_group_ad_status,
    ad_group_ad.ad.type as ad_group_ad_type,
    ad_group_ad.ad_strength as ad_group_ad_strength,
    ad_group_ad.ad.final_urls,
    ad_group_ad.ad.expanded_text_ad.headline_part1,
    ad_group_ad.ad.expanded_text_ad.headline_part2,
    ad_group_ad.ad.expanded_text_ad.headline_part3,
    ad_group_ad.ad.expanded_text_ad.description,
    ad_group_ad.ad.expanded_text_ad.description2,
    ad_group_ad.policy_summary.approval_status,
    metrics.clicks::bigint  as clicks,
    metrics.impressions::bigint  as impressions,
    metrics.ctr::numeric as ctr,
    metrics.average_cpc::numeric as avg_cpc,
    metrics.cost_micros::bigint as cost_micros
FROM {{source ('g_ads_data','campaign_main')}}
WHERE segments.date BETWEEN '2016-07-04' AND '2024-05-12'
--AND campaign.status != 'REMOVED'
