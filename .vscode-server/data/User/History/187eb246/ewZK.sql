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
FROM {{source ('g_ads_data','campaign_main')}}
WHERE segments_date BETWEEN '2016-07-04' AND '2024-05-18'
--AND campaign.status != 'REMOVED'
