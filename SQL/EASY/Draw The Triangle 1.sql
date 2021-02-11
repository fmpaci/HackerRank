/********************************************************************************
 * 	P(R) represents a pattern drawn by Julia in R rows. The following pattern	*
 *	represents P(5): 															*
 *	* * * * * 
 *	* * * * 
 *	* * * 
 *	* * 
 *	*
 ********************************************************************************
 */
	 
WITH CTE 
AS(
	SELECT 1 I 
	UNION ALL
	SELECT I+1 I 
	FROM CTE WHERE I < 20
  )
SELECT REPLICATE('* ', I) 
FROM CTE
ORDER BY I DESC

