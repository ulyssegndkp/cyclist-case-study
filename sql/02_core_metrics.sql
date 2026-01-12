SELECT
usertype,
COUNT (*) AS total_rides
FROM 'valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1
GROUP BY
usertype
ORDER
BY
total_rides DESC;
-- Optional: add % share for your narrative (still Part 4.1)
WITH totals AS (
SELECT COUNT (*) AS all_rides
FROM valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1'
SELECT
usertype,
COUNT (*) AS total_rides,
ROUND (100 * COUNT (*) / (SELECT all_rides FROM totals), 2) AS pct_of_total
FROM
*valiant-monitor-476020-u8.Cyclist_Case_Study divvy_clean_q1'
GROUP
BY
usertype
ORDER
BY
total_rides DESC;

