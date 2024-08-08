{{ config(materialized='table') }}
with source as (
      SELECT 
    sepal_length,
    sepal_width,
    petal_length,
    petal_width,
    species
FROM {{ source('file_source', 'iris_data') }}
)
select * from source
  