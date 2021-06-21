SELECT
	FIRE_YEAR AS fire_year,
	COUNT(FOD_ID) AS fire_count
FROM Fires f
GROUP BY 1
ORDER BY 1 ASC 