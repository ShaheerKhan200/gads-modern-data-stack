
-- with final as 
-- ( 
SELECT
    *
FROM {{source ('g_ads_data_legacy_data_only','ad_group_ad_legacy_main')}}
WHERE segments_date >= '2021-01-01' --segments_date BETWEEN '2021-01-01' AND '2024-08-18'