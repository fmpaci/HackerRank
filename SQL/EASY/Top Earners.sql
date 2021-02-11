/********************************************************************************
 * We define an employee's total earnings to be their monthly salary x month 	*
 * worked, and the maximum total earnings to be the maximum total earnings for 	*
 * any employee in the Employee table. Write a query to find the maximum total 	*
 * earnings for all employees as well as the total number of employees who have *
 * maximum total earnings. 														*
 * Then print these values as 2 space-separated integers.						*
 ********************************************************************************
 */
 
SELECT 
   (SALARY * MONTHS), COUNT(*)
FROM EMPLOYEE EMP
WHERE (SALARY * MONTHS) = (SELECT MAX((SALARY * MONTHS)) FROM EMPLOYEE)
GROUP BY (SALARY * MONTHS);