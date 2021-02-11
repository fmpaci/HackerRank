/********************************************************************************
 * 	Query the list of CITY names from STATION that do not start with vowels		*
 *  and do not end with vowels. 												*
 *	Your result cannot contain duplicates.										*
 ********************************************************************************
 */


SELECT CITY
FROM STATION
WHERE  UPPER(SUBSTR(CITY,0,1)) not IN ('A','E','I','O','U')
        AND LOWER(SUBSTR(CITY,LENGTH(CITY),1)) not IN ('a','e','i','o','u')
GROUP BY CITY
ORDER BY CITY;