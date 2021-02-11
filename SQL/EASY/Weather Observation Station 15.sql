/********************************************************************************
 * 	Query the Western Longitude (LONG_W) for the largest Northern Latitude 		*
 *	(LAT_N) in STATION that is less than 137.2345.								*
 *	Truncate your answer to 4 decimal places.									*
 ********************************************************************************
 */
 
SELECT TOP 1 
	CONVERT(DECIMAL (10,4), LONG_W)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC;