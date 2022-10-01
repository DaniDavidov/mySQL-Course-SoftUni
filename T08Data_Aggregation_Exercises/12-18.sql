SELECT `department_id`, MIN(`salary`) FROM `employees`
WHERE `department_id` IN (2, 5 ,7) AND `hire_date` > '2000-01-01'
GROUP BY `department_id`
ORDER BY `department_id`;

----------------------------------

CREATE TABLE `average_salaries` AS SELECT * FROM
    `employees`
WHERE
    `salary` > 30000;

DELETE FROM `average_salaries` 
WHERE
    `manager_id` = 42;
    
UPDATE `average_salaries` 
SET 
    `salary` = `salary` + 5000
WHERE
    `department_id` = 1;
    
SELECT 
    `department_id`, AVG(`salary`) AS 'average_salary'
FROM
    `average_salaries`
GROUP BY `department_id`
ORDER BY `department_id`;

----------------------------------

SELECT 
    department_id, MAX(salary) AS max_salary
FROM
    employees
GROUP BY department_id
HAVING max_salary NOT BETWEEN 30000 AND 70000
ORDER BY department_id;

----------------------------------------

SELECT 
    COUNT(`employee_id`)
FROM
    `employees`
WHERE
    `manager_id` IS NULL;
    
----------------------------------------

SELECT 
    `department_id`, SUM(`salary`)
FROM
    `employees`
GROUP BY `department_id`
ORDER BY `department_id`;