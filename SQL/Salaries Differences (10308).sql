-- Problem: Calculates the difference between the highest salaries in the marketing and engineering departments. Output just the absolute difference in salaries.

-- Attempt 1: Passed
WITH salaries AS
    (SELECT d.department, MAX(e.salary) salary
        FROM db_employee as e
        LEFT JOIN db_dept as d ON e.department_id = d.id
        WHERE d.department IN ('engineering', 'marketing')
        GROUP BY d.department
    )
SELECT MAX(salary) - MIN(salary) AS salary_difference FROM salaries;

-- Recommended Solution
SELECT ABS(MAX(CASE
                WHEN d.department = 'engineering' THEN e.salary
            END) - MAX(CASE
                            WHEN d.department = 'marketing' THEN e.salary
                        END)) AS salary_difference
FROM db_employee AS e
LEFT JOIN db_dept AS d ON e.department_id = d.id
WHERE d.department IN ('engineering', 'marketing')


