{{
    config(
        materialized='table'
    )
}}

with fhv_trip_data as (
    select 
        CONCAT(dispatching_base_num, CAST(pickup_datetime AS STRING)) as tripid, -- Creating a unique trip ID
        dispatching_base_num as vendorid, 
        'FHV' as service_type,
        PUlocationID as pickup_locationid,
        DOlocationID as dropoff_locationid,
        pickup_datetime, 
        dropoff_datetime,
        SR_Flag as shared_ride_flag,
        Affiliated_base_number
    from {{ ref('stg_fhv_tripdata') }}
), 
dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select 
    fhv_trip_data.tripid, 
    fhv_trip_data.vendorid, 
    fhv_trip_data.service_type,
    fhv_trip_data.pickup_locationid, 
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
    fhv_trip_data.dropoff_locationid,
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone,  
    fhv_trip_data.pickup_datetime, 
    fhv_trip_data.dropoff_datetime, 
    fhv_trip_data.shared_ride_flag, 
    fhv_trip_data.Affiliated_base_number
from fhv_trip_data
inner join dim_zones as pickup_zone
    on fhv_trip_data.pickup_locationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
    on fhv_trip_data.dropoff_locationid = dropoff_zone.locationid
