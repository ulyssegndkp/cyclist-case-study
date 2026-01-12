SELECT
usertype,
ROUND (AVG(ride_length_minutes), 2) AS avg_ride_lengthmin
FROM 'valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1'
GROUP BY usertype;
SELECT
usertype,
APPROX_QUANTILES(ride_length_minutes, 100) [OFFSET(50)] AS median_ride_length_min
FROM "valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1'
GROUP BY usertype;
-- Optional: ride length buckets (useful for Power BI histogram)
SELECT
usertype,
CASE
WHEN ride_length minutes < 5 THEN '<5"
WHEN ride_length minutes < 10 THEN 5-9"
WHEN ride_length_minutes < 20
THEN "10-19'
WHEN ride_length_minutes < 30
THEN 20-29'
WHEN ride_length_minutes < 60
THEN 30-59'
ELSE '60+'
END AS ride_length_bucket,
COUNT (*) AS rides
FROM 'valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1"
GROUP BY usertype, ride_length_bucket
ORDER BY usertype, rides
