SELECT 
  distinct 
  keyword.segments_date as segments_date,
  keyword.ad_group_criterion_keyword_text as keyword,
  campaign.campaign_name as campaign,
  ad_group.ad_group_name as ad_group,
  --ad_group_criterion.system_serving_status,
  keyword.ad_group_criterion_keyword_match_type as match_type,
  --ad_group_criterion.approval_status,
  --ad_group_criterion.final_urls,
  --keyword.metrics_cost_micros
  keyword.clicks as clicks,
  keyword.impressions as impressions,
  keyword.ctr as ctr,
  --metrics_average_cpc,
  ROUND((CAST(keyword.cost_micros AS DECIMAL) / 1000000.0), 3) as cost
FROM {{ref ('keyword_x_campaign_x_ad_group_step1')}} step_1
LEFT JOIN {{ref ('keyword_x_campaign_x_ad_group_step2')}} AS step_2 
    ON keyword.campaign_id = campaign.campaign_id and keyword.segments_date = campaign.segments_date --and campaign.segments_date='2024-05-10'
WHERE keyword.segments_date >= '2023-01-01' --'2024-05-10'
order by 
    cost desc