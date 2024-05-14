-- tests/service_type_consistency_test.sql
--This test ensures that the service_type column contains only expected values, reflecting accurate service type classification.
SELECT tripid
FROM {{ ref('fact_fhv_trips') }}
WHERE service_type NOT IN ('FHV', 'Green', 'Yellow') -- Assuming these are your valid service types
