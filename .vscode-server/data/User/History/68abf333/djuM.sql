-- with source_table as 
-- (
--     select * from {{source ('g_ads_data','campaign_main')}} 
-- ),

-- with final as 
-- ( 
SELECT
    segments_date::date as segments_date,
    ad_group_criterion_keyword_text,
    ad_group_criterion_keyword_match_type,
    metrics_clicks::bigint  as clicks,
    metrics_impressions::bigint  as impressions,
    metrics_ctr::numeric as ctr,
    metrics_cost_micros::bigint as cost_micros,
    ROUND((CAST(cost_micros AS DECIMAL) / 1000000.0), 3) as cost
FROM {{source ('g_ads_data','keyword_main')}}
WHERE segments_date BETWEEN '2016-07-04' AND '2024-08-18'
--AND campaign.status != 'REMOVED'
