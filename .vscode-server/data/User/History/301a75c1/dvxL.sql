{{
    config(
        materialized = 'incremental',  -- Specifies that this model is materialized incrementally.
        unique_key = 'ad_group_ad_id',  -- Unique key for merging.
        incremental_strategy = 'merge',  -- Strategy to merge new/changed records.
        merge_update_columns = ['ad_group_ad_status', 'ad_group_status', 'campaign_status', 'order_date', 'order_status', 'dbt_scd_id', 'dbt_updated_at', 'dbt_valid_from', 'dbt_valid_to', 'active_status']  -- Columns to update when merging.
    )
}}


with

invoices as (
ß
    select * from {{ ref('stg_gads__ad_group_ad_legacy') }}

    {% if is_incremental() %}

    -- this filter will only be applied on an incremental run
    where extracted_at > (select max(extracted_at) from {{ this }})

    {% endif %}

),

final as (

    select
        *,
        '{{ invocation_id }}' as batch_id

    from invoices

)

select * from final