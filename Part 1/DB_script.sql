-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Tinyhub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Tinyhub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tinyhub` ;
USE `Tinyhub` ;

-- -----------------------------------------------------
-- Table `Tinyhub`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`User` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`User` (
  `User_ID` INT NOT NULL,
  `User_Name` VARCHAR(45) NOT NULL,
  `Start_Date` DATE NOT NULL,
  `End_Date` DATE NULL,
  `Access_Level` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`User_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Account` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Account` (
  `User_ID` INT NOT NULL,
  `Display_Name` VARCHAR(10) NULL,
  `Email_ID` VARCHAR(30) NOT NULL,
  `Password` VARCHAR(12) NOT NULL,
  `Account_Status` VARCHAR(15) NOT NULL,
  UNIQUE INDEX `Display_Name_UNIQUE` (`Display_Name` ASC) VISIBLE,
  INDEX `User_ID_idx` (`User_ID` ASC) VISIBLE,
  UNIQUE INDEX `User_ID_UNIQUE` (`User_ID` ASC) VISIBLE,
  UNIQUE INDEX `Emial_ID_UNIQUE` (`Email_ID` ASC) VISIBLE,
  PRIMARY KEY (`User_ID`),
  CONSTRAINT `User_ID`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Tinyhub`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Department` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Department` (
  `Dept_No` VARCHAR(10) NOT NULL,
  `Department_Name` VARCHAR(100) NULL,
  PRIMARY KEY (`Dept_No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Professor` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Professor` (
  `Professor_ID` INT NOT NULL,
  `Feedback` VARCHAR(100) NULL,
  `Course_List` VARCHAR(45) NULL,
  `Dept_No` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Professor_ID`),
  INDEX `Dept_No_idx` (`Dept_No` ASC) VISIBLE,
  UNIQUE INDEX `Professor_ID_UNIQUE` (`Professor_ID` ASC) VISIBLE,
  CONSTRAINT `Professor_ID`
    FOREIGN KEY (`Professor_ID`)
    REFERENCES `Tinyhub`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Dept_No`
    FOREIGN KEY (`Dept_No`)
    REFERENCES `Tinyhub`.`Department` (`Dept_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Staff` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Staff` (
  `Staff_ID` INT NOT NULL,
  `Dep_No` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  INDEX `Dept_No_idx` (`Dep_No` ASC) VISIBLE,
  CONSTRAINT `Staff_ID`
    FOREIGN KEY (`Staff_ID`)
    REFERENCES `Tinyhub`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Dep_No`
    FOREIGN KEY (`Dep_No`)
    REFERENCES `Tinyhub`.`Department` (`Dept_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Semester`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Semester` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Semester` (
  `Semester_ID` VARCHAR(10) NOT NULL,
  `Season` VARCHAR(15) NOT NULL,
  `Year` INT NOT NULL,
  PRIMARY KEY (`Semester_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Student` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Student` (
  `Student_ID` INT NOT NULL,
  `Department_No` VARCHAR(10) NOT NULL,
  `Grade_List` VARCHAR(10) NULL,
  `Course_ID_List` VARCHAR(45) NULL,
  `Semester_ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Student_ID`, `Department_No`),
  INDEX `Dept_No_idx` (`Department_No` ASC) VISIBLE,
  INDEX `Semester_ID_idx` (`Semester_ID` ASC) VISIBLE,
  CONSTRAINT `Department_No`
    FOREIGN KEY (`Department_No`)
    REFERENCES `Tinyhub`.`Department` (`Dept_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Student_ID`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `Tinyhub`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Semester_ID`
    FOREIGN KEY (`Semester_ID`)
    REFERENCES `Tinyhub`.`Semester` (`Semester_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Program` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Program` (
  `Program_ID` INT NOT NULL,
  `Dept_Num` VARCHAR(10) NULL,
  `Program_Name` VARCHAR(100) NULL,
  PRIMARY KEY (`Program_ID`),
  INDEX `Dept_No_idx` (`Dept_Num` ASC) VISIBLE,
  CONSTRAINT `Dept_Num`
    FOREIGN KEY (`Dept_Num`)
    REFERENCES `Tinyhub`.`Department` (`Dept_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Course` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Course` (
  `C_ID` VARCHAR(10) NOT NULL,
  `Course_Name` VARCHAR(50) NOT NULL,
  `Capacity` INT NULL,
  `Department_Num` VARCHAR(10) NOT NULL,
  `Grades` VARCHAR(10) NULL,
  `No_of_Problems` INT NULL,
  `Grades_of_Problems` VARCHAR(10) NULL,
  `Semester_ID` VARCHAR(10) NOT NULL,
  `Pre-requisite_CIDList` VARCHAR(10) NULL,
  PRIMARY KEY (`C_ID`),
  INDEX `Dept_No_idx` (`Department_Num` ASC) VISIBLE,
  CONSTRAINT `Department_Num`
    FOREIGN KEY (`Department_Num`)
    REFERENCES `Tinyhub`.`Department` (`Dept_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Feedback` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Feedback` (
  `ProfessorID` INT NOT NULL,
  `Feedback` VARCHAR(100) NULL,
  `StudentID` INT NOT NULL,
  INDEX `Student_ID_idx` (`StudentID` ASC) VISIBLE,
  INDEX `Professor_ID_idx` (`ProfessorID` ASC) VISIBLE,
  CONSTRAINT `StudentID`
    FOREIGN KEY (`StudentID`)
    REFERENCES `Tinyhub`.`Student` (`Student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ProfessorID`
    FOREIGN KEY (`ProfessorID`)
    REFERENCES `Tinyhub`.`Professor` (`Professor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`CourseList`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`CourseList` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`CourseList` (
  `C_ID` VARCHAR(10) NOT NULL,
  `Prof_ID` INT NOT NULL,
  `Sem_ID` VARCHAR(10) NOT NULL,
  INDEX `Professor_ID_idx` (`Prof_ID` ASC) VISIBLE,
  INDEX `Sem_ID_idx` (`Sem_ID` ASC) VISIBLE,
  CONSTRAINT `Prof_ID`
    FOREIGN KEY (`Prof_ID`)
    REFERENCES `Tinyhub`.`Professor` (`Professor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `C_ID`
    FOREIGN KEY (`C_ID`)
    REFERENCES `Tinyhub`.`Course` (`C_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Sem_ID`
    FOREIGN KEY (`Sem_ID`)
    REFERENCES `Tinyhub`.`Semester` (`Semester_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '\n';


-- -----------------------------------------------------
-- Table `Tinyhub`.`Teaching_Assistant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Teaching_Assistant` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Teaching_Assistant` (
  `TA_ID` INT NOT NULL,
  `CourseID` VARCHAR(10) NOT NULL,
  `DeptNo` VARCHAR(10) NOT NULL,
  `SemesterID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`TA_ID`),
  INDEX `C_ID_idx` (`CourseID` ASC) VISIBLE,
  INDEX `Sem_ID_idx` (`SemesterID` ASC) VISIBLE,
  INDEX `Dept_No_idx` (`DeptNo` ASC) VISIBLE,
  CONSTRAINT `TA_ID`
    FOREIGN KEY (`TA_ID`)
    REFERENCES `Tinyhub`.`Student` (`Student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `Tinyhub`.`Course` (`C_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SemesterID`
    FOREIGN KEY (`SemesterID`)
    REFERENCES `Tinyhub`.`Semester` (`Semester_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DeptNo`
    FOREIGN KEY (`DeptNo`)
    REFERENCES `Tinyhub`.`Department` (`Dept_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tinyhub`.`Prerequisites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tinyhub`.`Prerequisites` ;

CREATE TABLE IF NOT EXISTS `Tinyhub`.`Prerequisites` (
  `PreCourse_ID` VARCHAR(10) NOT NULL,
  `Course_Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`PreCourse_ID`),
  CONSTRAINT `PreCourse_ID`
    FOREIGN KEY (`PreCourse_ID`)
    REFERENCES `Tinyhub`.`Course` (`C_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
