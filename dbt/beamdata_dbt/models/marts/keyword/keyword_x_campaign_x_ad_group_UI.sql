SELECT 
  distinct 
  step_2.segments_date,
  step_2.keyword,
  step_2.match_type,
  step_2.campaign,
  step_2.ad_group,
  ad_group_criterion.ad_group_criterion_status,
  step_2.clicks,
  step_2.impressions,
  step_2.ctr,
  step_2.cost
FROM {{ref ('keyword_x_campaign_x_ad_group_step2')}} step_2
LEFT JOIN {{ref ('stg_keywords__ad_group_criterion')}} AS ad_group_criterion 
    ON step_2.ad_group_criterion_criterion_id = ad_group_criterion.ad_group_criterion_criterion_id
WHERE step_2.segments_date >= '2023-01-01' and step_2.ad_group is not null and step_2.campaign is not null
order by 
    step_2.cost desc