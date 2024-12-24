
-- with final as 
-- ( 
SELECT
    segments_date::date as segments_date,
    ad_group_id::bigint as ad_group_id,
    campaign_id::bigint as campaign_id,
    ad_group_criterion_keyword_text,
    ad_group_criterion_keyword_match_type,
    metrics_clicks::bigint as clicks,
    metrics_impressions::bigint as impressions,
    metrics_ctr::numeric as ctr,
    metrics_cost_micros::bigint as cost_micros,
    ROUND((CAST(metrics_cost_micros AS DECIMAL) / 1000000.0), 3) as cost
FROM {{source ('g_ads_data_all_without_legacy_data','keyword_main')}}
WHERE segments_date >= '2021-01-01' --segments_date BETWEEN '2021-01-01' AND '2024-08-18'
--AND campaign.status != 'REMOVED'
