/********************************************************************************
 * 	Challenges					                                                *
 *                                                                              *
 * Julia asked her students to create some coding challenges.					*
 * Write a query to print the hacker_id, name, and the total number of 			*
 * challenges created by each student. 											*
 * Sort your results by the total number of challenges in descending order..	*
 * If more than one student created the same number of challenges, then sort 	*
 * the result by hacker_id. 													*
 * If more than one student created the same number of challenges and the 		*
 * count is less than the maximum number of challenges created, 				*
 * then exclude those students from the result.									*
 * 																				*
 ********************************************************************************
 */
 
 WITH Challenges 
 AS(
	SELECT 
		  HC.HACKER_ID
		, HC.NAME
		, COUNT(DISTINCT Challenge_ID) TOT
	FROM Challenges CH
		JOIN HACKERS HC 
		ON CH.HACKER_ID = HC.HACKER_ID
	GROUP BY HC.HACKER_ID, HC.NAME
	) 
SELECT *
FROM Challenges
WHERE TOT = (SELECT MAX(TOT) FROM Challenges)
    OR TOT IN (SELECT TOT FROM Challenges GROUP BY TOT HAVING COUNT(*)=1)
ORDER BY TOT DESC, HACKER_ID

