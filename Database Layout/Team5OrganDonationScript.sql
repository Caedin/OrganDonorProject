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

-- -----------------------------------------------------
-- Schema OrganDonorSystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OrganDonorSystem` DEFAULT CHARACTER SET latin1 ;
USE `OrganDonorSystem` ;

-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`BloodType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`BloodType`;
CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`BloodType` (
`bloodTypeID` INT(11) NOT NULL AUTO_INCREMENT,
`bloodTypeName` VARCHAR(45) NOT NULL,
PRIMARY KEY (`bloodTypeID`),
UNIQUE INDEX `bloodTypeID_UNIQUE` (`bloodTypeID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`State`;
CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`State` (
`stateID` INT(11)  NOT NULL AUTO_INCREMENT,
`state` VARCHAR(45) NOT NULL,
PRIMARY KEY (`stateID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`City`;
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
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Medical_Personnel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`Medical_Personnel`;
CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`Medical_Personnel` (
`medicalPersonnelId` INT(11) NOT NULL AUTO_INCREMENT,
`userName` VARCHAR(20) NOT NULL,
`userPassword` VARCHAR(20) NOT NULL,
`medicalFacility` VARCHAR(255) NOT NULL,
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
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Donor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`Donor`;
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
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`OrganType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`OrganType`;
CREATE TABLE IF NOT EXISTS `OrganDonorSystem`.`OrganType` (
`organTypeID` INT(11) NOT NULL AUTO_INCREMENT,
`organName` VARCHAR(45) NOT NULL,
PRIMARY KEY (`organTypeID`),
UNIQUE INDEX `organTypeID_UNIQUE` (`organTypeID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Recipients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`Recipients`;
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
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Organs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`Organs`;
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
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Donor_has_Organs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`Donor_has_Organs`;
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
DROP TABLE IF EXISTS  `OrganDonorSystem`.`MatchTable`;
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
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `OrganDonorSystem`.`Medical_Personnnel_has_Donors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `OrganDonorSystem`.`Medical_Personnnel_has_Donors`;
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
DROP TABLE IF EXISTS  `OrganDonorSystem`.`Medical_Personnnel_has_Recipients`;
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
DROP TABLE IF EXISTS  `OrganDonorSystem`.`OrganExpirationTime`;
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
DROP TABLE IF EXISTS  `OrganDonorSystem`.`Award`;
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


-- -----------------------------------------------------
-- PREPOPULATED DATE (FOR DEMO 4/23/2015)  - Work Complete by Altair
-- -----------------------------------------------------
-- State
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Alaska');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Albama');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Arkansas');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Arizona');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('California');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Colorado');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Connecticut');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('District of Columbia');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Delaware');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Florida');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Georgia');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Hawaii');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Iowa');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Idaho');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Illinois');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Indiana');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Kansas');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Kentucky');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Louisiana');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Massachusetts');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Maryland');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Maine');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Michigan');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Minnesota');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Missouri');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Mississippi');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Montana');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('North Carolina');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('North Dakota');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Nebraska');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('New Hampshire');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('New Jersey');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('New Mexico');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Nevada');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('New York');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Ohio');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Oklahoma');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Oregon');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Pennsylvania');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Rhode Island');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('South Carolina');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('South Dakota');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Tennessee');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Texas');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Utah');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Virginia');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Vermont');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Washington');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Wisconsin');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('West Virginia');
INSERT INTO `OrganDonorSystem`.`State` ( `state`) VALUES ('Wyoming');

-- City
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('1','Juneau');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('1','Anchorage');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('1','Fairbanks');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('2','Montgomery');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('2','Birmingham');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('2','Huntsville');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('3','Little Rock');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('3','Fayetteville');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ('3','Fort Smith');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '4','Phoenix');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '4','Mesa');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '4','Glendale');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '5','Las Vegas');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '5','Los Angeles');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '5','San Jose');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '6','Colorado Springs');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '6','Denver');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '6','Loveland');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '7','New Haven');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '7','Hartford');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '7','Milford');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '8','Northwest Washington');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '8','Columbia Heights');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '8','Douglass');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '9','Georgetown');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '9','Seaford');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '9','Millsboro');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '10','Tampa');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '10','Orlando');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '10','Miami');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '11','Atlanta');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '11','Waycross');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '11','Albany');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '12','Honolulu');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '12','Kahului');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '12','Hilo');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '13','Des Moines');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '13','Cedar Rapids');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '13','Marshall Town');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '14','Missoula');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '14','Boise');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '14','Nampa');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '15','Chicago');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '15','Bloomington');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '15','Springfield');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '16','Fort Wayne');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '16','Bloomington');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '16','Evansville');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '17','Salina');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '17','Topeka');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '17','Emporia');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '18','Bowling Green');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '18','Hopkinsville');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '18','Lexington');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '19','New Orleans');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '19','Baton Rouge');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '19','Shreveport');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '20','Boston');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '20','Worcester');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '20','Springfield');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '21','Baltimore');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '21','Columbia');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '21','Germantown');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '22','Augusta');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '22','Caribou');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '22','Portland');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '23','Detroit');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '23','Grand Rapids');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '23','Warren');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '24','Minneapolis');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '24','St. Paul');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '24','Rochester');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '25','Kansas City');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '25','St. Louis');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '25','Springfield');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '26','Jackson');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '26','Gulfport');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '26','Southaven');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '27','Billings');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '27','Missoula');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '27','Great Falls');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '28','Charlotte');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '28','Raleigh');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '28','Greensboro');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '29','Fargo');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '29','Bismark');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '29','Minot');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '30','Omaha');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '30','Lincoln');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '30','Bellevue');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '31','Berlin');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '31','Claremont');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '31','Concord');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '32','Newark');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '32','Jersey City');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '32','Paterson');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '33','Albuquerque');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '33','Las Cruces');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '33','Rio Rancho');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '34','Las Vegas');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '34','Henderson');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '34','Reno');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '35','New York');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '35','Buffalo');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '35','Yonkers');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '36','Columbus');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '36','Cleveland');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '36','Cincinnati');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '37','Oklahoma City');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '37','Tulsa');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '37','Norman');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '38','Portland');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '38','Salem');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '38','Eugene');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '39','Philadelphia');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '39','Pittsburgh');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '39','Allentown');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '40','Providence');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '40','Portsmouth');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '40','Fall River');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '41','Augusta');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '41','Charleston');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '41','Myrtle Beach');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '42','Aberdeen');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '42','Watertown');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '42','Rapid City');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '43','Asheville');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '43','Jackson');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '43','Nashville');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '44','Houston');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '44','San Antonio');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '44','Dallas');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '45','Ogden');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '45','Salt Lake City');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '45','Provo');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '46','Norfolk');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '46','Roanoke');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '46','Richmond');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '47','Rutland');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '47','Montpelier');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '47','Winooski');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '48','Keene');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '48','Seattle');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '48','Tacoma');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '49','Milwaukee');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '49','Madison');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '49','Green Bay');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '50','Charleston');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '50','Huntington');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '50','Parkersburg');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '51','Cheyenne');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '51','Casper');
INSERT INTO OrganDonorSystem.City ( `stateStateID`, `city`) VALUES ( '51','Laramie');

-- BloodType
INSERT INTO OrganDonorSystem.BloodType (`bloodTypeName`) VALUES ( 'O-');
INSERT INTO OrganDonorSystem.BloodType (`bloodTypeName`) VALUES ( 'O+');
INSERT INTO OrganDonorSystem.BloodType (`bloodTypeName`) VALUES ( 'A-');
INSERT INTO OrganDonorSystem.BloodType (`bloodTypeName`) VALUES ( 'A+');
INSERT INTO OrganDonorSystem.BloodType (`bloodTypeName`) VALUES ( 'B-');
INSERT INTO OrganDonorSystem.BloodType (`bloodTypeName`) VALUES ( 'B+');
INSERT INTO OrganDonorSystem.BloodType (`bloodTypeName`) VALUES ( 'AB-');
INSERT INTO OrganDonorSystem.BloodType (`bloodTypeName`) VALUES ( 'AB+');

-- OrganType
INSERT INTO OrganDonorSystem.OrganType ( `organName`) VALUES ('Heart');
INSERT INTO OrganDonorSystem.OrganType ( `organName`) VALUES ('Lung');
INSERT INTO OrganDonorSystem.OrganType ( `organName`) VALUES ('Kidney');
INSERT INTO OrganDonorSystem.OrganType ( `organName`) VALUES ('Liver');
INSERT INTO OrganDonorSystem.OrganType ( `organName`) VALUES ('Pancreas');

-- Medical_Personnel
INSERT INTO OrganDonorSystem.Medical_Personnel (`userName`, `userPassword`, `medicalFacility`, `contactEmail`, `phoneNumber`, `validatedUser`, `create_time`, `State_StateID`, `City_CityID`) VALUES ('veronicaY', 'jkj8899', 'Baylor Medicine of College', 'jj_waltz@bcm.com', '7135557799', '1', '2000-08-16 19:30:51', '44', '127');
INSERT INTO OrganDonorSystem.Medical_Personnel (`userName`, `userPassword`, `medicalFacility`, `contactEmail`, `phoneNumber`, `validatedUser`, `create_time`, `State_StateID`, `City_CityID`) VALUES ('miaA', 'dwa4281', 'New York Downtown Hospital', 'arteaga07@nydh.net', '9175551284', '1', '2000-01-28 11:11:48', '19', '55');
INSERT INTO OrganDonorSystem.Medical_Personnel (`userName`, `userPassword`, `medicalFacility`, `contactEmail`, `phoneNumber`, `validatedUser`, `create_time`, `State_StateID`, `City_CityID`) VALUES ('caedinT', 'cat1127', 'Massachusetts General Hospital', 'caeden@grp5best.net', '6175552385', '1', '2001-01-04 05:32:34', '35', '100');
INSERT INTO OrganDonorSystem.Medical_Personnel (`userName`, `userPassword`, `medicalFacility`, `contactEmail`, `phoneNumber`, `validatedUser`, `create_time`, `State_StateID`, `City_CityID`) VALUES ('aideaM', 'agm9689', 'St. Anthony Hospital', 'a.maple@oku.edu', '4055554875', '1', '2004-04-25 06:03:26', '37', '106');

-- Donor List
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-1337', '2006-02-10 07:17:29', '2006-02-11 07:17:29', '1', '1127428', 'F', '33');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-2567', '2005-05-10 18:15:55', '2005-05-11 18:15:55', '1', '0034591', 'F', '22');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-5369', '2010-02-13 03:18:32', '2010-02-14 03:18:32', '1', '1118394', 'M', '65');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-5482', '2013-03-12 06:15:28', '2013-03-13 06:15:28', '1', '6654683', 'M', '18');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-8529', '2014-05-15 19:12:42', '2014-05-16 19:12:42', '1', '1284982', 'F', '53');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-2268', '2014-06-06 08:14:55', '2014-06-07 08:14:55', '1', '1584695', 'F', '45');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-3685', '2003-07-09 15:13:23', '2003-07-10 15:13:23', '1', '8448625', 'F', '34');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-5968', '2002-08-15 08:15:45', '2002-08-16 08:15:45', '1', '8465743', 'M', '30');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-2657', '2015-04-21 07:19:26', '2015-04-22 07:19:26', '1', '2181985', 'F', '36');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('713-555-2546', '2015-04-21 15:18:32', '2015-04-22 15:18:32', '1', '1684318', 'F', '49');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-3625', '2008-04-14 02:12:35', '2008-04-15 02:12:35', '2', '23D-2120', 'F', '50');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-4822', '2009-11-18 12:14:24', '2009-11-19 12:14:24', '2', '22A-3429', 'M', '61');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-5984', '2010-08-16 23:17:52', '2010-08-17 23:17:52', '2', '24B-2348', 'M', '25');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-5684', '2011-09-23 14:16:53', '2011-09-24 14:16:53', '2', '12C-1387', 'F', '27');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-8624', '2011-03-15 18:13:41', '2011-03-16 18:13:41', '2', '13R-6854', 'M', '42');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-5689', '2011-05-14 21:19:23', '2011-05-15 21:19:23', '2', '61D-3624', 'M', '38');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-6573', '2010-06-12 07:16:31', '2010-06-13 07:16:31', '2', '34O-3910', 'F', '25');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-5967', '2005-02-03 07:18:18', '2005-02-03 07:18:18', '2', '02F-0173', 'M', '23');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-1653', '2015-04-21 05:17:32', '2015-04-22 05:17:32', '2', '20K-1337', 'F', '25');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('917-555-1578', '2015-04-21 19:17:28', '2015-04-22 19:17:28', '2', '13Y-1235', 'F', '39');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-1796', '2007-10-18 08:18:12', '2007-10-19 08:18:12', '3', 'ER-0710-14', 'M', '29');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-9869', '2014-04-19 02:57:34', '2014-04-20 02:57:34', '3', 'IU-0420-24', 'M', '19');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-5816', '2014-07-26 04:37:26', '2014-07-27 04:37:26', '3', 'GE-0727-34', 'F', '21');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-7369', '2014-09-25 12:17:18', '2014-09-26 12:17:18', '3', 'ER-1409-23', 'M', '20');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-8945', '2014-08-23 11:15:23', '2014-08-24 11:15:23', '3', 'GE-0824-21', 'F', '34');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-3649', '2015-03-14 04:17:38', '2015-03-15 04:17:38', '3', 'ER-1503-22', 'F', '36');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-4898', '2015-02-15 13:27:46', '2015-02-16 13:27:46', '3', 'FK-4620-23', 'M', '31');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-6578', '2009-01-25 07:13:24', '2009-01-26 07:13:24', '3', 'IU-4693-93', 'F', '31');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-3419', '2015-04-21 13:14:26', '2015-04-22 13:14:26', '3', 'ER-1504-26', 'M', '24');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('617-555-5982', '2015-04-21 09:15:28', '2015-04-22 09:15:28', '3', 'ER-1604-10', 'F', '26');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-6649', '2010-04-17 02:35:39', '2010-04-18 02:35:39', '4', '2A61B', 'M', '22');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-7895', '2008-04-14 19:12:26', '2008-04-15 19:12:26', '4', '3C34A', 'M', '37');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-7836', '2009-06-12 02:17:47', '2009-06-13 02:17:47', '4', '3D21K', 'M', '41');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-4056', '2007-07-11 13:25:53', '2007-07-12 13:25:53', '4', '3C21D', 'F', '25');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-9346', '2006-08-10 01:12:21', '2006-08-11 01:12:21', '4', '3F13A', 'F', '34');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-1375', '2002-11-15 12:12:35', '2002-11-16 12:12:35', '4', '2A61C', 'F', '27');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-7849', '2002-02-16 22:14:21', '2002-02-17 22:14:21', '4', '6G12E', 'M', '32');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-4659', '2003-01-18 03:15:22', '2003-01-19 03:15:22', '4', '8T23L', 'F', '35');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-9875', '2015-04-21 12:11:24', '2015-04-22 12:11:24', '4', '1Z31K', 'M', '36');
INSERT INTO OrganDonorSystem.Donor (`phoneNumber`, `registrationDate`, `endDate`, `medicalPersonnelId`, `originalID`, `gender`, `age`) VALUES ('405-555-3491', '2015-04-21 08:23:43', '2015-12-22 08:23:43', '4', '3Y21Z', 'M', '55');

-- Organ List
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '1', '2015-04-22 21:17:29', '2015-04-23 21:17:29', '1', '1127428', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '1', '2015-04-22 19:17:29', '2015-04-23 19:17:29', '1', '0034591', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('3', '1', '2015-04-22 20:17:29', '2015-04-23 20:17:29', '1', '1118394', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('4', '1', '2015-04-22 21:59:29', '2015-04-23 21:59:29', '1', '6654683', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('5', '1', '2015-04-22 23:39:29', '2015-04-23 23:39:29', '1', '1284982', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '1', '2015-04-22 20:04:43', '2015-04-23 20:04:43', '1', '8448625', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '1', '2015-04-22 19:52:29', '2015-04-23 19:52:29', '1', '8465743', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '1', '2015-04-22 20:11:11', '2015-04-23 20:11:11', '1', '2181985', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '1', '2015-04-22 19:32:29', '2015-04-23 19:32:29', '1', '1684318', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '2', '2015-04-22 20:17:29', '2015-04-23 20:17:29', '2', '23D-2120', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '2', '2015-04-22 20:53:22', '2015-04-23 20:53:22', '2', '22A-3429', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('3', '2', '2015-04-22 19:42:29', '2015-04-23 19:42:29', '2', '24B-2348', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('4', '2', '2015-04-22 21:52:29', '2015-04-23 21:52:29', '2', '12C-1387', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('5', '2', '2015-04-22 23:17:06', '2015-04-23 23:17:06', '2', '13R-6854', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '2', '2015-04-22 22:32:29', '2015-04-23 22:32:29', '2', '34O-3910', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '2', '2015-04-22 19:20:42', '2015-04-23 19:20:42', '2', '02F-0173', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('3', '1', '2015-04-22 19:25:42', '2015-04-23 19:25:42', '2', '20K-1337', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('4', '1', '2015-04-22 19:30:12', '2015-04-23 19:30:12', '2', '13Y-1235', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '1', '2015-04-22 19:55:32', '2015-04-23 19:55:32', '3', 'ER-0710-14', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '1', '2015-04-22 20:05:32', '2015-04-23 20:05:32', '3', 'IU-0420-24', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('3', '1', '2015-04-22 20:35:32', '2015-04-23 20:35:32', '3', 'GE-0727-34', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('4', '1', '2015-04-22 20:51:22', '2015-04-23 20:51:22', '3', 'ER-1409-23', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('5', '1', '2015-04-22 21:17:29', '2015-04-23 21:17:29', '3', 'GE-0824-21', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '1', '2015-04-22 21:27:15', '2015-04-23 21:27:15', '3', 'FK-4620-23', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '1', '2015-04-22 21:47:09', '2015-04-23 21:47:09', '3', 'IU-4693-93', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('5', '1', '2015-04-22 21:52:42', '2015-04-23 21:52:42', '3', 'ER-1504-26', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '2', '2015-04-22 22:07:21', '2015-04-23 22:07:21', '4', '2A61B', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '2', '2015-04-22 22:45:32', '2015-04-23 22:45:32', '4', '3C34A', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('3', '2', '2015-04-22 22:57:19', '2015-04-23 22:57:19', '4', '3D21K', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('4', '2', '2015-04-23 01:17:29', '2015-04-24 01:17:29', '4', '3C21D', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('5', '2', '2015-04-23 02:45:09', '2015-04-24 02:45:09', '4', '3F13A', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '2', '2015-04-23 04:57:34', '2015-04-24 04:57:34', '4', '6G12E', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '2', '2015-04-23 06:43:29', '2015-04-24 06:43:29', '4', '8T23L', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('1', '1', '2015-04-23 08:17:29', '2015-04-24 08:17:29', '4', '1Z31K', '1');
INSERT INTO OrganDonorSystem.Organs (`organType_organtypeID`, `BloodType_BloodTypeID`, `dateAqcuired`, `expirationDate`, `MedicalPersonnelID`, `OriginalID`, `available`) VALUES ('2', '1', '2015-04-23 10:43:09', '2015-04-24 10:43:09', '4', '3Y21Z', '1');
-- Recipient list
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '2', '7894532', 'M', '2009-09-11 12:50:23', '41', '1', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '1', '1984567', 'F', '2004-08-16 10:37:26', '25', '2', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '3', '1387617', 'M', '2002-05-05 09:48:19', '62', '3', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '4', '3268413', 'M', '2001-06-25 16:23:25', '45', '4', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '1', '9871355', 'M', '2003-07-18 05:21:34', '24', '5', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '3', '6518676', 'F', '2002-05-12 09:19:36', '67', '1', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '1', '9841745', 'M', '2001-03-20 22:18:16', '42', '2', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '2', '6546878', 'F', '2005-02-22 07:43:15', '20', '3', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('1', '4', '9849625', 'F', '2004-09-13 08:22:25', '20', '4', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '1', '24G-5021', 'F', '2003-08-15 12:16:24', '43', '1', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '2', '56K-1032', 'F', '2002-07-30 13:18:23', '21', '2', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '3', '25U-3212', 'M', '2002-03-05 15:16:22', '25', '3', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '4', '30Z-9173', 'M', '2001-05-02 16:19:24', '29', '4', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '2', '12K-3210', 'F', '2004-06-16 19:23:29', '70', '5', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '2', '15E-3921', 'M', '2007-07-11 08:13:43', '39', '1', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '1', '13Y-5103', 'M', '2008-08-03 20:16:53', '37', '2', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '4', '45P-1963', 'M', '2000-09-05 02:18:42', '66', '3', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('2', '3', '20K-0893', 'F', '2002-10-09 22:19:36', '22', '4', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '3', 'ER-1111-12', 'M', '2011-11-18 16:12:12', '27', '1', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '2', 'IU-0309-13', 'F', '2003-09-17 05:13:36', '34', '2', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '4', 'GE-0512-13', 'F', '2005-12-13 09:45:25', '41', '3', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '2', 'FK-0403-15', 'M', '2004-03-15 11:33:29', '22', '4', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '4', 'ER-0404-14', 'F', '2004-04-14 16:23:36', '55', '5', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '2', 'IU-1007-16', 'M', '2010-07-16 18:19:42', '32', '1', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '1', 'IU-0206-13', 'F', '2002-06-13 20:13:16', '34', '2', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '2', 'KR-0104-18', 'F', '2001-04-18 04:14:53', '48', '3', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('3', '3', '2U21L', 'M', '2003-01-19 06:14:28', '54', '4', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '2', '3R78B', 'F', '2011-01-23 02:09:24', '37', '1', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '2', '4K91O', 'F', '2009-08-25 06:17:25', '35', '2', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '3', '2F32V', 'M', '2003-09-16 09:11:39', '26', '3', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '4', '7I23D', 'F', '2007-03-19 23:18:49', '33', '4', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '2', '3T12P', 'F', '2004-02-17 20:26:57', '31', '5', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '1', '4F31D', 'M', '2002-01-11 19:34:49', '28', '6', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '3', '5Y21S', 'F', '2001-05-09 18:46:47', '73', '1', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '2', '8V25Z', 'F', '2000-04-11 11:52:42', '69', '2', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '3', '4K21D', 'M', '2003-09-10 09:31:41', '66', '3', '2', 'T');
INSERT INTO OrganDonorSystem.Recipients (`medicalPersonnelID`, `severity`, `orignialID`, `gender`, `dateRegistered`, `age`, `organTypeOrganTypeID`, `bloodTypeBloodTypeID`, `needsOrgan`)VALUES ('4', '4', '3T12W', 'F', '2002-07-03 08:22:43', '64', '4', '2', 'T');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
