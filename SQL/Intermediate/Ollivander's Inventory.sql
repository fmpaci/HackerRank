/********************************************************************************
 * 	Ollivander's Inventory		                                                *
 *                                                                              *
 * Harry Potter and his friends are at Ollivander's with Ron, 					*
 * finally replacing Charlie's old broken wand.									*
 *																				*
 *	Hermione decides the best way to choose is by determining the 				*
 *	minimum number of gold galleons needed to buy each non-evil wand 			*
 *	of high power and age. 														*
 *	Write a query to print the id, age, coins_needed, and power of the wands	*
 *	that Ron's interested in, sorted in order of descending power. 				*
 *  If more than one wand has same power, sort the result 						*
 *  in order of descending age.													*
 ********************************************************************************
 */
 
 

SELECT 
	  A.ID
	, A.AGE
    , A.COINS_NEEDED
    , A.POWER 
FROM  
    (   SELECT 
			 W1.ID AS ID
			,AGE
			,COINS_NEEDED
			,POWER
			,ROW_NUMBER() OVER(PARTITION BY AGE,POWER ORDER BY COINS_NEEDED ASC) AS RN
        FROM WANDS W1 
            JOIN WANDS_PROPERTY W2 
                ON W1.CODE = W2.CODE
        WHERE IS_EVIL = 0
	) A
WHERE A.RN = 1
ORDER BY POWER DESC, AGE DESC;
