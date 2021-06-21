SELECT
	STATE AS state,  
	COUNT(FOD_ID) AS fire_count
FROM Fires f
GROUP BY 1
ORDER BY 2 DESC

