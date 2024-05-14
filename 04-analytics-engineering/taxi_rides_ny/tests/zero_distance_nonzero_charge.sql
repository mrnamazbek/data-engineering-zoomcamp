-- tests/zero_distance_nonzero_charge.sql
--Identify trips where the reported distance is zero but there's a non-zero charge.

SELECT tripid
FROM {{ ref('fact_fhv_trips') }}
WHERE service_type != 'FHV'
