{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- set env_schema = "dev" if target.name == 'dev' else "prod" -%}
    
    {%- if custom_schema_name is none -%}
        {{ default_schema }}_{{ env_schema }}
    {%- else -%}
        {{ default_schema }}_{{ env_schema }}_{{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}

g_ads_raw
