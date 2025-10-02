-- Problem: Management wants to analyze only employees with official job titles. Find the job titles of the employees with the highest salary. If multiple employees have the same highest salary, include all their job titles.

-- Attempt 1: Passed
SELECT t.worker_title AS best_paid_title
FROM title AS t
JOIN worker AS w
ON t.worker_ref_id = w.worker_id
WHERE w.salary = 
    (SELECT MAX(w.salary)
    FROM worker AS w
    JOIN title AS t
    ON w.worker_id = t.worker_ref_id);

-- Recommended Solution:
SELECT b.worker_title AS best_paid_title
FROM worker a
JOIN title b ON a.worker_id = b.worker_ref_id
WHERE a.salary = (
    SELECT MAX(w.salary)
    FROM worker w
    JOIN title t ON w.worker_id = t.worker_ref_id
)
ORDER BY best_paid_title;
