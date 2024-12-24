{{
    config(
        materialized = 'incremental',  -- Specifies that this model is materialized incrementally.
        unique_key = 'ad_group_ad_id',  -- Unique key for merging.-- ask anni if i should add columns used in making surrogate key
        -- incremental_strategy = 'merge',  -- Strategy to merge new/changed records.
        -- merge_update_columns = ['ad_group_ad_status', 'ad_group_status', 'campaign_status', 'dbt_scd_id', 'dbt_updated_at', 'dbt_valid_from', 'dbt_valid_to', 'active_status']  -- Columns to update when merging.
        )
}}




with

ad_legacy_data as (

    select 
    row_number() OVER (ORDER BY segments_date, ad_group_id, campaign_id, customer_id, ad_group_ad_ad_id) AS surrogate_key,
    ,* 
    from {{ ref('stg_gads__ad_group_ad_legacy') }}

    {% if is_incremental() %}

    -- this filter will only be applied on an incremental run
    where surrogate_key > (select max(surrogate_key) from {{ this }})

    {% endif %}

),

final as (

    select
        *,
        '{{ invocation_id }}' as batch_id

    from ad_legacy_data
)

select * from final
