DELIMITER &&
CREATE PROCEDURE `usp_get_employees_salary_above_35000`()
BEGIN
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE `salary` > 35000
    ORDER BY `first_name`, `last_name`, `employee_id`;
END
&&

-------------------------------------------------

CREATE PROCEDURE `usp_get_employees_salary_above`(`number` DECIMAL(10, 4))
BEGIN
	SELECT first_name, last_name FROM employees
    WHERE salary >= `number`
    ORDER BY first_name, last_name, employee_id;
END
&&

-------------------------------------------------

CREATE PROCEDURE usp_get_towns_starting_with(start_characters VARCHAR(20))
BEGIN
	SELECT `name` FROM `towns` 
    WHERE lower(`name`) LIKE lower(concat(start_characters, '%'))
    ORDER BY `name`;
END
&&

------------------------------------------------

CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(30))
BEGIN
	
END
&&

CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(50))
BEGIN
	SELECT first_name, last_name FROM `employees` AS e
	JOIN `addresses` AS a USING(`address_id`)
	JOIN `towns` AS t USING(`town_id`)
	WHERE t.`name` = town_name
	ORDER BY e.first_name, e.last_name, e.employee_id;
END
&&

--------------------------------------------------

CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(19, 4))
RETURNS VARCHAR(8)
DETERMINISTIC
BEGIN
	DECLARE salary_level VARCHAR(8);
    IF salary < 30000 THEN SET salary_level := 'Low';
    ELSEIF salary <= 50000 THEN SET salary_level := 'Average';
	ELSE SET salary_level := 'High';
    END IF;
    RETURN salary_level;
END
&&
--------------------------------------------------

CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(20))
BEGIN
	SELECT first_name, last_name FROM `employees`
    WHERE ufn_get_salary_level(salary) LIKE salary_level
    ORDER BY first_name DESC, last_name DESC;
END
&&
--------------------------------------------------
DELIMITER %%
CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
	SELECT CONCAT(first_name, ' ', last_name) AS 'full_name' FROM account_holders
    ORDER BY full_name, id;
END
%%
CALL usp_get_holders_full_name;