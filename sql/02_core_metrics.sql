SELECT
  user_type_norm AS user_type,
  COUNT(*) AS total_rides
FROM `valiant-monitor-476020-u8.Cyclist_Case_Study.v_trips_q1_clean`
WHERE user_type_norm IN ('member', 'casual')
GROUP BY 1
ORDER BY total_rides DESC;

