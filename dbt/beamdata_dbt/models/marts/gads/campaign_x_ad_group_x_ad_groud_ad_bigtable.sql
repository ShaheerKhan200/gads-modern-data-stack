with ad_group_ad_details as (
	select Aggregated.aggregated_texts, cte.*
	from {{ref ('int_wide_table_base_summary_table')}} as cte
	LEFT JOIN {{ref ('int_ad_names_extracted')}} as Aggregated
    ON cte.ad_group_ad_id = Aggregated.ad_group_ad_id and cte.segments_date = Aggregated.segments_date
)
select distinct 
    segments_date,
	COALESCE(aggregated_texts[1], '') AS ad_group_ad_ad_name_1,
    COALESCE(aggregated_texts[2], '') AS ad_group_ad_ad_name_2,
    COALESCE(aggregated_texts[3], '') AS ad_group_ad_ad_name_3,
    COALESCE(aggregated_texts[4], '') AS ad_group_ad_ad_name_4,
	campaign_name,
	ad_group_name,
    ad_group_ad_status,
    sum(clicks) as clicks,
    sum(impressions) as impressions,
    sum(interactions) as interactions,
    --round(sum(clicks) / sum(impressions) * 100, 2) as ctr,
    case when sum(clicks) = 0 then 0 else round(sum(cost) / sum(impressions) *100, 2) end as ctr,
    case when sum(clicks) = 0 then 0 else round(sum(cost) / sum(clicks), 2) end as avg_cpc,
    sum(cost) as cost,
    round(sum(conversions), 2) as conversions,
    case when sum(interactions) = 0 then 0 else round(sum(conversions) / sum(interactions) * 100, 2) end as conversion_rate,
    case when sum(conversions) = 0 then 0 else round(sum(cost) / sum(conversions), 2) end as cost_per_conversion
from
    ad_group_ad_details
group by 
    1,2,3,4,5,6,7,8
order by 
    cost desc