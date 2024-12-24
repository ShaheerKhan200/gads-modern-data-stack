SELECT 
  distinct 
  segments_date,
  keyword,
  campaign,
  ad_group,
  --ad_group_criterion.system_serving_status,
  match_type,
  --ad_group_criterion.approval_status,
  --ad_group_criterion.final_urls,
  --keyword.metrics_cost_micros
  clicks,
  impressions,
  ctr,
  --metrics_average_cpc,
  cost
FROM {{ref ('keyword_x_campaign_x_ad_group_step1')}} step_1
LEFT JOIN {{ref ('keyword_x_campaign_x_ad_group_step2')}} AS step_2 
    ON step_1.segments_date = step_2.segments_date and step_1.keyword = step_2.keyword and step_1.match_type = step_2.match_type--and campaign.segments_date='2024-05-10'
WHERE segments_date >= '2023-01-01' --'2024-05-10'
order by 
    cost desc