{% snapshot ads_snapshot %}

{{
    config(
        target_schema='snapshots'
        , unique_key='ad_group_ad_id'
        , strategy='timestamp' --#use check all
        , updated_at='extracted_at'
    )
}}

select distinct
    ad_group_ad_id -- primary key --if not then create a surrogate
    ,user_id as campaign_id
    ,ad_group_id
    ,order_date
    ,ad_group_ad_status
    ,ad_group_status
    campaign_status
from 
    {{ source('g_ads_data', 'ad_group_ad_legacy_main') }}

{% endsnapshot %}