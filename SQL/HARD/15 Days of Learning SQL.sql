/********************************************************************************
 *	 15 Days of Learning SQL				                                    *
 *	                                                                            *
 *	https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem       *
 ********************************************************************************
 */                                                                              
 

SELECT 
     C.submission_date
    ,E.Q_HACKS
    ,C.HACKER_ID
    ,NAME
FROM (
		SELECT 
			  submission_date
			, B.HACKER_ID
			, NAME 
		FROM (
			SELECT  
				 submission_date
				,hacker_id
				,ROW_NUMBER() OVER(PARTITION BY submission_date ORDER BY Q_SUB DESC,hacker_id) RN 
			FROM (
				select submission_date
						,hacker_id
						, SUM(1) OVER(PARTITION BY submission_date, hacker_id) as Q_SUB 
				from submissions 
			)A
		)B 
		JOIN HACKERS H ON B.HACKER_ID =  H.HACKER_ID
		WHERE RN = 1
	) C
	JOIN (
			SELECT 
				submission_date
				COUNT(DISTINCT D.HACKER_ID) Q_HACKS
			FROM (
					SELECT 
						submission_date
						, Q_SUB
						, H.HACKER_ID
						, H.NAME
						, RANK() OVER(PARTITION BY submission_date ORDER BY submission_date ASC, Q_SUB DESC,A.hacker_id ASC) MAX_H
					FROM (
						SELECT
							 submission_date
							, SUM(1) OVER(PARTITION BY HACKER_ID,submission_date ORDER BY submission_date) Q_SUB
							, HACKER_ID
							, DENSE_RANK() OVER(ORDER BY submission_date) DIA
							, DENSE_RANK() OVER(PARTITION BY HACKER_ID ORDER BY submission_date) DIA_H
						FROM submissions S
						) A
						JOIN Hackers H 
						ON A.HACKER_ID = H.HACKER_ID
					WHERE A.DIA = A.DIA_H
					) D
		GROUP BY submission_date
	) E 
	ON C.submission_date = E.submission_date