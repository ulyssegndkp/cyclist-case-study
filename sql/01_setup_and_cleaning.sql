-- 01_setup_and_cleaning.sql
-- Dataset: Q1 2019 Divvy trips

SELECT
  COUNT(*) AS total_rows,
  COUNTIF(usertype IS NULL) AS null_usertype,
  COUNTIF(start_time IS NULL) AS null_start_time,
  COUNTIF(end_time IS NULL) AS null_end_time,
  COUNTIF(tripduration IS NULL) AS null_tripduration
FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.Divvy_Trips_2019_Q1`;

-- Check tripduration distribution to infer units (seconds vs minutes)
SELECT
  APPROX_QUANTILES(tripduration, 100)[OFFSET(50)] AS p50,
  APPROX_QUANTILES(tripduration, 100)[OFFSET(90)] AS p90,
  APPROX_QUANTILES(tripduration, 100)[OFFSET(99)] AS p99,
  MAX(tripduration) AS max_tripduration
FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.Divvy_Trips_2019_Q1`;
