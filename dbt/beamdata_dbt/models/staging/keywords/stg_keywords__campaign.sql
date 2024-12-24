-- with final as 
-- ( 
SELECT
    segments_date::date as segments_date,
    -- segments_device as device,
    campaign_id::bigint as campaign_id, -- primary key 
    campaign_name as campaign_name,
    campaign_status as campaign_status
FROM {{source ('g_ads_data_all_without_legacy_data','campaign_main')}}
WHERE segments_date >= '2021-01-01' --segments_date BETWEEN '2021-01-01' AND '2024-08-18'
--AND campaign.status != 'REMOVED'
