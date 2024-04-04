-- MAKE SURE YOU REPLACE dynamic-heading-419216 WITH THE NAME OF YOUR DATASET! 
-- When you run the query, only run 5 of the ALTER TABLE statements at one time (by highlighting only 5). 
-- Otherwise BigQuery will say too many alterations to the table are being made.

CREATE TABLE  `dynamic-heading-419216.trips_data_all.green_trip_data` as
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2019`; 


CREATE TABLE  `dynamic-heading-419216.trips_data_all.yellow_trip_data` as
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`;

insert into  `dynamic-heading-419216.trips_data_all.green_trip_data` 
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2020` ;


insert into  `dynamic-heading-419216.trips_data_all.yellow_trip_data` 
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2020`; 

  -- Fixes yellow table schema
ALTER TABLE `dynamic-heading-419216.trips_data_all.yellow_trip_data`
  RENAME COLUMN vendor_id TO VendorID;
ALTER TABLE `dynamic-heading-419216.trips_data_all.yellow_trip_data`
  RENAME COLUMN pickup_datetime TO tpep_pickup_datetime;
ALTER TABLE `dynamic-heading-419216.trips_data_all.yellow_trip_data`
  RENAME COLUMN dropoff_datetime TO tpep_dropoff_datetime;
ALTER TABLE `dynamic-heading-419216.trips_data_all.yellow_trip_data`
  RENAME COLUMN rate_code TO RatecodeID;
ALTER TABLE `dynamic-heading-419216.trips_data_all.yellow_trip_data`
  RENAME COLUMN imp_surcharge TO improvement_surcharge;
-- Add more ALTER TABLE statements as needed for the yellow_trip_data table

  -- Fixes green table schema
ALTER TABLE `dynamic-heading-419216.trips_data_all.green_trip_data`
  RENAME COLUMN vendor_id TO VendorID;
ALTER TABLE `dynamic-heading-419216.trips_data_all.green_trip_data`
  RENAME COLUMN pickup_datetime TO lpep_pickup_datetime;
ALTER TABLE `dynamic-heading-419216.trips_data_all.green_trip_data`
  RENAME COLUMN dropoff_datetime TO lpep_dropoff_datetime;
ALTER TABLE `dynamic-heading-419216.trips_data_all.green_trip_data`
  RENAME COLUMN rate_code TO RatecodeID;
ALTER TABLE `dynamic-heading-419216.trips_data_all.green_trip_data`
  RENAME COLUMN imp_surcharge TO improvement_surcharge;
-- Add more ALTER TABLE statements as needed for the green_trip_data table
