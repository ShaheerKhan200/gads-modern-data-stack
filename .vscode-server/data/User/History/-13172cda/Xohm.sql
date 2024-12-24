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
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(interactions) as interactions,
        case when sum(impressions) = 0 then 0 else round(sum(clicks) / sum(impressions) * 100, 2) end as ctr,
        case when sum(clicks) = 0 then 0 else round(sum(cost_micros / 1000000) / sum(clicks), 2) end as cpc,
        round(avg(avg_cpc / 1000000), 2) as avg_cpc,
        sum(cost_micros / 1000000) as cost,
        round(sum(conversions), 2) as conversions,
        case when sum(interactions) = 0 then 0 else round(sum(conversions) / sum(interactions) * 100, 2) end as conversion_rate,
        case when sum(conversions) = 0 then 0 else round(sum(cost_micros / 1000000) / sum(conversions), 2) end as cost_per_conversion
from
    {{ref ('stg_gads__ad_group_ad_legacy')}}
where
    segments_date='2024-05-10'
group by
    1,2,3,4,5,6,7,8,9,10