/********************************************************************************
 * 	Query the list of CITY names from STATION that either do not start with		*
 *  vowels or do not end with vowels. Your result cannot contain duplicates.	*
 ********************************************************************************
 */
 
SELECT
	CITY
FROM STATION
WHERE  UPPER(SUBSTR(CITY,0,1)) NOT IN ('A','E','I','O','U')
        OR LOWER(SUBSTR(CITY,LENGTH(CITY),1)) NOT IN ('a','e','i','o','u')
GROUP BY CITY
ORDER BY CITY;
