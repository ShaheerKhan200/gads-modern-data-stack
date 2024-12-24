with source_table as 
(
    select * from {{source ('g_ads_data','campaign_main')}} 
),

final as 
( 
    SELECT 
        segments.date as date,
        segments.device as device,
        ad_group.name as ad_group_name,
        campaign.name as campaign_name,
        ad_group.status as ad_group_status,
        ad_group.type,
        metrics.clicks,
        metrics.impressions,
        metrics.ctr,
        metrics.average_cpc,
        metrics.cost_micros
    FROM ad_group
    WHERE segments.date DURING LAST_7_DAYS
    AND ad_group.status != 'REMOVED'
)