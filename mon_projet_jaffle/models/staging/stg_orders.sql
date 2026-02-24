with source as (
    select * from {{ source('my_dbt_db', 'raw_orders') }}
),

renamed as (
    select
        id as order_id,
        customer as customer_id,
        ordered_at as order_date
        /* On a retiré status car il n'existe pas dans la table brute */
    from source
)

select * from renamed