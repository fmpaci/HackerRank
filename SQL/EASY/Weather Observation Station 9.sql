/********************************************************************************
 * 	Query the list of CITY names from STATION that do not start with vowels.	*
 *  Your result cannot contain duplicates.										*
 ********************************************************************************
 */
 

SELECT CITY 
FROM STATION 
WHERE 
	UPPER(SUBSTR(CITY,0,1)) NOT IN ('A','E','I','O','U') 
GROUP BY CITY;