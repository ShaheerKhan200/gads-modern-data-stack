{% snapshot ads_snapshot %}

{{
    config(
        target_schema='snapshots',
        strategy='check',
        unique_key='ad_group_ad_id',
        check_cols=[ad_group_ad_status, ad_group_status, campaign_status],
    )
}}

select distinct
    ad_group_ad_id, -- primary key --if not then create a surrogate
    campaign_id,
    ad_group_id,
    ad_group_ad_status,
    ad_group_status,
    campaign_status
from 
    {{ source('g_ads_data', 'ad_group_ad_legacy_main') }}

{% endsnapshot %}