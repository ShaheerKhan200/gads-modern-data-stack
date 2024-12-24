select 
        segments_date,
        customer_id,
        campaign_id,
        campaign_name,
        campaign_status,
        campaign_type,
        ad_group_id,
        ad_group_name,
        ad_group_ad_id,
        ad_group_ad_status,
        sum(metrics_clicks) as clicks,
        sum(metrics_impressions) as impressions,
        sum(metrics_interactions) as interactions,
        case when sum(metrics_impressions) = 0 then 0 else round(sum(metrics_clicks) / sum(metrics_impressions) * 100, 2) end as ctr,
        case when sum(metrics_clicks) = 0 then 0 else round(sum(metrics_cost_micros / 1000000) / sum(metrics_clicks), 2) end as cpc,
        round(avg(metrics_average_cpc / 1000000), 2) as avg_cpc,
        sum(metrics_cost_micros / 1000000) as cost,
        round(sum(metrics_conversions), 2) as conversions,
        case when sum(metrics_interactions) = 0 then 0 else round(sum(metrics_conversions) / sum(metrics_interactions) * 100, 2) end as conversion_rate,
        case when sum(metrics_conversions) = 0 then 0 else round(sum(metrics_cost_micros / 1000000) / sum(metrics_conversions), 2) end as cost_per_conversion
from
    {{ref ('stg_gads__ad_group_ad_legacy')}}
where
    segments_date='2024-05-10'
group by
    1,2,3,4,5,6,7,8,9,10