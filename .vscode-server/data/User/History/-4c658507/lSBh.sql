-- with source_table as 
-- (
--     select * from {{source ('g_ads_data','campaign_main')}} 
-- ),

-- final as 
-- ( 
    SELECT
        segments_date::date as segments_date,
        -- segments_device as device,
        ad_group_id::bigint as ad_group_id, --primary key
        ad_group_name as ad_group_name,
        -- campaign_name as campaign_name,
        campaign_id::bigint as campaign_id, --foreign key
        ad_group_status as ad_group_status,
        ad_group_type as ad_group_type
        -- metrics_clicks::bigint  as clicks,
        -- metrics_impressions::bigint  as impressions,
        -- metrics_ctr::numeric as ctr,
        -- metrics_average_cpc::numeric as avg_cpc,
        -- metrics_cost_micros::bigint as cost_micros
    FROM {{source ('g_ads_data','ad_group_main')}}
    WHERE segments_date BETWEEN '2016-07-04' AND '2024-05-18'