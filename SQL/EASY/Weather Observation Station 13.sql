/********************************************************************************
 * 	Query the sum of Northern Latitudes (LAT_N) from STATION having values		*
 *	greater than 38.7880 and less than 137.2345. 								*
 *	Truncate your answer to 4 decimal places.									*
 ********************************************************************************
 */
 
SELECT 
	 CONVERT(DECIMAL (10,4)
	,SUM(LAT_N))
FROM STATION
WHERE LAT_N BETWEEN 38.788 AND 137.2345;