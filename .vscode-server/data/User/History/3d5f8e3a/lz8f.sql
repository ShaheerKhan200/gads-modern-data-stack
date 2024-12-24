{% snapshot stg_orders_snapshot %}

{{
    config(
        target_schema='jaffle_shop_snapshots'
        , unique_key='order_id'
        , strategy='timestamp'
        , updated_at='order_date'
    )
}}

select distinct 
    id as order_id
    , user_id as customer_id
    , order_date
    , status as order_status
from 
    {{ source('raw', 'orders') }}

{% endsnapshot %}