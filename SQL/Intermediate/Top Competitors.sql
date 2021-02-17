/********************************************************************************
 * 	Top Competitors				                                                *
 *                                                                              *
 *	Julia just finished conducting a coding contest, and she needs your help 	*
 * 	assembling the leaderboard! 												*
 *	Write a query to print the respective hacker_id and name of hackers   		*
 *	who achieved full scores for more than one challenge.     					*
 *	Order your output in descending order by the total number of     			*
 *	challenges in which the hacker earned a full score.    						*
 *	If more than one hacker received full scores in same number of challenges,  *
 *	then sort them by ascending hacker_id.    									*
 ********************************************************************************
 */
	

SELECT 
	  D.HACKER_ID
	, D.NAME
FROM Submissions A 
    JOIN Challenges B
        ON A.CHALLENGE_ID = B.CHALLENGE_ID
    JOIN Difficulty C
        ON C.Difficulty_LEVEL = B.Difficulty_LEVEL
        AND A.SCORE = C.SCORE
    JOIN HACKERS D
        ON A.HACKER_ID = D.HACKER_ID
GROUP BY D.HACKER_ID, D.NAME
HAVING COUNT(A.HACKER_ID)>1
ORDER BY COUNT(A.HACKER_ID) DESC, A.HACKER_ID ASC;