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
