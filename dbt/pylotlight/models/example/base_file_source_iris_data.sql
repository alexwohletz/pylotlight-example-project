with source as (
      select * from {{ source('file_source', 'iris_data') }}
),
renamed as (
    select
        

    from source
)
select * from renamed
  