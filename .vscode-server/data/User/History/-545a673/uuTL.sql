SELECT 
  distinct 
  combined.segments_date,
  combined.keyword,
  combined.campaign,
  combined.ad_group,
  ad_group_criterion.ad_group_criterion_approval_status,
  combined.match_type,
  combined.clicks,
  combined.impressions,
  combined.ctr,
  --metrics_average_cpc,
  combined.cost
FROM {{ref ('keyword_x_campaign_x_ad_group_combined')}} combined
LEFT JOIN {{ref ('stg_keywords__ad_group_criterion')}} AS ad_group_criterion 
    ON combined.ad_group_criterion_criterion_id = ad_group_criterion.ad_group_criterion_criterion_id
WHERE combined.segments_date >= '2023-01-01' and combined.ad_group is not null
order by 
    combined.cost desc