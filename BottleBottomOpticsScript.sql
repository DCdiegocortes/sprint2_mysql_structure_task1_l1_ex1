-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`client` ;

CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `phone` VARCHAR(30) NULL,
  `street` VARCHAR(100) NULL,
  `street_number` VARCHAR(10) NULL,
  `city` VARCHAR(50) NULL,
  `postal_code` VARCHAR(20) NULL,
  `email` VARCHAR(100) NOT NULL,
  `registration_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Default: CURRENT_TIMESTAMP >> Will be assigned automatically',
  `referred_by_client_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_referred_by_client_id_idx` (`referred_by_client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_client1`
    FOREIGN KEY (`referred_by_client_id`)
    REFERENCES `mydb`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`employee` ;

CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`sale` ;

CREATE TABLE IF NOT EXISTS `mydb`.`sale` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sale_Date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Default: CURRENT_TIMESTAMP >> Will be assigned automatically',
  `client_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sale_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_sale_client1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `mydb`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`supplier` ;

CREATE TABLE IF NOT EXISTS `mydb`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `street_number` VARCHAR(10) NOT NULL,
  `floor` VARCHAR(10) NOT NULL,
  `door` VARCHAR(10) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `postal_code` VARCHAR(20) NOT NULL,
  `country` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(30) NOT NULL,
  `fax` VARCHAR(30) NULL,
  `tax_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tax_id_UNIQUE` (`tax_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`eyeglasses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`eyeglasses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`eyeglasses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(100) NOT NULL,
  `right_lens_graduation` DECIMAL(4,2) NOT NULL,
  `left_lens_graduation` DECIMAL(4,2) NOT NULL,
  `frame_type` ENUM('floating', 'plastic', 'metal') NOT NULL,
  `frame_color` VARCHAR(50) NOT NULL,
  `right_lens_color` VARCHAR(50) NOT NULL,
  `left_lens_color` VARCHAR(50) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `supplier_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_eyeglasses_supplier1_idx` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_eyeglasses_supplier1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `mydb`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sale_eyeglasses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`sale_eyeglasses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`sale_eyeglasses` (
  `sale_id` INT NOT NULL,
  `eyeglasses_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`sale_id`, `eyeglasses_id`),
  INDEX `fk_sale_eyeglasses_eyeglasses1_idx` (`eyeglasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_eyeglasses_sale`
    FOREIGN KEY (`sale_id`)
    REFERENCES `mydb`.`sale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_eyeglasses_eyeglasses1`
    FOREIGN KEY (`eyeglasses_id`)
    REFERENCES `mydb`.`eyeglasses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
