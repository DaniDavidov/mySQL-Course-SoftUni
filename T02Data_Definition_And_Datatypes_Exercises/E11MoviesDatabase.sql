
USE `movies`;
CREATE TABLE `directors` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

INSERT INTO `directors` (`director_name`, `notes`) VALUES ('Dani', 'scene number 1');
INSERT INTO `directors` (`director_name`, `notes`) VALUES ('Pepi', 'scene number 2');
INSERT INTO `directors` (`director_name`, `notes`) VALUES ('Gogo', 'scene number 3');
INSERT INTO `directors` (`director_name`, `notes`) VALUES ('Pesho', 'scene number 4');
INSERT INTO `directors` (`director_name`, `notes`) VALUES ('Gosho', 'scene number 5');

CREATE TABLE `genres` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

INSERT INTO `genres` (`genre_name`, `notes`) VALUES ('Horror','movie');
INSERT INTO `genres` (`genre_name`) VALUES ('Action');
INSERT INTO `genres` (`genre_name`, `notes`) VALUES ('Comedy','film');
INSERT INTO `genres` (`genre_name`, `notes`) VALUES ('Adventure','Series');
INSERT INTO `genres` (`genre_name`, `notes`) VALUES ('Criminal','Short movie');


CREATE TABLE `categories` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `category_name` VARCHAR(100) NOT NULL,
 `notes` TEXT);
 
 
 INSERT INTO `categories` (`category_name`, `notes`) VALUES ('comedy','movie');
 INSERT INTO `categories` (`category_name`) VALUES ('drama');
 INSERT INTO `categories` (`category_name`, `notes`) VALUES ('fantasy','film');
 INSERT INTO `categories` (`category_name`, `notes`) VALUES ('action','series');
 INSERT INTO `categories` (`category_name`, `notes`) VALUES ('animation','documentary');
 
 
 CREATE TABLE `movies` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `title` VARCHAR(50) NOT NULL,
    `director_id` INT NOT NULL,
    `copyright_year` YEAR NOT NULL,
    `length` INT,
    `genre_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `rating` INT,
    `notes` TEXT
 );
 
 INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`) VALUES ('Shpionski svalki', 1, 1998, 320, 2, 1, 10, 'super zabavno');
 INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`) VALUES ('Otneseni ot vihara', 2, 1999, 3320, 1, 2, 9, 'super dramatichno');
 INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`) VALUES ('Avatar', 3, 2000, 3240, 4, 3, 8, 'super nerealno');
 INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`) VALUES ('Golemia zriv', 4, 2020, 3205, 3, 4, 7, 'super serial');
 INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `genre_id`, `category_id`) VALUES ('Proba', 5, 2021, 5, 5);