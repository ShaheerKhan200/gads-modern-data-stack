SELECT 
  distinct 
  step_1.segments_date as segments_date,
  step_1.ad_group_criterion_keyword_text as keyword,
  ad_group.ad_group_name as ad_group,
  --ad_group_criterion.system_serving_status,
  step_1.ad_group_criterion_keyword_match_type as match_type,
  step_1.ad_group_criterion_criterion_id as ad_group_criterion_criterion_id,
  step_1.clicks as clicks,
  step_1.impressions as impressions,
  step_1.ctr as ctr,
  --metrics_average_cpc,
  ROUND((CAST(step_1.cost_micros AS DECIMAL) / 1000000.0), 3) as cost
FROM {{ref ('keyword_x_campaign_x_ad_group_step1')}} step_1
LEFT JOIN {{ref ('stg_keywords__ad_group')}} AS ad_group
    ON step_1.ad_group_id = ad_group.ad_group_id and step_1.segments_date = ad_group.segments_date
WHERE keyword.segments_date >= '2023-01-01'
order by 
    cost desc