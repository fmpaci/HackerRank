/********************************************************************************
 * 	Query the smallest Northern Latitude (LAT_N) from STATION that is greater 	*
 *	than 38.7780.																*
 *	Round your answer to 4decimal places.										*
 ********************************************************************************
 */
 
  
SELECT 
	MIN(CONVERT(DECIMAL (10,4),LAT_N))
FROM STATION
WHERE LAT_N > 38.778;