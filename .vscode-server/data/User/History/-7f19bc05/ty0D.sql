SELECT
    ad_group_id::bigint as ad_group_id,
    ad_group_criterion_criterion_id as ad_group_criterion_criterion_id,
    ad_group_criterion_keyword_text
    ad_group_criterion_approval_status
FROM {{source ('g_ads_data_all_without_legacy_data','ad_group_criterion_main')}}
WHERE segments_date >= '2021-01-01'
