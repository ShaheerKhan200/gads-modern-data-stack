SELECT 
  distinct 
  keyword.segments_date as segments_date,
  keyword.ad_group_criterion_keyword_text as keyword,
  campaign.campaign_name as campaign,
  keyword.ad_group_id
  --ad_group_criterion.system_serving_status,
  keyword.ad_group_criterion_keyword_match_type as match_type,
  keyword.ad_group_criterion_criterion_id as ad_group_criterion_criterion_id,
  keyword.clicks as clicks,
  keyword.impressions as impressions,
  keyword.ctr as ctr,
  --metrics_average_cpc,
  ROUND((CAST(keyword.cost_micros AS DECIMAL) / 1000000.0), 3) as cost
FROM {{ref ('stg_keywords__keyword')}} keyword
LEFT JOIN {{ref ('stg_keywords__campaign')}} AS campaign 
    ON keyword.campaign_id = campaign.campaign_id and keyword.segments_date = campaign.segments_date --and campaign.segments_date='2024-05-10'
WHERE keyword.segments_date >= '2023-01-01' --'2024-05-10'
order by 
    cost desc