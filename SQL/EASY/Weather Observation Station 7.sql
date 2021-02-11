/************************************************************************
 * 	Query the list of CITY names ending with vowels (a, e, i, o, u) 	*
 *  from STATION. Your result cannot contain duplicates.				*
 ************************************************************************
 */
 
SELECT CITY 
FROM STATION 
WHERE 
	LOWER(SUBSTR(CITY,-1,1)) IN ('a','e','i','o','u')
	--LOWER function is not allways necesary,
	--but it was needed on HackerRank.
GROUP BY CITY;