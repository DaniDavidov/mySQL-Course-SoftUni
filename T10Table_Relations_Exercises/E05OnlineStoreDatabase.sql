CREATE TABLE `cities` (
	`city_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE `customers` (
	`customer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `birthday` DATE,
    `city_id` INT,
    CONSTRAINT `fk_customers_cities`
    FOREIGN KEY (`city_id`)
    REFERENCES `cities`(`city_id`)
);

CREATE TABLE `orders` (
	`order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT,
    CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customers`(`customer_id`)
);

CREATE TABLE `order_items` (
	`order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `item_id` INT
);

CREATE TABLE `items` (
	`item_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `item_type_id` INT
);

ALTER TABLE `order_items`
ADD CONSTRAINT `fk_order_items_items`
FOREIGN KEY `order_items`(item_id)
REFERENCES `items`(`item_id`);

CREATE TABLE `item_types` (
	`item_type_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

ALTER TABLE `items` 
ADD CONSTRAINT `fk_items_item_types`
FOREIGN KEY `items`(`item_type_id`)
REFERENCES `item_types`(`item_type_id`);

ALTER TABLE `order_items`
DROP PRIMARY KEY,
ADD CONSTRAINT `fk_order_items_orders`
FOREIGN KEY `order_items`(`order_id`)
REFERENCES `orders`(`order_id`);

ALTER TABLE `order_items`
ADD CONSTRAINT `pk_order_items`
PRIMARY KEY (`order_id`, `item_id`);

