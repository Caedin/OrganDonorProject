-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema OrganDonorSystem
-- -----------------------------------------------------
Award
-- -----------------------------------------------------
-- Schema OrganDonorSystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OrganDonorSystem` DEFAULT CHARACTER SET latin1 ;
USE `OrganDonorSystem` ;

-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`BloodType`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`BloodType` (
  `bloodTypeID` INT(11) NOT NULL AUTO_INCREMENT,
  `bloodTypeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bloodTypeID`),
  UNIQUE INDEX `bloodTypeID_UNIQUE` (`bloodTypeID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`State`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`State` (
  `stateID` INT(11) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`stateID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`City`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`City` (
  `cityID` INT(11) NOT NULL AUTO_INCREMENT,
  `stateStateID` INT(11) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cityID`),
  INDEX `fk_State_stateID_ibfk_1` (`stateStateID` ASC),
  CONSTRAINT `fk_State_stateID_ibfk_1`
    FOREIGN KEY (`stateStateID`)
    REFERENCES `OrganDonorSystem`.`State` (`stateID`))
ENGINE = InnoDB
AUTO_INCREMENT = 54
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Medical_Personnel`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Medical_Personnel` (
  `medicalPersonnelId` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(20) NOT NULL,
  `userPassword` VARCHAR(20) NOT NULL,
  `medicalFacility` VARCHAR(20) NOT NULL,
  `contactEmail` VARCHAR(50) NOT NULL,
  `phoneNumber` CHAR(13) NOT NULL,
  `validatedUser` TINYINT(1) NOT NULL,
  `create_time` DATETIME NOT NULL,
  `State_StateID` INT(11) NOT NULL,
  `City_CityID` INT(11) NOT NULL,
  PRIMARY KEY (`medicalPersonnelId`),
  UNIQUE INDEX `medicalPersonnelId_UNIQUE` (`medicalPersonnelId` ASC),
  INDEX `Medical_Personnel_ibfk_1` (`State_StateID` ASC),
  INDEX `Medical_Personnel_ibfk_2` (`City_CityID` ASC),
  CONSTRAINT `Medical_Personnel_ibfk_1`
    FOREIGN KEY (`State_StateID`)
    REFERENCES `OrganDonorSystem`.`State` (`stateID`),
  CONSTRAINT `Medical_Personnel_ibfk_2`
    FOREIGN KEY (`City_CityID`)
    REFERENCES `OrganDonorSystem`.`City` (`cityID`))
ENGINE = InnoDB
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Donor`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Donor` (
  `DonorID` INT(11) NOT NULL AUTO_INCREMENT,
  `phoneNumber` CHAR(13) NOT NULL,
  `registrationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endDate` TIMESTAMP NULL DEFAULT NULL,
  `medicalPersonnelId` INT(11) NOT NULL,
  `originalID` VARCHAR(50) NOT NULL,
  `gender` ENUM('M','F') NOT NULL,
  `age` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`DonorID`),
  UNIQUE INDEX `DonorID` (`DonorID` ASC),
  INDEX `fk_Donor_medicalPersonnelID_idx` (`medicalPersonnelId` ASC),
  CONSTRAINT `fk_Donor_medicalPersonnelID`
    FOREIGN KEY (`medicalPersonnelId`)
    REFERENCES `OrganDonorSystem`.`Medical_Personnel` (`medicalPersonnelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`OrganType`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`OrganType` (
  `organTypeID` INT(11) NOT NULL AUTO_INCREMENT,
  `organName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`organTypeID`),
  UNIQUE INDEX `organTypeID_UNIQUE` (`organTypeID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Recipients`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Recipients` (
  `recipentID` INT(11) NOT NULL AUTO_INCREMENT,
  `medicalPersonnelID` INT(11) NOT NULL,
  `severity` ENUM('1','2','3','4') NOT NULL,
  `orignialID` VARCHAR(50) NULL DEFAULT NULL,
  `gender` ENUM('M','F') NOT NULL,
  `dateRegistered` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `age` INT(11) UNSIGNED NOT NULL,
  `organsOrganID` INT(11) NULL DEFAULT NULL,
  `organTypeOrganTypeID` INT(11) NOT NULL,
  `bloodTypeBloodTypeID` INT(11) NOT NULL,
  `needsOrgan` ENUM('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`recipentID`),
  INDEX `fk_Medical_Personnel_medicalPersonnel_idx` (`medicalPersonnelID` ASC),
  INDEX `fk_BloodType_BloodType1_idx` (`bloodTypeBloodTypeID` ASC),
  INDEX `fk_organ_organID_idx_idx` (`organsOrganID` ASC),
  INDEX `fk_organType_organTypeID_ibfk_1` (`organTypeOrganTypeID` ASC),
  CONSTRAINT `fk_BloodType_BloodType1_idx`
    FOREIGN KEY (`bloodTypeBloodTypeID`)
    REFERENCES `OrganDonorSystem`.`BloodType` (`bloodTypeID`),
  CONSTRAINT `fk_Medical_Personnel_medicalPersonnel_idx`
    FOREIGN KEY (`medicalPersonnelID`)
    REFERENCES `OrganDonorSystem`.`Medical_Personnel` (`medicalPersonnelId`),
  CONSTRAINT `fk_organType_organTypeID_ibfk_1`
    FOREIGN KEY (`organTypeOrganTypeID`)
    REFERENCES `OrganDonorSystem`.`OrganType` (`organTypeID`),
  CONSTRAINT `fk_organ_organID_idx`
    FOREIGN KEY (`organsOrganID`)
    REFERENCES `OrganDonorSystem`.`Organs` (`OrganID`))
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Organs`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Organs` (
  `OrganID` INT(11) NOT NULL AUTO_INCREMENT,
  `organType_organtypeID` INT(11) NOT NULL,
  `BloodType_BloodTypeID` INT(11) NOT NULL,
  `dateAqcuired` DATETIME NOT NULL,
  `expirationDate` DATETIME NOT NULL,
  `MedicalPersonnelID` INT(11) NOT NULL,
  `OriginalID` VARCHAR(50) NOT NULL,
  `available` TINYINT(1) NOT NULL,
  `Recipient_RecipientID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`OrganID`),
  UNIQUE INDEX `OrganID_UNIQUE` (`OrganID` ASC),
  INDEX `Organs_RecipientID_idx` (`Recipient_RecipientID` ASC),
  INDEX `Organs_MedicalPersonnel_idx` (`MedicalPersonnelID` ASC),
  INDEX `Organs_BloodType_idx` (`BloodType_BloodTypeID` ASC),
  INDEX `Organs_organType_idx` (`organType_organtypeID` ASC),
  CONSTRAINT `Organs_BloodType`
    FOREIGN KEY (`BloodType_BloodTypeID`)
    REFERENCES `OrganDonorSystem`.`BloodType` (`bloodTypeID`),
  CONSTRAINT `Organs_MedicalPersonnel`
    FOREIGN KEY (`MedicalPersonnelID`)
    REFERENCES `OrganDonorSystem`.`Medical_Personnel` (`medicalPersonnelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Organs_RecipientID`
    FOREIGN KEY (`Recipient_RecipientID`)
    REFERENCES `OrganDonorSystem`.`Recipients` (`recipentID`),
  CONSTRAINT `Organs_organType`
    FOREIGN KEY (`organType_organtypeID`)
    REFERENCES `OrganDonorSystem`.`OrganType` (`organTypeID`))
ENGINE = InnoDB
AUTO_INCREMENT = 54
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Donor_has_Organs`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Donor_has_Organs` (
  `Organ_OrganID` INT(11) NOT NULL,
  `Donor_DonorID` INT(11) NOT NULL,
  INDEX `Donor_DonorID_idx` (`Donor_DonorID` ASC),
  INDEX `Organ_OrganID` (`Organ_OrganID` ASC),
  CONSTRAINT `Donor_DonorID`
    FOREIGN KEY (`Donor_DonorID`)
    REFERENCES `OrganDonorSystem`.`Donor` (`DonorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Organ_OrganID`
    FOREIGN KEY (`Organ_OrganID`)
    REFERENCES `OrganDonorSystem`.`Organs` (`OrganID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`MatchTable`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`MatchTable` (
  `transactionID` INT(11) NOT NULL AUTO_INCREMENT,
  `organID` INT(11) NOT NULL,
  `organType` INT(11) NOT NULL,
  `medicalPersonnelIdForRecipient` INT(11) NOT NULL,
  `recipientID` INT(11) NOT NULL,
  `acceptedOrDeclined` TINYINT(4) NULL DEFAULT NULL,
  `dateMatched` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transactionID`),
  INDEX `organID` (`organID` ASC),
  INDEX `organType` (`organType` ASC),
  INDEX `medicalPersonnelIdForRecipient` (`medicalPersonnelIdForRecipient` ASC),
  INDEX `recipientID` (`recipientID` ASC),
  CONSTRAINT `MatchTable_ibfk_1`
    FOREIGN KEY (`organID`)
    REFERENCES `OrganDonorSystem`.`Organs` (`OrganID`),
  CONSTRAINT `MatchTable_ibfk_2`
    FOREIGN KEY (`organType`)
    REFERENCES `OrganDonorSystem`.`OrganType` (`organTypeID`),
  CONSTRAINT `MatchTable_ibfk_3`
    FOREIGN KEY (`medicalPersonnelIdForRecipient`)
    REFERENCES `OrganDonorSystem`.`Medical_Personnel` (`medicalPersonnelId`),
  CONSTRAINT `MatchTable_ibfk_4`
    FOREIGN KEY (`recipientID`)
    REFERENCES `OrganDonorSystem`.`Recipients` (`recipentID`))
ENGINE = InnoDB
AUTO_INCREMENT = 192
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Medical_Personnnel_has_Donors`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Medical_Personnnel_has_Donors` (
  `Medical_Personnel_medicalPersonnelID` INT(11) NOT NULL,
  `Donor_DonorID` INT(11) NOT NULL,
  INDEX `fk_Medical_Personnel_has_Donors_Medical_Personnel1_idx_idx` (`Medical_Personnel_medicalPersonnelID` ASC),
  INDEX `fk_Medical_Personnel_has_Donors_Donors1_idx_idx` (`Donor_DonorID` ASC),
  CONSTRAINT `fk_Medical_Personnel_has_Donors_Donors1_idx`
    FOREIGN KEY (`Donor_DonorID`)
    REFERENCES `OrganDonorSystem`.`Donor` (`DonorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medical_Personnel_has_Donors_Medical_Personnel1_idx`
    FOREIGN KEY (`Medical_Personnel_medicalPersonnelID`)
    REFERENCES `OrganDonorSystem`.`Medical_Personnel` (`medicalPersonnelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Medical_Personnnel_has_Recipients`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Medical_Personnnel_has_Recipients` (
  `Medical_Personnel_medicalPersonnelID` INT(11) NOT NULL,
  `Recipient_recipientID` INT(11) NOT NULL,
  INDEX `fk_Medical_Personnel_has_Recipients1_idx_idx` (`Recipient_recipientID` ASC),
  INDEX `fk_Medical_Personnel_has_Medical_Personnel1_idx_idx` (`Medical_Personnel_medicalPersonnelID` ASC),
  CONSTRAINT `fk_Medical_Personnel_has_Medical_Personnel1_idx`
    FOREIGN KEY (`Medical_Personnel_medicalPersonnelID`)
    REFERENCES `OrganDonorSystem`.`Medical_Personnel` (`medicalPersonnelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medical_Personnel_has_Recipients1_idx`
    FOREIGN KEY (`Recipient_recipientID`)
    REFERENCES `OrganDonorSystem`.`Recipients` (`recipentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`OrganExpirationTime`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`OrganExpirationTime` (
  `timeUntilExpiration` TIME NOT NULL,
  `organType_organTypeID` INT(11) NOT NULL,
  INDEX `fk_OrganExpirationTime_OrganTypeID_idx` (`organType_organTypeID` ASC),
  CONSTRAINT `fk_OrganExpirationTime_OrganType1`
    FOREIGN KEY (`organType_organTypeID`)
    REFERENCES `OrganDonorSystem`.`OrganType` (`organTypeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Award`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Award` 
(
  `awardID` INT(11) NOT NULL AUTO_INCREMENT,
  `medicalPersonnelID` INT(11) NOT NULL,
  `awardType`	VARCHAR(45) not null,
  `awardMinimum`	int(11) not null,
	PRIMARY KEY (`awardID`),
	FOREIGN KEY (`medicalPersonnelID`) 
        REFERENCES Medical_Personnel(`medicalPersonnelID`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
