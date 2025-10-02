/* Problem: We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. 
Order your list by employee ID in ascending order.
*/

-- Attempt 1: Passed
SELECT id,
       first_name,
       last_name,
       department_id,
       salary
FROM
    (SELECT *, ROW_NUMBER() OVER(PARTITION BY id ORDER BY salary DESC) AS rn
    FROM ms_employee_salary)
WHERE rn = 1;

-- Recommended Solution
SELECT id,
       first_name,
       last_name,
       department_id,
       salary
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC, department_id DESC) AS rn
           FROM ms_employee_salary
) s
WHERE rn = 1;

