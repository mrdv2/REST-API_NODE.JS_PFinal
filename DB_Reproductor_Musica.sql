DROP database IF exists reproductor;
create database reproductor;
USE `reproductor` ;

-- -----------------------------------------------------
-- Table `mydb`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `generos` (
  `idgenero` INT NOT NULL AUTO_INCREMENT,
  `nombregenero` VARCHAR(45) NOT NULL unique,
  PRIMARY KEY (`idgenero`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artistas` (
  `idartista` INT NOT NULL AUTO_INCREMENT,
  `nombreartista` VARCHAR(45) NOT NULL unique,
  `idgenero` INT NOT NULL,
  PRIMARY KEY (`idartista`),
  INDEX `fk_artistas_Genero1_idx` (`idgenero` ASC),
  CONSTRAINT `fk_artistas_Genero1`
    FOREIGN KEY (`idgenero`)
    REFERENCES `generos` (`idgenero`)
    ON DELETE cascade
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `canciones` (
  `idcancion` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `album` VARCHAR(45) NOT NULL,
  `anio` YEAR(4) NOT NULL,
  `idartista` INT NOT NULL,
  PRIMARY KEY (`idcancion`),
  INDEX `fk_canciones_artistas_idx` (`idartista` ASC) ,
  CONSTRAINT `fk_canciones_artistas`
    FOREIGN KEY (`idartista`)
    REFERENCES `artistas` (`idartista`)
    ON DELETE cascade
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `listas` (
  `idlista` INT NOT NULL AUTO_INCREMENT,
  `nombrelista` VARCHAR(45) NOT NULL unique,
  PRIMARY KEY (`idlista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cancionesEnLista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cancionesEnListas` (
  `idlista` int NOT NULL,
  `idcancion` INT NOT NULL,
  PRIMARY KEY (`idlista`, `idcancion`),
  INDEX `fk_Lista_has_canciones_canciones1_idx` (`idcancion` ASC),
  INDEX `fk_Lista_has_canciones_Lista1_idx` (`idlista` ASC),
  CONSTRAINT `fk_Lista_has_canciones_Lista1`
    FOREIGN KEY (`idlista`)
    REFERENCES `listas` (`idlista`)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Lista_has_canciones_canciones1`
    FOREIGN KEY (`idcancion`)
    REFERENCES `canciones` (`idcancion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB;




