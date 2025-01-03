## Campaign
SELECT campaign.name,
  campaign_budget.amount_micros,
  campaign.status,
  campaign.optimization_score,
  campaign.advertising_channel_type,
  metrics.clicks,
  metrics.impressions,
  metrics.ctr,
  metrics.average_cpc,
  metrics.cost_micros,
  campaign.bidding_strategy_type
FROM campaign
WHERE segments.date DURING LAST_7_DAYS
  AND campaign.status != 'REMOVED'

## Ad Group
SELECT 
  ad_group_ad.ad.id, 
  ad_group.id, -- primary key 
  campaign.id
  ad_group.name,
  campaign.name,
  ad_group.status,
  ad_group.type,
  metrics.clicks,
  metrics.impressions,
  metrics.ctr,
  metrics.average_cpc,
  metrics.cost_micros
FROM ad_group
WHERE segments.date DURING LAST_7_DAYS
  AND ad_group.status != 'REMOVED'

## Ad group ad
SELECT ad_group_ad.ad.expanded_text_ad.headline_part1,
  ad_group_ad.ad.expanded_text_ad.headline_part2,
  ad_group_ad.ad.expanded_text_ad.headline_part3,
  ad_group_ad.ad.final_urls,
  ad_group_ad.ad.expanded_text_ad.description,
  ad_group_ad.ad.expanded_text_ad.description2,
  campaign.name,
  ad_group.name,
  ad_group_ad.policy_summary.approval_status,
  ad_group_ad.ad.type,
  metrics.clicks,
  metrics.impressions,
  metrics.ctr,
  metrics.average_cpc,
  metrics.cost_micros
FROM ad_group_ad
WHERE segments.date DURING LAST_7_DAYS
  AND ad_group_ad.status != 'REMOVED'

# modified
## Ad group ad
SELECT 
  ad_group_ad.ad.id, -- primary key
  ad_group.id, 
  campaign.id
  ad_group_ad.ad.name,
  campaign.name,
  ad_group.name,
  ad_group_ad.status,
  ad_group_ad.ad.type,
  ad_group_ad.ad_strength,
  ad_group_ad.ad.final_urls,
  ad_group_ad.ad.expanded_text_ad.headline_part1,
  ad_group_ad.ad.expanded_text_ad.headline_part2,
  ad_group_ad.ad.expanded_text_ad.headline_part3,
  ad_group_ad.ad.expanded_text_ad.description,
  ad_group_ad.ad.expanded_text_ad.description2,
  ad_group_ad.policy_summary.approval_status,
  metrics.clicks,
  metrics.impressions,
  metrics.ctr,
  metrics.average_cpc,
  metrics.cost_micros
FROM ad_group_ad
WHERE segments.date DURING LAST_7_DAYS
  AND ad_group_ad.status != 'REMOVED'

#anni
## program category to be created

#Combined
SELECT
segments.date
segments.device
campaign.id, -- primary key
campaign.name,
campaign.status,
campaign.optimization_score,
campaign.advertising_channel_type,
campaign.bidding_strategy,
campaign.bidding_strategy_type,
campaign_budget.amount_micros,
metrics.clicks,
metrics.impressions,
metrics.ctr,
metrics.average_cpc,
metrics.cost_micros
FROM campaign
WHERE segments.date DURING LAST_7_DAYS
  AND campaign.status != 'REMOVED'