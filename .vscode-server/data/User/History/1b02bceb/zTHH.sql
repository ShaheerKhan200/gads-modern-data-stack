with MatchedTexts AS (
    SELECT
		segments_date,
		ad_group_ad_id,
		ad_group_ad_ad_responsive_search_ad_headlines,
        regexp_matches(
            ad_group_ad_ad_responsive_search_ad_headlines::text,
            'text: \\"([^\\"]+)\\"\\nasset_performance_label',
            'g'
        ) AS text_parts
    FROM
       {{ref ('stg_gads__ad_group_ad')}}
    -- WHERE
    --     segments_date = '2024-05-10'
),
Aggregated AS (
    SELECT
        segments_date,
        ad_group_ad_id,
		ad_group_ad_ad_responsive_search_ad_headlines,
        array_agg(text_parts[1]) AS aggregated_texts
    FROM
        MatchedTexts
    GROUP BY
        1,2,3
)

select * from Aggregated

