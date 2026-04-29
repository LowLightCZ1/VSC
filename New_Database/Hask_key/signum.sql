-- Active: 1770811575495@@127.0.0.1@3306@mydb


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(40) NOT NULL,
  `lastname` VARCHAR(60) NOT NULL,
  `birthdate` DATE NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `housenum` VARCHAR(10) NULL,
  `posta` VARCHAR(5) NULL,
  `city` VARCHAR(210) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(128) NULL,
  `email` VARCHAR(255) NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`certificate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`certificate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `certifkey` VARCHAR(16) NOT NULL,
  `clients_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `certifkey_UNIQUE` (`certifkey` ASC) ,
  INDEX `fk_certificate_clients_idx` (`clients_id` ASC),
  CONSTRAINT `fk_certificate_clients`
    FOREIGN KEY (`clients_id`)
    REFERENCES `mydb`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

