-- with source_table as 
-- (
--     select * from {{source ('g_ads_data','campaign_main')}} 
-- ),

-- with final as 
-- ( 
SELECT
    segments_date::date as date_full,
    -- segments_device as device,
    campaign_id::bigint as campaign_id, -- primary key 
    campaign_name as campaign_name,
    campaign_status as campaign_status,
    campaign_optimization_score::numeric as campaign_optimization_score,
    campaign_advertising_channel_type as campaign_advertising_channel_type,
    campaign_bidding_strategy as campaign_bidding_strategy,
    campaign_bidding_strategy_type as campaign_bidding_strategy_type,
    campaign_budget_amount_micros as campaign_budget_amount_micros,
    metrics_clicks::bigint  as clicks,
    metrics_impressions::bigint  as impressions,
    metrics_ctr::numeric as ctr,
    metrics_average_cpc::numeric as avg_cpc,
    metrics_cost_micros::bigint as cost_micros
FROM {{source ('g_ads_data','campaign_main')}}
WHERE segments_date BETWEEN '2016-07-04' AND '2024-05-12'
--AND campaign.status != 'REMOVED'
