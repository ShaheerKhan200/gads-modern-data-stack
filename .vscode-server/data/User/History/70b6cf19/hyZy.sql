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
        ad_group_status as ad_group_status,
        ad_group_type as ad_group_type
    FROM {{source ('g_ads_data','ad_group_main')}}
    WHERE segments_date >= '2021-01-01' --segments_date BETWEEN '2021-01-01' AND '2024-08-18'