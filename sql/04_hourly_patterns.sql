SELECT
usertype, start_hour,
COUNT (*) AS total_rides
FROM 'valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1'
GROUP BY usertype, start_hour ORDER BY start_hour, usertype;
WITH hourly AS (
SELECT
start_hour, usertype,
COUNT (*) AS rides
FROM valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1'
GROUP BY start_hour, usertype
hour_totals AS (
SELECT
start_hour,
SUM (rides) AS rides_all
FROM hourly
GROUP BY start_hour
SELECT
h.start_hour, h.usertype,
h.rides,
ROUND (100 * h.rides / t.rides_all, 2) AS pct_within_hour
FROM hourly h
JOIN hour_totals t USING (start_hour)
ORDER BY h.start_hour,
