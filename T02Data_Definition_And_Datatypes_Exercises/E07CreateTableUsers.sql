USE `minions`;
CREATE TABLE `users` (
  `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(26) NOT NULL,
  `profile_picture` BLOB,
  `last_login_time` TIMESTAMP,
  `is_deleted` BOOLEAN
);

INSERT INTO `users` (`username` ,`password`, `last_login_time`, `is_deleted`) VALUES('Ivan', 'aiudshfiu', '2022-01-11 14:19', FALSE); 
INSERT INTO `users` (`username` ,`password`, `is_deleted`) VALUES('Dragan', '8437hfd', TRUE); 
INSERT INTO `users` (`username` ,`password`, `last_login_time`, `is_deleted`) VALUES('Maria', 'uyrg74', '2020-01-11 14:19', FALSE); 
INSERT INTO `users` (`username` ,`password`, `last_login_time`) VALUES('Todor', 'gf45', '2022-01-11 14:19'); 
INSERT INTO `users` (`username` ,`password`, `last_login_time`, `is_deleted`) VALUES('Boev', 'kjfdhg8', '2022-01-11 14:19', FALSE); 