CREATE TABLE `mountains`(
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `peaks`(
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `mountain_id` INT NOT NULL,
    CONSTRAINT `fk_peaks_mountains`
    FOREIGN KEY `peaks`(`mountain_id`)
    REFERENCES `mountains`(`id`)
);