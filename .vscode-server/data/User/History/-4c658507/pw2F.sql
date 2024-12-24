-- with source_table as 
-- (
--     select * from {{source ('g_ads_data','campaign_main')}} 
-- ),

-- final as 
-- ( 
    SELECT 
        segments.date::date as date_full,
        segments.device as device,
        ad_group.id::bigint as ad_group_id, --primary key
        ad_group.name as ad_group_name,
        campaign.name as campaign_name,
        campaign.id::bigint as campaign_id, --foreign key
        ad_group.status as ad_group_status,
        ad_group.type as ad_group_type,
        metrics.clicks::bigint  as clicks,
        metrics.impressions::bigint  as impressions,
        metrics.ctr::numeric as ctr,
        metrics.average_cpc::numeric as avg_cpc,
        metrics.cost_micros::bigint as cost_micros
    FROM {{source ('g_ads_data','ad_group_main')}}
    WHERE segments.date BETWEEN '2016-07-04' AND '2024-05-12'