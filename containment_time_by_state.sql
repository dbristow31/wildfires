WITH discovery_containment_dates AS (
	SELECT
		FIRE_YEAR AS year,
		STATE AS state,
		DATE(DISCOVERY_DATE) AS date_discovered,
		DATE(CONT_DATE) AS date_contained, 
		JULIANDAY(DATE(CONT_DATE)) - JULIANDAY(DATE(DISCOVERY_DATE)) AS days_to_contain
	FROM Fires f
	WHERE
		DISCOVERY_DATE IS NOT NULL  
		AND CONT_DATE IS NOT NULL
		AND JULIANDAY(DATE(CONT_DATE)) - JULIANDAY(DATE(DISCOVERY_DATE)) <= 120
	ORDER BY 1 ASC, 3 ASC
)
SELECT
	state,
	AVG(days_to_contain) AS avg_days_to_contain
FROM discovery_containment_dates
GROUP BY 1
ORDER BY 2 DESC
