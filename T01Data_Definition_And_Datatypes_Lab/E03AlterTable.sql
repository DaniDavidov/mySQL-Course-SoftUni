USE `gamebar`;
ALTER TABLE employees
ADD COLUMN `middle_name` VARCHAR(50) NOT NULL;
SELECT * FROM `employees`;