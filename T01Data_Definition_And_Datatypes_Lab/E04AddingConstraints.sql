ALTER TABLE `products`
ADD CONSTRAINT `cat_fk`
 FOREIGN KEY (`category_id`)
 REFERENCES `gamebar`.`categories` (id)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;
 