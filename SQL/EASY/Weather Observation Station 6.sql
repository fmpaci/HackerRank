/********************************************************************************
 * 	Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) 	*
 *	from STATION. Your result cannot contain duplicates.						*
 ********************************************************************************
 */
 
 
SELECT 
    CITY
FROM STATION
WHERE 
	UPPER(SUBSTR(CITY,0,1)) IN ('A','E','I','O','U') 
	--Upper function is not allways necesary,
	--but it was needed on HackerRank 
GROUP BY CITY;