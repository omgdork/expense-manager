DROP DATABASE IF EXISTS `expense_manager`;
CREATE DATABASE IF NOT EXISTS `expense_manager`
  DEFAULT CHARACTER SET utf8;
USE `expense_manager`;

DROP TABLE IF EXISTS `expense_manager`.`categories`;
CREATE TABLE IF NOT EXISTS `expense_manager`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `expense_manager`.`expenses`;
CREATE TABLE IF NOT EXISTS `expense_manager`.`expenses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `category_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `value` DECIMAL(15, 4) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`category_id`)
    REFERENCES `expense_manager`.`categories` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
