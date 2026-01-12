CREATE OR REPLACE TABLE `valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1` AS
SELECT
  trip_id,
  usertype,
  start_time,
  end_time,
  TIMESTAMP_DIFF(end_time, start_time, MINUTE) AS ride_length_minutes,
  EXTRACT(DAYOFWEEK FROM start_time) AS day_of_week,
  EXTRACT(HOUR FROM start_time) AS start_hour,
  from_station_name,
  to_station_name
FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.Divvy_Trips_2019_Q1`
WHERE TIMESTAMP_DIFF(end_time, start_time, MINUTE) > 0;
