/********************************************************************************
 * 	Query the greatest value of the Northern Latitudes (LAT_N) from STATION		*
 *	that is less than 137.2345. Truncate your answer to 4 decimal places.		*
 ********************************************************************************
 */

SELECT 
	CONVERT(DECIMAL (10,4), MAX(LAT_N))
FROM STATION
WHERE LAT_N < 137.2345;