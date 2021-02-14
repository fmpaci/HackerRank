/********************************************************************************
 * 	Weather Observation Station 20                                              *
 *                                                                              *
 *	A median is defined as a number separating the higher half of a data set    *
 *	from the lower half. Query the median of the Northern Latitudes (LAT_N)     *
 *	from STATION and round your answer to  decimal places.                      *
 *	                                                                            *
 ********************************************************************************
 */
 


SELECT  
	CONVERT(DECIMAL (18,4),AVG(LAT_N))
FROM 
    (SELECT ROW_NUMBER() OVER(PARTITION BY 1 ORDER BY LAT_N DESC) RN, LAT_N
	 FROM STATION) A 
WHERE A.RN = ROUND(CONVERT(DECIMAL (18,0),(SELECT COUNT(*) FROM STATION))/2,0)