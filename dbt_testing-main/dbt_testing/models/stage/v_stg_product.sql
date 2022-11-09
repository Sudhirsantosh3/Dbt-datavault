{%- set yaml_metadata -%}
source_model: 'product_stage'
derived_columns:
  RECORD_SOURCE: '!PRODUCT_STAGE'
hashed_columns:
  PRODUCT_PK: 'PRODUCT_ID'
  PRODUCT_HK:
    is_hashdiff: true
    columns:
        - 'PRODUCT_NAME'
        - 'PRODUCT_DESC'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}