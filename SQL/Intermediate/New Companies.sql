/********************************************************************************
 * 	NEW COMPANIES                                                               *
 *                                                                              *
 *	Amber's conglomerate corporation just acquired some new companies.          *
 *	Each of the companies follows this hierarchy:  *                            *
 *                                                                              *
 *	Given the table schemas below, write a query to print the company_code,     *
 *	founder name, total number of lead managers, total number of senior         *
 *	managers,                                                                   *
 *	total number of managers, and total number of employees.                    *
 *	Order your output by ascending company_code.                                *
 *	                                                                            *
 *	Note:                                                                       *
 *	                                                                            *
 *	The tables may contain duplicate records.                                   *
 *	The company_code is string, so the sorting should not be numeric.           *
 *	For example, if the company_codes are C_1, C_2, and C_10, then the          *
 *	ascending company_codes will be C_1, C_10, and C_2.                         *
 *	                                                                            *
 ********************************************************************************
 */
 

SELECT
    CO.COMPANY_CODE
    ,CO.FOUNDER
    ,COUNT(DISTINCT LM.LEAD_MANAGER_CODE)
    ,COUNT(DISTINCT SM.SENIOR_MANAGER_CODE)
    ,COUNT(DISTINCT MN.MANAGER_CODE)
    ,COUNT(DISTINCT EM.EMPLOYEE_CODE)
FROM COMPANY CO
    LEFT JOIN LEAD_MANAGER LM
        ON LM.COMPANY_CODE = CO.COMPANY_CODE
    LEFT JOIN  SENIOR_MANAGER SM
        ON SM.COMPANY_CODE = LM.COMPANY_CODE
        AND SM.LEAD_MANAGER_CODE = LM.LEAD_MANAGER_CODE
    LEFT JOIN MANAGER MN
        ON MN.COMPANY_CODE = SM.COMPANY_CODE
        AND MN.LEAD_MANAGER_CODE = SM.LEAD_MANAGER_CODE
        AND MN.SENIOR_MANAGER_CODE = SM.SENIOR_MANAGER_CODE 
    LEFT JOIN EMPLOYEE EM
        ON EM.COMPANY_CODE = MN.COMPANY_CODE
        AND EM.LEAD_MANAGER_CODE = MN.LEAD_MANAGER_CODE
        AND EM.SENIOR_MANAGER_CODE = MN.SENIOR_MANAGER_CODE 
        AND EM.MANAGER_CODE = MN.MANAGER_CODE
GROUP BY CO.COMPANY_CODE
    ,CO.FOUNDER
ORDER BY CO.COMPANY_CODE