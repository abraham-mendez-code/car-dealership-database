/*
	Project Car Dealership Database:
    
	Create a single database script that will create a car dealership database
	and all of the tables required for your car dealership. The script should also pre-
	populate the database with initial data.
    
	NOTE: Your database setup script should be completely self-contained, and we
	should be able to re-run it multiple times to create or re-create the database.
*/

# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          CarDealership                                   #
# ---------------------------------------------------------------------- #
DROP DATABASE if exists Car_Dealership;

CREATE DATABASE IF NOT EXISTS Car_Dealership;

USE Car_Dealership;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #
CREATE TABLE `Dealerships` (
    `Dealership_ID` INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(30) NOT NULL,
    `Address` VARCHAR(60) NOT NULL,
    `Phone` VARCHAR(24) NOT NULL,
    CONSTRAINT `PK_Dealerships` PRIMARY KEY (`Dealership_ID`)
);

CREATE INDEX `Name` ON `Dealerships` (`Name`);

# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `Vehicles` (
    `VIN` INTEGER NOT NULL,
    `Year` INTEGER NOT NULL,
    `Make` VARCHAR(50) NOT NULL,
    `Model` VARCHAR(50) NOT NULL,
    `Vehicle_Type` VARCHAR(20) NOT NULL,
    `Color` VARCHAR(20) NOT NULL,
    `Price` DECIMAL(10,2) NOT NULL,
    `Sold` BIT NOT NULL DEFAULT 0,
    CONSTRAINT `PK_Vehicles` PRIMARY KEY (`VIN`)
);

CREATE INDEX `Vehicles_Search` ON `Vehicles` (`Year`, `Make`, `Model`);
CREATE INDEX `Vehicle_Type` on `Vehicles` (`Vehicle_Type`);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `Inventory` (
    `DealershipID` INT NOT NULL,
    `VIN` INT NOT NULL,
    CONSTRAINT `PK_Inventory` PRIMARY KEY (`DealershipID`, `VIN`)
);

# ---------------------------------------------------------------------- #
# Add table "Customers"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `Customers` (
    `Customer_ID` INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(30),
    `Title` VARCHAR(30),
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `Postal_Code` VARCHAR(10),
    `Country` VARCHAR(15),
    `Phone` VARCHAR(24),
    `Email` VARCHAR(24),
    CONSTRAINT `PK_Customers` PRIMARY KEY (`Customer_ID`)
);

CREATE INDEX `City` ON `Customers` (`City`);

CREATE INDEX `Postal_Code` ON `Customers` (`Postal_Code`);

# ---------------------------------------------------------------------- #
# Add table "Sales_Contracts"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `Sales_Contracts` (
    `Contract_ID` INT NOT NULL AUTO_INCREMENT,
    `Dealership_ID` INT NOT NULL,
    `VIN` INT NOT NULL,
    `Customer_ID` INT NOT NULL,
    `Date` DATETIME,
    `Tax` DECIMAL(10,2) NOT NULL,
    `Recording_Fee` DECIMAL(10,2) NOT NULL,
    `Processing_Fee` DECIMAL(10,2) NOT NULL,
    `Financed` BOOLEAN NOT NULL,
    `Principal` DECIMAL(10,2) NOT NULL,
    `Monthly_Payment` DECIMAL(10,2) NOT NULL,
    `Final_Total` DECIMAL(10,2) NOT NULL,
    CONSTRAINT `PK_Sales_Contract` PRIMARY KEY (`Contract_ID`),
    CONSTRAINT `FK_Sales_Dealership` FOREIGN KEY (`Dealership_ID`)
		REFERENCES `Dealerships`(`Dealership_ID`),
	CONSTRAINT `FK_Sales_Customer` FOREIGN KEY (`Customer_ID`)
		REFERENCES `Customers`(`Customer_ID`),
    CONSTRAINT `FK_Sales_Vehicles` FOREIGN KEY (`VIN`)
		REFERENCES `Vehicles`(`VIN`)
);

CREATE INDEX `Date` ON `Sales_Contracts` (`Date`);

CREATE INDEX `Sales_Dealership` ON `Sales_Contracts` (`Dealership_ID`);

CREATE INDEX `VIN` ON `Sales_Contracts` (`VIN`);

CREATE INDEX `Final_Total` ON `Sales_Contracts` (`Final_Total`);

# ---------------------------------------------------------------------- #
# Add table "Lease_Contracts"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `Lease_Contracts` (
    `Contract_ID` INT NOT NULL AUTO_INCREMENT,
    `Dealership_ID` INT NOT NULL,
    `VIN` INT NOT NULL,
    `Customer_ID` INT NOT NULL,
    `Date` DATETIME,
    `Lease_Fee` DECIMAL(10,2) NOT NULL,
    `Principal` DECIMAL(10,2) NOT NULL,
    `Monthly_Payment` DECIMAL(10,2) NOT NULL,
    `Ending_Value` DECIMAL(10,2) NOT NULL,
    `Final_Total` DECIMAL(10,2) NOT NULL,
    CONSTRAINT `PK_Lease_Contracts` PRIMARY KEY (`Contract_ID`),
    CONSTRAINT `FK_Lease_Dealership` FOREIGN KEY (`Dealership_ID`)
		REFERENCES `Dealerships`(`Dealership_ID`),
	CONSTRAINT `FK_Lease_Customer` FOREIGN KEY (`Customer_ID`)
		REFERENCES `Customers`(`Customer_ID`),
    CONSTRAINT `FK_Lease_Vehicles` FOREIGN KEY (`VIN`)
		REFERENCES `Vehicles`(`VIN`)
);

CREATE INDEX `Date` ON `Lease_Contracts` (`Date`);

CREATE INDEX `Lease_Dealership` ON `Lease_Contracts` (`Dealership_ID`);

CREATE INDEX `VIN` ON `Lease_Contracts` (`VIN`);

CREATE INDEX `Final_Total` ON `Lease_Contracts` (`Final_Total`);