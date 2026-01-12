-- Top 10 start stations (casual riders only)
SELECT
from_station_name AS station_name,
COUNT (*) AS rides
FROM 'valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1'
WHERE usertype = 'Customer'
AND from_station_name IS NOT NULL
GROUP BY station_name
ORDER BY rides DESC
LIMIT 10;
-- Top 10 end stations (casual riders only)
stations (casual riders only)
SELECT
to_station_name AS station_name,
COUNT (*) AS rides
FROM 'valiant-monitor-476020-u8.Cyclist_Case_Study divvy_clean_q1'
WHERE usertype = 'Customer'
AND to_station_name IS NOT NULL
GROUP BY station_name
ORDER BY rides DESC
LIMIT 10;

SELECT
from_station_name AS
station_name,
COUNT (*) AS rides
FROM 'valiant-monitor-476020-u8.Cyclist_Case_Study.divvy_clean_q1'
WHERE usertype = 'Subscriber'
AND from_station_name IS NOT NULL
GROUP BY station_name
ORDER BY rides DESC
LIMIT 10;
