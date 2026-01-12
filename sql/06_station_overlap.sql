WITH top_start AS (
  SELECT
    from_station_name AS station_name,
    COUNT(*) AS rides
  FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1`
  WHERE usertype = 'Customer'
    AND from_station_name IS NOT NULL
  GROUP BY station_name
  ORDER BY rides DESC
  LIMIT 10
),
top_end AS (
  SELECT
    to_station_name AS station_name,
    COUNT(*) AS rides
  FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1`
  WHERE usertype = 'Customer'
    AND to_station_name IS NOT NULL
  GROUP BY station_name
  ORDER BY rides DESC
  LIMIT 10
)
SELECT
  s.station_name,
  s.rides AS start_rides,
  e.rides AS end_rides
FROM top_start s
JOIN top_end e
USING (station_name)
ORDER BY start_rides DESC;


WITH top_start AS (
  SELECT from_station_name AS station_name
  FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1`
  WHERE usertype = 'Customer' AND from_station_name IS NOT NULL
  GROUP BY station_name
  ORDER BY COUNT(*) DESC
  LIMIT 10
),
top_end AS (
  SELECT to_station_name AS station_name
  FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1`
  WHERE usertype = 'Customer' AND to_station_name IS NOT NULL
  GROUP BY station_name
  ORDER BY COUNT(*) DESC
  LIMIT 10
)
SELECT
  COUNT(*) AS overlap_station_count
FROM top_start
JOIN top_end USING (station_name);

