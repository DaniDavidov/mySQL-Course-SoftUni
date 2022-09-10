USE `car_rental`;

CREATE TABLE `categories` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(50) NOT NULL,
    `daily_rate` INT,
    `weekly_rate` INT,
    `monthly_rate` INT,
    `weekend_rate` INT
);

INSERT INTO `categories` (`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`) VALUES ('sport', 10, 10, 10, 10);
INSERT INTO `categories` (`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`) VALUES ('daily', 2, 2, 2, 2);
INSERT INTO `categories` (`category`) VALUES ('old');


CREATE TABLE `cars` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `plate_number` VARCHAR(10) NOT NULL,
    `make` VARCHAR(20),
    `model` VARCHAR(30) NOT NULL,
    `car_year` YEAR NOT NULL,
    `category_id` INT NOT NULL,
    `doors` INT,
    `picture` BLOB,
    `car_condition` VARCHAR(100),
    `available` BOOLEAN
);

INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `car_condition`, `available`)
VALUES ('C 1234 QW', 'Nissan', 'Z21', 1967, 3, 3, 'good', TRUE);
INSERT INTO `cars` (`plate_number`, `model`, `car_year`, `category_id`, `available`) VALUES ('B 5678 TX', 'Nissan', '2013', 1, TRUE);
INSERT INTO `cars` (`plate_number`, `model`, `car_year`, `category_id`, `available`) VALUES ('A 5678 TX', 'Trabant', '1970', 1, FALSE);

CREATE TABLE `employees` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `title` VARCHAR(30) NOT NULL,
    `notes` TEXT
);

INSERT INTO `employees` (`first_name`, `last_name`, `title`, `notes`)
  VALUES ('Ivan', 'Ivanov', 'director', 'proba'),
		 ('Milka', 'Draganova', 'casier', 'proba'),
         ('Pesho', 'Peshev', 'driver', 'proba');
         

CREATE TABLE `customers` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `driver_licence_number` INT NOT NULL,
    `full_name` VARCHAR(60) NOT NULL,
    `adress` VARCHAR(100),
    `city` VARCHAR(50) NOT NULL,
    `zip_code` INT(4),
    `notes` TEXT
);

INSERT INTO `customers` (`driver_licence_number`, `full_name`, `adress`, `city`, `zip_code`, `notes`)
  VALUES (123456, 'Ivan Ivanov', 'street Nezabravka 10', 'Varna', 9000, 'the best driver');
  INSERT INTO `customers` (`driver_licence_number`, `full_name`, `city`)
  VALUES (456789, 'Milka Draganova', 'Sofia'),
         (741852, 'Pesho Peshev', 'Sofia');


CREATE TABLE `rental_orders` (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    car_id INT NOT NULL,
    car_condition TEXT,
    tank_level ENUM ('FULL', 'NOT FULL', 'EMPTY') DEFAULT 'EMPTY',
    kilometrage_start INT,
    kilometrage_end INT,
    total_kilometrage INT(10) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    total_days INT,
    rate_applied DOUBLE,
    tax_rate DOUBLE,
    order_status ENUM ('ORDERED', 'FULFILLED') DEFAULT 'ORDERED' NOT NULL,
    notes TEXT
);

INSERT INTO `rental_orders` 
    (`employee_id`, `customer_id`, `car_id`, `car_condition`, `tank_level`, `kilometrage_start`, `kilometrage_end`, `total_kilometrage`, 
    `start_date`, `end_date`, `total_days`, `rate_applied`, `tax_rate`, `order_status`)
  VALUES (1, 1, 1, 'Perfect', 'FULL', 1000, 3000, 2000, '2022-01-01', '2022-01-02', 1, TRUE, 20.05, 'FULFILLED');
  
INSERT INTO `rental_orders` 
	(`employee_id`, `customer_id`, `car_id`, `tank_level`, `total_kilometrage`, `start_date`, `end_date`, `order_status`)
	VALUES
			(2, 2, 2, 'NOT FULL', 1000, '2022-01-01', '2068-01-01', 'ORDERED'),
			(3, 3, 3, 'FULL', 1000, '2022-01-11', '2068-01-01', 'ORDERED');
            

ALTER TABLE `rental_orders`
	ADD CONSTRAINT fk_rental_orders_employees
    FOREIGN KEY rental_orders(`employee_id`) REFERENCES employees(`id`),
    ADD CONSTRAINT fk_rental_orders_customers
    FOREIGN KEY rental_orders(`customer_id`) REFERENCES customers(`id`),
    ADD CONSTRAINT fk_rental_orders_cars
    FOREIGN KEY rental_orders(`car_id`) REFERENCES cars(`id`);