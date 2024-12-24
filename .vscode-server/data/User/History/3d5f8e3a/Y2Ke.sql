{% snapshot ads_snapshot %}

{{
    config(
        target_schema='snapshots'
        , unique_key='ad_group_ad_id'
        , strategy='timestamp'
        , updated_at='extracted_at'
    )
}}

select distinct 
    id as order_id
    , user_id as customer_id
    , order_date
    , status as order_status
from 
    {{ source('g_ads_data', 'ad_group_ad_legacy_main') }}

{% endsnapshot %}