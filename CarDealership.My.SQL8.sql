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
    `Sold` BOOLEAN NOT NULL,
    CONSTRAINT `PK_Vehicles` PRIMARY KEY (`VIN`)
);

CREATE INDEX `Vehicles_Search` ON `Vehicles` (`Year`, `Make`, `Model`);
CREATE INDEX `Vehicle_Type` on `Vehicles` (`Vehicle_Type`);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `Inventory` (
    `Dealership_ID` INT NOT NULL,
    `VIN` INT NOT NULL,
    CONSTRAINT `PK_Inventory` PRIMARY KEY (`Dealership_ID`, `VIN`)
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
    `Email` VARCHAR(320),
    CONSTRAINT `PK_Customers` PRIMARY KEY (`Customer_ID`)
);

CREATE INDEX `City` ON `Customers` (`City`);

CREATE INDEX `Postal_Code` ON `Customers` (`Postal_Code`);

# ---------------------------------------------------------------------- #
# Add table "Sales_Contracts"                                            #
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
    CONSTRAINT `PK_Sales_Contract` PRIMARY KEY (`Contract_ID`)
);

CREATE INDEX `Date` ON `Sales_Contracts` (`Date`);

CREATE INDEX `Sales_Dealership` ON `Sales_Contracts` (`Dealership_ID`);

CREATE INDEX `VIN` ON `Sales_Contracts` (`VIN`);

CREATE INDEX `Final_Total` ON `Sales_Contracts` (`Final_Total`);

# ---------------------------------------------------------------------- #
# Add table "Lease_Contracts"                                            #
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
    CONSTRAINT `PK_Lease_Contracts` PRIMARY KEY (`Contract_ID`)
);

CREATE INDEX `Date` ON `Lease_Contracts` (`Date`);

CREATE INDEX `Lease_Dealership` ON `Lease_Contracts` (`Dealership_ID`);

CREATE INDEX `VIN` ON `Lease_Contracts` (`VIN`);

CREATE INDEX `Final_Total` ON `Lease_Contracts` (`Final_Total`);

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Dealerships;
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('Sunrise Auto', '123 Main St, Springfield, IL 62704', '(217) 555-0123');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('Metro Motors', '456 Elm St, Chicago, IL 60610', '(312) 555-0456');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('Highway Cars', '789 Oak Ave, Naperville, IL 60540', '(630) 555-0789');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('Prime Auto Group', '321 Pine Rd, Aurora, IL 60506', '(331) 555-0345');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('Elite Cars', '654 Maple Blvd, Peoria, IL 61614', '(309) 555-0678');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('Cityline Motors', '987 Birch Ln, Rockford, IL 61107', '(815) 555-0912');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('Roadstar Auto', '135 Cedar St, Joliet, IL 60435', '(815) 555-0246');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('NextGen Autos', '246 Walnut St, Springfield, IL 62711', '(217) 555-0567');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('Capital Cars', '357 Ash Ave, Champaign, IL 61820', '(217) 555-0781');
INSERT INTO Dealerships (Name, Address, Phone)
VALUES ('DriveTime Motors', '468 Poplar Rd, Bloomington, IL 61701', '(309) 555-0890');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Vehicles;
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000001, 2022, 'Toyota', 'Camry', 'Sedan', 'Silver', 25499.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000002, 2021, 'Honda', 'Civic', 'Sedan', 'Blue', 21999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000003, 2023, 'Ford', 'F-150', 'Truck', 'Red', 35999.50, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000004, 2020, 'Chevrolet', 'Tahoe', 'SUV', 'Black', 47999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000005, 2024, 'Tesla', 'Model 3', 'Sedan', 'White', 39999.99, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000006, 2022, 'BMW', 'X5', 'SUV', 'Gray', 61999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000007, 2021, 'Audi', 'A4', 'Sedan', 'Black', 43999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000008, 2019, 'Nissan', 'Altima', 'Sedan', 'Silver', 18999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000009, 2023, 'Jeep', 'Wrangler', 'SUV', 'Green', 52999.00, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000010, 2020, 'Hyundai', 'Santa Fe', 'SUV', 'Blue', 29999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000011, 2021, 'Kia', 'Sorento', 'SUV', 'White', 32999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000012, 2020, 'Subaru', 'Outback', 'SUV', 'Gray', 28999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000013, 2023, 'Mazda', 'CX-5', 'SUV', 'Blue', 34999.00, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000014, 2022, 'Honda', 'Accord', 'Sedan', 'Black', 25999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000015, 2021, 'Toyota', 'RAV4', 'SUV', 'Silver', 31999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000016, 2024, 'Ford', 'Mustang', 'Coupe', 'Red', 42999.99, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000017, 2019, 'Chevrolet', 'Malibu', 'Sedan', 'Blue', 21999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000018, 2020, 'Nissan', 'Rogue', 'SUV', 'White', 28999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000019, 2022, 'BMW', '3 Series', 'Sedan', 'Gray', 45999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000020, 2023, 'Audi', 'Q5', 'SUV', 'Black', 56999.99, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000021, 2021, 'Tesla', 'Model Y', 'SUV', 'White', 49999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000022, 2020, 'Ford', 'Explorer', 'SUV', 'Blue', 38999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000023, 2022, 'Chevrolet', 'Silverado', 'Truck', 'Red', 47999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000024, 2019, 'Honda', 'CR-V', 'SUV', 'Gray', 27999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000025, 2023, 'Toyota', 'Highlander', 'SUV', 'Black', 42999.50, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000026, 2021, 'Mazda', 'Mazda3', 'Sedan', 'White', 23999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000027, 2022, 'Subaru', 'Forester', 'SUV', 'Green', 32999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000028, 2020, 'Nissan', 'Altima', 'Sedan', 'Silver', 22999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000029, 2023, 'BMW', 'X3', 'SUV', 'Blue', 53999.00, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000030, 2024, 'Audi', 'A6', 'Sedan', 'Black', 61999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000031, 2021, 'Mercedes-Benz', 'C-Class', 'Sedan', 'Silver', 45999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000032, 2020, 'Kia', 'Sorento', 'SUV', 'White', 31999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000033, 2022, 'Volkswagen', 'Passat', 'Sedan', 'Blue', 27999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000034, 2023, 'Chevrolet', 'Tahoe', 'SUV', 'Black', 55999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000035, 2019, 'Toyota', 'Corolla', 'Sedan', 'Gray', 19999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000036, 2024, 'Ford', 'Mustang', 'Coupe', 'Red', 55999.50, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000037, 2022, 'Honda', 'Accord', 'Sedan', 'White', 26999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000038, 2021, 'Jeep', 'Grand Cherokee', 'SUV', 'Black', 49999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000039, 2020, 'Nissan', 'Rogue', 'SUV', 'Blue', 30999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000040, 2023, 'Subaru', 'Outback', 'SUV', 'Green', 36999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000041, 2022, 'Mazda', 'CX-5', 'SUV', 'Red', 32999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000042, 2021, 'BMW', '3 Series', 'Sedan', 'White', 44999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000043, 2023, 'Audi', 'Q5', 'SUV', 'Gray', 57999.50, TRUE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000044, 2020, 'Hyundai', 'Tucson', 'SUV', 'Silver', 28999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000045, 2019, 'Kia', 'Optima', 'Sedan', 'Blue', 20999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000046, 2024, 'Ford', 'Explorer', 'SUV', 'Black', 54999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000047, 2022, 'Chevrolet', 'Malibu', 'Sedan', 'White', 23999.99, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000048, 2021, 'Toyota', 'RAV4', 'SUV', 'Green', 36999.00, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000049, 2023, 'Honda', 'Pilot', 'SUV', 'Gray', 47999.50, FALSE);
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Price, Sold)
VALUES (10000050, 2020, 'Nissan', 'Altima', 'Sedan', 'Black', 22999.99, FALSE);

# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Inventory;
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (1, 10000023);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (1, 10000007);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (1, 10000044);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (1, 10000012);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (1, 10000035);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (2, 10000001);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (2, 10000018);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (2, 10000042);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (2, 10000009);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (2, 10000027);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (3, 10000005);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (3, 10000033);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (3, 10000016);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (3, 10000048);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (3, 10000021);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (4, 10000002);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (4, 10000011);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (4, 10000039);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (4, 10000030);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (4, 10000050);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (5, 10000006);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (5, 10000017);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (5, 10000040);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (5, 10000028);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (5, 10000022);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (6, 10000003);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (6, 10000010);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (6, 10000025);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (6, 10000038);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (6, 10000014);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (7, 10000004);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (7, 10000015);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (7, 10000029);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (7, 10000036);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (7, 10000045);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (8, 10000008);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (8, 10000019);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (8, 10000031);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (8, 10000041);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (8, 10000049);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (9, 10000013);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (9, 10000024);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (9, 10000034);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (9, 10000037);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (9, 10000046);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (10, 10000020);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (10, 10000026);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (10, 10000032);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (10, 10000043);
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (10, 10000047);

# ---------------------------------------------------------------------- #
# Add info into "Customers"                                              #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Customers;
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Victoria Ashworth', 'Ms.', 'Fauntleroy Circus', 'London', 'EC2 5NT', 'UK', '(171) 555-1212', 'victoria.ashworth@gmail.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Patricio Simpson', 'Mr.', 'Cerrito 333', 'Buenos Aires', '1010', 'Argentina', '(1) 135-5555', 'patricio.simpson@hotmail.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Francisco Chang', 'Mr.', 'Sierras de Granada 9993', 'Mxico D.F.', '05022', 'Mexico', '(5) 555-3392', 'francisco.chang@yahoo.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Yang Wang', 'Mr.', 'Hauptstr. 29', 'Bern', '3012', 'Switzerland', '0452-076545', 'yang.wang@outlook.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Pedro Afonso', 'Mr.', 'Av. dos Lusadas, 23', 'Sao Paulo', '05432-043', 'Brazil', '(11) 555-7647', 'pedro.afonso@gmail.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Elizabeth Brown', 'Ms.', 'Berkeley Gardens 12  Brewery', 'London', 'WX1 6LT', 'UK', '(171) 555-2282', 'elizabeth.brown@hotmail.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Sven Ottlieb', 'Mr.', 'Walserweg 21', 'Aachen', '52066', 'Germany', '0241-039123', 'sven.ottlieb@gmail.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Janine Labrune', 'Ms.', '67, rue des Cinquante Otages', 'Nantes', '44000', 'France', '40.67.88.88', 'janine.labrune@yahoo.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Liam Harrison', 'Mr.', '12 Baker St', 'Manchester', 'M1 2AB', 'UK', '(161) 555-3344', 'liam.harrison@gmail.com');
INSERT INTO Customers (Name, Title, Address, City, Postal_Code, Country, Phone, Email)
VALUES ('Sofia Rossi', 'Ms.', 'Via Roma 45', 'Rome', '00184', 'Italy', '(06) 555-6677', 'sofia.rossi@hotmail.com');

# ---------------------------------------------------------------------- #
# Add info into "Sales_Contracts"                                        #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Sales_Contracts;
INSERT INTO Sales_Contracts (Dealership_ID, VIN, Customer_ID, Date, Tax, Recording_Fee, Processing_Fee, Financed, Principal, Monthly_Payment, Final_Total)
VALUES (1, 10000003, 1, '2025-11-15', 1800.00, 100.00, 295.00, TRUE, 35999.50, 840.00, 38394.50);
INSERT INTO Sales_Contracts (Dealership_ID, VIN, Customer_ID, Date, Tax, Recording_Fee, Processing_Fee, Financed, Principal, Monthly_Payment, Final_Total)
VALUES (2, 10000005, 2, '2025-11-16', 2000.00, 100.00, 295.00, FALSE, 39999.99, 0.00, 42294.99);
INSERT INTO Sales_Contracts (Dealership_ID, VIN, Customer_ID, Date, Tax, Recording_Fee, Processing_Fee, Financed, Principal, Monthly_Payment, Final_Total)
VALUES (3, 10000009, 3, '2025-11-16', 2650.00, 100.00, 295.00, TRUE, 52999.00, 1235.00, 55844.00);
INSERT INTO Sales_Contracts (Dealership_ID, VIN, Customer_ID, Date, Tax, Recording_Fee, Processing_Fee, Financed, Principal, Monthly_Payment, Final_Total)
VALUES (4, 10000013, 4, '2025-11-17', 1750.00, 100.00, 295.00, FALSE, 34999.00, 0.00, 37044.00);
INSERT INTO Sales_Contracts (Dealership_ID, VIN, Customer_ID, Date, Tax, Recording_Fee, Processing_Fee, Financed, Principal, Monthly_Payment, Final_Total)
VALUES (5, 10000016, 5, '2025-11-17', 2150.00, 100.00, 295.00, TRUE, 42999.99, 1000.00, 45544.99);

# ---------------------------------------------------------------------- #
# Add info into "Lease_Contracts"                                        #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE Lease_Contracts;
INSERT INTO Lease_Contracts (Dealership_ID, VIN, Customer_ID, Date, Lease_Fee, Principal, Monthly_Payment, Ending_Value, Final_Total)
VALUES (6, 10000020, 6, '2025-11-18', 500.00, 56999.99, 1200.00, 15000.00, 63500.00);
INSERT INTO Lease_Contracts (Dealership_ID, VIN, Customer_ID, Date, Lease_Fee, Principal, Monthly_Payment, Ending_Value, Final_Total)
VALUES (7, 10000025, 7, '2025-11-18', 400.00, 42999.50, 950.00, 13000.00, 47299.50);
INSERT INTO Lease_Contracts (Dealership_ID, VIN, Customer_ID, Date, Lease_Fee, Principal, Monthly_Payment, Ending_Value, Final_Total)
VALUES (8, 10000029, 8, '2025-11-19', 450.00, 53999.00, 1100.00, 16000.00, 59499.00);
INSERT INTO Lease_Contracts (Dealership_ID, VIN, Customer_ID, Date, Lease_Fee, Principal, Monthly_Payment, Ending_Value, Final_Total)
VALUES (9, 10000036, 9, '2025-11-19', 600.00, 55999.50, 1150.00, 17000.00, 63649.50);
INSERT INTO Lease_Contracts (Dealership_ID, VIN, Customer_ID, Date, Lease_Fee, Principal, Monthly_Payment, Ending_Value, Final_Total)
VALUES (10, 10000043, 10, '2025-11-20', 550.00, 57999.50, 1250.00, 17500.00, 67299.50);

# ---------------------------------------------------------------------- #
# Foreign key constraints                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE Inventory
ADD CONSTRAINT FK_Inventory_Dealership
FOREIGN KEY (Dealership_ID) REFERENCES Dealerships(Dealership_ID);

ALTER TABLE Inventory
ADD CONSTRAINT FK_Inventory_Vehicle
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN);

ALTER TABLE Sales_Contracts
ADD CONSTRAINT FK_Sales_Dealership
FOREIGN KEY (Dealership_ID) REFERENCES Dealerships(Dealership_ID);

ALTER TABLE Sales_Contracts
ADD CONSTRAINT FK_Sales_Customer
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);

ALTER TABLE Sales_Contracts
ADD CONSTRAINT FK_Sales_Vehicles
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN);

ALTER TABLE Lease_Contracts
ADD CONSTRAINT FK_Lease_Dealership
FOREIGN KEY (Dealership_ID) REFERENCES Dealerships(Dealership_ID);

ALTER TABLE Lease_Contracts
ADD CONSTRAINT FK_Lease_Customer
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);

ALTER TABLE Lease_Contracts
ADD CONSTRAINT FK_Lease_Vehicles
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN);
