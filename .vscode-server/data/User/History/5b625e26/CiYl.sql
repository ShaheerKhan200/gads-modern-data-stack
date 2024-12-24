-- with source_table as 
-- (
--     select * from {{source ('g_ads_data','campaign_main')}} 
-- ),

-- with final as 
-- ( 
SELECT
    segments.date as date,
    segments.device as device,
    campaign.id as campaign_id,
    campaign.name as campaign_name,
    campaign.status as campaign_status,
    campaign.optimization_score as campaign_optimization_score,
    campaign.advertising_channel_type as campaign_advertising_channel_type,
    campaign.bidding_strategy as campaign_bidding_strategy,
    campaign.bidding_strategy_type as campaign_bidding_strategy_type,
    campaign_budget.amount_micros as campaign_budget_amount_micros,
    metrics.clicks as clicks,
    metrics.impressions as impressions,
    metrics.ctr as ctr,
    metrics.average_cpc as avg_cpc,
    metrics.cost_micros as cost_micros
FROM {{source ('g_ads_data','campaign_main')}}
WHERE segments.date DURING LAST_7_DAYS #all data from start
AND campaign.status != 'REMOVED'
