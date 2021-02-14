/********************************************************************************
 * 	Binary Tree Nodes	 	*                                                   *
 *	You are given a table, BST, containing two columns: N and P,                *
 *		where N represents the value of a node in Binary Tree,                  *
 *		and P is the parent of N.                                               *
 *                                                                              *
 *	Write a query to find the node type of Binary Tree ordered by the value     *
 *		of the node. Output one of the following for each node:                 *
 *                                                                              *
 *		Root: If node is root node.                                             *
 *		Leaf: If node is leaf node.                                             *
 *		Inner: If node is neither root nor leaf node.                           *
 *                                                                              *
 ********************************************************************************
 */

--Using subquerys, SIMPLE CASE TO READ, BAD PERFORMANCE
SELECT 
	N
	, CASE
		WHEN P IS NULL THEN 'Root'
		WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
		ELSE 'Leaf'
	END
FROM BST
ORDER BY N ASC





--Using multiple joins
SELECT 
    R.N
    , CASE
        WHEN A.P IS NULL THEN 'Root'
        WHEN L.N IS NULL THEN 'Leaf'
        WHEN I.N IS NOT NULL THEN 'Inner'
     END 
FROM BST R
    LEFT JOIN BST I
       ON A.P = I.N
    LEFT JOIN BST L
       ON A.N = L.P
GROUP BY 
	 R.N
    , CASE
        WHEN A.P IS NULL THEN 'Root'
        WHEN L.N IS NULL THEN 'Leaf'
        WHEN I.N IS NOT NULL THEN 'Inner'
     END 
ORDER BY A.N;
    
    