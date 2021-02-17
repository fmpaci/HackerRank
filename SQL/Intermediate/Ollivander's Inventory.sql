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
	  A.id
	, A.age
    , A.coins_needed
    , A.power 
FROM  
    (   SELECT 
			 w1.id as id
			,age
			,coins_needed
			,power
			,row_number() OVER(PARTITION BY age,power ORDER BY coins_needed asc) as rn
        FROM wands w1 
            join wands_property w2 
                on w1.code = w2.code
        where is_evil = 0
	) A
where A.rn = 1
order by power desc, age desc;
