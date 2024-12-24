{{
    config(
        materialized = 'incremental',  -- Specifies that this model is materialized incrementally.
        unique_key = [
            'segments_date',
            'ad_group_id', 
            'ad_group_ad_ad_type',
            'ad_group_ad_status', 
            'campaign_status',
            'segments_ad_network_type',
            'ad_group_status',
            'campaign_id', 
            'customer_id', 
            'ad_group_ad_ad_id'
        ]  -- Composite unique key based on the combination of these columns
        -- incremental_strategy = 'merge',  -- Uncomment if merge strategy is needed.
        -- merge_update_columns = ['ad_group_ad_status', 'ad_group_status', 'campaign_status', 'dbt_scd_id', 'dbt_updated_at', 'dbt_valid_from', 'dbt_valid_to', 'active_status']  -- Uncomment if specific columns are needed for merging.
    )
}}

with

ad_legacy_data as (

    select 
    row_number() OVER (ORDER BY segments_date, ad_group_id, ad_group_ad_ad_type, ad_group_ad_status, campaign_status, segments_ad_network_type, ad_group_status,campaign_id, customer_id, ad_group_ad_ad_id) AS surrogate_key
    ,*  -- Removed the extra comma before '*'
    from {{ ref('stg_gads__ad_group_ad_legacy') }}



    {% if is_incremental() %}

    -- this filter will only be applied on an incremental run
    where surrogate_key > (select max(surrogate_key) from {{ this }}) -- exists or not 

    {% endif %}

),

final as (

    select
        *,
        '{{ invocation_id }}' as batch_id

    from ad_legacy_data
)

select * from final
