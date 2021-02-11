/********************************************************************************
 * 	Query the Western Longitude (LONG_W)where the smallest Northern Latitude 	*
 *	(LAT_N) in STATION is greater than 38.7780.									*
 *	Round your answer to 4 decimal places.										*
 ********************************************************************************
 */
 

SELECT TOP 1 
	CONVERT(DECIMAL (10,4),LONG_W)
FROM STATION
WHERE LAT_N > 38.778
ORDER BY LAT_N ASC