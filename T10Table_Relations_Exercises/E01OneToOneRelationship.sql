CREATE TABLE `people` (
	`person_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(9, 2) NOT NULL,
    `passport_id` INT NOT NULL UNIQUE
);

CREATE TABLE `passports` (
	`passport_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `passport_number` VARCHAR(50) NOT NULL UNIQUE
);

ALTER TABLE `people`
ADD CONSTRAINT `fk_people_passports`
FOREIGN KEY `people`(passport_id)
REFERENCES `passports`(passport_id);

INSERT INTO passports (passport_id, passport_number) 
VALUES 
	(101, 'N34FG21B'), 
	(102, 'K65LO4R7'), 
	(103, 'ZE657QP2');
    
INSERT INTO people (person_id, first_name, salary,	passport_id) 
VALUES 
	(1, 'Roberto', 43300.00, 102), 
	(2, 'Tom', 56100.00, 103), 
	(3, 'Yana', 60200.00, 101);