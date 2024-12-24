-- with source_table as 
-- (
--     select * from {{source ('g_ads_data','campaign_main')}} 
-- ),

-- with final as 
-- ( 
SELECT
    segments.date::date as date_full,
    segments.device as device,
    campaign.id::bigint as campaign_id, -- primary key 
    campaign.name as campaign_name,
    campaign.status as campaign_status,
    campaign.optimization_score::numeric as campaign_optimization_score,
    campaign.advertising_channel_type as campaign_advertising_channel_type,
    campaign.bidding_strategy as campaign_bidding_strategy,
    campaign.bidding_strategy_type as campaign_bidding_strategy_type,
    campaign_budget.amount_micros as campaign_budget_amount_micros,
    metrics.clicks::bigint  as clicks,
    metrics.impressions::bigint  as impressions,
    metrics.ctr::numeric as ctr,
    metrics.average_cpc::numeric as avg_cpc,
    metrics.cost_micros::bigint as cost_micros
FROM {{source ('g_ads_data','campaign_main')}}
WHERE segments.date BETWEEN '2016-07-04' AND '2024-05-12'
--AND campaign.status != 'REMOVED'
