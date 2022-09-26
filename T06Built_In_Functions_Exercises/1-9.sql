USE `soft_uni`;

SELECT
	`first_name`, `last_name`
FROM
	`employees`
WHERE
	`first_name` LIKE 'Sa%';
    
-----------------------------------------
    
SELECT 
	`first_name`, `last_name`
FROM
	`employees`
WHERE
	`last_name` LIKE '%ei%';
    
-----------------------------------------
    
SELECT
	`first_name`
FROM 
	`employees`
WHERE
	`department_id` IN (3, 10) AND
    YEAR(`hire_date`) BETWEEN 1995 AND 2005;

-----------------------------------------

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    `job_title` NOT LIKE '%engineer%';
    
-----------------------------------------

SELECT 
    `name`
FROM
    `towns`
WHERE
    CHAR_LENGTH(`name`) IN (5 , 6)
ORDER BY 
	`name`;

-----------------------------------------

SELECT 
    `town_id`, `name`
FROM
    `towns`
WHERE
    LOWER(SUBSTRING(`name`, 1, 1)) IN ('m', 'k', 'b', 'e')
ORDER BY 
	`name`;
    
-----------------------------------------

SELECT 
    `town_id`, `name`
FROM
    `towns`
WHERE
    LOWER(SUBSTRING(`name`, 1, 1)) NOT IN ('r', 'd', 'b')
ORDER BY 
	`name`;
    
-----------------------------------------

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    CHAR_LENGTH(`last_name`) = 5;
    
-----------------------------------------

CREATE VIEW `v_employees_hired_after_2000` AS
    SELECT 
        `first_name`, `last_name`
    FROM
        `employees`
    WHERE
        YEAR(`hire_date`) > 2000;
        
SELECT * FROM `v_employees_hired_after_2000`;