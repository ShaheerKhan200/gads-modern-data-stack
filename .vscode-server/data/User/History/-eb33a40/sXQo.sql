
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}


-- {% macro generate_schema_name(custom_schema_name, node) -%}

--     {%- set default_schema = target.schema -%}
--     {%- if custom_schema_name is 'prod' -%}

--         {{ custom_schema_name | trim }}

--     {%- else -%}

--         {{ default_schema }}
--     {%- endif -%}

-- {%- endmacro %}







-- {% macro generate_schema_name(custom_schema_name, node) -%}
--     {%- set default_schema = target.schema -%}
--     {%- set env_schema = "dev" if target.name == 'dev' else "prod" -%}
    
--     {%- if custom_schema_name is none -%}
--         {{ default_schema }}_{{ env_schema }}
--     {%- else -%}
--         {{ default_schema }}_{{ env_schema }}_{{ custom_schema_name | trim }}
--     {%- endif -%}
-- {%- endmacro %}
