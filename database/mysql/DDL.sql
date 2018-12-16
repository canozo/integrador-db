-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_escuela
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_escuela
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_escuela`;
USE `db_escuela` ;

-- -----------------------------------------------------
-- Table `db_escuela`.`tbl_persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_escuela`.`tbl_persona` (
  `codigo_persona` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  PRIMARY KEY (`codigo_persona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_escuela`.`tbl_estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_escuela`.`tbl_estudiantes` (
  `codigo_estudiante` INT NOT NULL AUTO_INCREMENT,
  `codigo_persona` INT NOT NULL,
  `numero_cuenta` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo_estudiante`),
  UNIQUE INDEX `numero_cuenta_UNIQUE` (`numero_cuenta` ASC) ,
  INDEX `fk_tbl_estudiantes_tbl_persona_idx` (`codigo_persona` ASC) ,
  CONSTRAINT `fk_tbl_estudiantes_tbl_persona`
    FOREIGN KEY (`codigo_persona`)
    REFERENCES `db_escuela`.`tbl_persona` (`codigo_persona`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_escuela`.`tbl_maestro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_escuela`.`tbl_maestro` (
  `codigo_maestro` INT NOT NULL,
  `codigo_persona` INT NOT NULL,
  `uvs_asignadas` INT NULL,
  PRIMARY KEY (`codigo_maestro`),
  INDEX `fk_tbl_maestro_tbl_persona1_idx` (`codigo_persona` ASC) ,
  CONSTRAINT `fk_tbl_maestro_tbl_persona1`
    FOREIGN KEY (`codigo_persona`)
    REFERENCES `db_escuela`.`tbl_persona` (`codigo_persona`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_escuela`.`tbl_seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_escuela`.`tbl_seccion` (
  `codigo_seccion` INT NOT NULL,
  `codigo_maestro` INT NOT NULL,
  `nombre_clase` VARCHAR(45) NULL,
  `uvs` INT NULL,
  PRIMARY KEY (`codigo_seccion`),
  INDEX `fk_tbl_seccion_tbl_maestro1_idx` (`codigo_maestro` ASC) ,
  CONSTRAINT `fk_tbl_seccion_tbl_maestro1`
    FOREIGN KEY (`codigo_maestro`)
    REFERENCES `db_escuela`.`tbl_maestro` (`codigo_maestro`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_escuela`.`tbl_seccionXestudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_escuela`.`tbl_seccionXestudiante` (
  `codigo_seccion` INT NOT NULL,
  `codigo_estudiante` INT NOT NULL,
  PRIMARY KEY (`codigo_seccion`, `codigo_estudiante`),
  INDEX `fk_tbl_seccionXestudiante_tbl_estudiantes1_idx` (`codigo_estudiante` ASC) ,
  CONSTRAINT `fk_tbl_seccionXestudiante_tbl_seccion1`
    FOREIGN KEY (`codigo_seccion`)
    REFERENCES `db_escuela`.`tbl_seccion` (`codigo_seccion`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_seccionXestudiante_tbl_estudiantes1`
    FOREIGN KEY (`codigo_estudiante`)
    REFERENCES `db_escuela`.`tbl_estudiantes` (`codigo_estudiante`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
