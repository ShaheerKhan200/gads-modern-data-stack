with source_table as 
(
    select * from {{source ('g_ads_data','campaign_main')}} 
),

final as 
( 
    SELECT
    segments.date as date,
    segments.device as device,
    campaign.id as campaign_id,
    campaign.name as campaign_name,
    campaign.status as campaign_status,
    campaign.optimization_score as campaign_optimization_score,
    campaign.advertising_channel_type as ,
    campaign.bidding_strategy,
    campaign.bidding_strategy_type,
    campaign_budget.amount_micros,
    metrics.clicks,
    metrics.impressions,
    metrics.ctr,
    metrics.average_cpc,
    metrics.cost_micros
    FROM campaign
    WHERE segments.date DURING LAST_7_DAYS
    AND campaign.status != 'REMOVED'
)