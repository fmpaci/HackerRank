/********************************************************************************
 * 	Given the CITY and COUNTRY tables, query the sum of the populations		 	*
 *	of all cities where the CONTINENT is 'Asia'.								*
 *  Note: CITY.CountryCode and COUNTRY.Code are matching key columns.			*
 ********************************************************************************
 */
	

SELECT 
	SUM(CI.POPULATION)
FROM COUNTRY CO
    JOIN CITY CI
        ON CI.COUNTRYCODE = CO.CODE
WHERE CONTINENT = 'ASIA';