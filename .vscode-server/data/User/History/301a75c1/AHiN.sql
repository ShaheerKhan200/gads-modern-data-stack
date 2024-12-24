{{
    config(
        materialized='incremental',
        -- unique_key='invoice_id',
        -- on_schema_change='append_new_columns'
    )
}}

with

invoices as (

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