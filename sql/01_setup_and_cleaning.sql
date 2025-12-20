-- 01_setup_and_cleaning.sql
-- Dataset: Q1 2019 Divvy trips

SELECT
  COUNT(*) AS total_rows,
  COUNTIF(usertype IS NULL) AS null_usertype,
  COUNTIF(start_time IS NULL) AS null_start_time,
  COUNTIF(end_time IS NULL) AS null_end_time,
  COUNTIF(tripduration IS NULL) AS null_tripduration
FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.Divvy_Trips_2019_Q1`;


-- Create a view (recommended) so Power BI and all queries reuse same logic
CREATE OR REPLACE VIEW `valiant-monitor-476020-u8.Cyclist_Case_Study.v_trips_q1_clean` AS
SELECT
  trip_id,
  start_time,
  end_time,
  bikeid,
  usertype,
  gender,
  birthyear,
  from_station_id,
  from_station_name,
  to_station_id,
  to_station_name,

  -- Normalize user type
  CASE
    WHEN LOWER(usertype) IN ('subscriber', 'member', 'annual member') THEN 'member'
    WHEN LOWER(usertype) IN ('customer', 'casual') THEN 'casual'
    ELSE 'unknown'
  END AS user_type_norm,

  -- Duration in minutes:
  (tripduration / 60.0) AS ride_minutes,

  -- Time features
  EXTRACT(HOUR FROM start_time) AS start_hour
FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.Divvy_Trips_2019_Q1`
WHERE start_time IS NOT NULL
  AND end_time IS NOT NULL
  AND tripduration IS NOT NULL
  AND tripduration > 0;
