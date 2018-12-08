DROP DATABASE IF EXISTS db_northwind;

CREATE DATABASE IF NOT EXISTS db_northwind;

USE db_northwind;


CREATE TABLE `dbo.Categories` (
    `CategoryID` INTEGER NOT NULL AUTO_INCREMENT,
    `CategoryName` VARCHAR(15) NOT NULL,
    `Description` MEDIUMTEXT,
    `Picture` LONGBLOB,
    CONSTRAINT `PK_Categories` PRIMARY KEY (`CategoryID`)
);

CREATE INDEX `CategoryName` ON `dbo.Categories` (`CategoryName`);


CREATE TABLE `dbo.CustomerCustomerDemo` (
    `CustomerID` VARCHAR(5) NOT NULL,
    `CustomerTypeID` VARCHAR(10) NOT NULL,
    CONSTRAINT `PK_CustomerCustomerDemo` PRIMARY KEY (`CustomerID`, `CustomerTypeID`)
);


CREATE TABLE `dbo.CustomerDemographics` (
    `CustomerTypeID` VARCHAR(10) NOT NULL,
    `CustomerDesc` MEDIUMTEXT,
    CONSTRAINT `PK_CustomerDemographics` PRIMARY KEY (`CustomerTypeID`)
);


CREATE TABLE `dbo.Customers` (
    `CustomerID` VARCHAR(5) NOT NULL,
    `CompanyName` VARCHAR(40) NOT NULL,
    `ContactName` VARCHAR(30),
    `ContactTitle` VARCHAR(30),
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `dbo.Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `Phone` VARCHAR(24),
    `Fax` VARCHAR(24),
    CONSTRAINT `PK_Customers` PRIMARY KEY (`CustomerID`)
);

CREATE INDEX `City` ON `dbo.Customers` (`City`);

CREATE INDEX `CompanyName` ON `dbo.Customers` (`CompanyName`);

CREATE INDEX `PostalCode` ON `dbo.Customers` (`PostalCode`);

CREATE INDEX `dbo.Region` ON `dbo.Customers` (`dbo.Region`);


CREATE TABLE `dbo.Employees` (
    `EmployeeID` INTEGER NOT NULL AUTO_INCREMENT,
    `LastName` VARCHAR(20) NOT NULL,
    `FirstName` VARCHAR(10) NOT NULL,
    `Title` VARCHAR(30),
    `TitleOfCourtesy` VARCHAR(25),
    `BirthDate` DATETIME,
    `HireDate` DATETIME,
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `dbo.Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `HomePhone` VARCHAR(24),
    `Extension` VARCHAR(4),
    `Photo` LONGBLOB,
    `Notes` MEDIUMTEXT NOT NULL,
    `ReportsTo` INTEGER,
    `PhotoPath` VARCHAR(255),
     `Salary` FLOAT,
    CONSTRAINT `PK_Employees` PRIMARY KEY (`EmployeeID`)
);

CREATE INDEX `LastName` ON `dbo.Employees` (`LastName`);

CREATE INDEX `PostalCode` ON `dbo.Employees` (`PostalCode`);


CREATE TABLE `dbo.EmployeeTerritories` (
    `EmployeeID` INTEGER NOT NULL,
    `TerritoryID` VARCHAR(20) NOT NULL,
    CONSTRAINT `PK_EmployeeTerritories` PRIMARY KEY (`EmployeeID`, `TerritoryID`)
);


CREATE TABLE `dbo.Order Details` (
    `OrderID` INTEGER NOT NULL,
    `ProductID` INTEGER NOT NULL,
    `UnitPrice` DECIMAL(10,4) NOT NULL DEFAULT 0,
    `Quantity` SMALLINT(2) NOT NULL DEFAULT 1,
    `Discount` REAL(8,0) NOT NULL DEFAULT 0,
    CONSTRAINT `PK_OrderDetails` PRIMARY KEY (`OrderID`, `ProductID`)
);


CREATE TABLE `dbo.Orders` (
    `OrderID` INTEGER NOT NULL AUTO_INCREMENT,
    `CustomerID` VARCHAR(5),
    `EmployeeID` INTEGER,
    `OrderDate` DATETIME,
    `RequiredDate` DATETIME,
    `ShippedDate` DATETIME,
    `ShipVia` INTEGER,
    `Freight` DECIMAL(10,4) DEFAULT 0,
    `ShipName` VARCHAR(40),
    `ShipAddress` VARCHAR(60),
    `ShipCity` VARCHAR(15),
    `ShipRegion` VARCHAR(15),
    `ShipPostalCode` VARCHAR(10),
    `ShipCountry` VARCHAR(15),
    CONSTRAINT `PK_Orders` PRIMARY KEY (`OrderID`)
);

CREATE INDEX `OrderDate` ON `dbo.Orders` (`OrderDate`);

CREATE INDEX `ShippedDate` ON `dbo.Orders` (`ShippedDate`);

CREATE INDEX `ShipPostalCode` ON `dbo.Orders` (`ShipPostalCode`);


CREATE TABLE `dbo.Products` (
    `ProductID` INTEGER NOT NULL AUTO_INCREMENT,
    `ProductName` VARCHAR(40) NOT NULL,
    `SupplierID` INTEGER,
    `CategoryID` INTEGER,
    `QuantityPerUnit` VARCHAR(20),
    `UnitPrice` DECIMAL(10,4) DEFAULT 0,
    `UnitsInStock` SMALLINT(2) DEFAULT 0,
    `UnitsOnOrder` SMALLINT(2) DEFAULT 0,
    `ReorderLevel` SMALLINT(2) DEFAULT 0,
    `Discontinued` BIT NOT NULL DEFAULT 0,
    CONSTRAINT `PK_Products` PRIMARY KEY (`ProductID`)
);

CREATE INDEX `ProductName` ON `dbo.Products` (`ProductName`);


CREATE TABLE `dbo.Region` (
    `RegionID` INTEGER NOT NULL,
    `RegionDescription` VARCHAR(50) NOT NULL,
    CONSTRAINT `PK_Region` PRIMARY KEY (`RegionID`)
);


CREATE TABLE `dbo.Shippers` (
    `ShipperID` INTEGER NOT NULL AUTO_INCREMENT,
    `CompanyName` VARCHAR(40) NOT NULL,
    `Phone` VARCHAR(24),
    CONSTRAINT `PK_Shippers` PRIMARY KEY (`ShipperID`)
);


CREATE TABLE `dbo.Suppliers` (
    `SupplierID` INTEGER NOT NULL AUTO_INCREMENT,
    `CompanyName` VARCHAR(40) NOT NULL,
    `ContactName` VARCHAR(30),
    `ContactTitle` VARCHAR(30),
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `dbo.Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `Phone` VARCHAR(24),
    `Fax` VARCHAR(24),
    `HomePage` MEDIUMTEXT,
    CONSTRAINT `PK_Suppliers` PRIMARY KEY (`SupplierID`)
);

CREATE INDEX `CompanyName` ON `dbo.Suppliers` (`CompanyName`);

CREATE INDEX `PostalCode` ON `dbo.Suppliers` (`PostalCode`);


CREATE TABLE `dbo.Territories` (
    `TerritoryID` VARCHAR(20) NOT NULL,
    `TerritoryDescription` VARCHAR(50) NOT NULL,
    `RegionID` INTEGER NOT NULL,
    CONSTRAINT `PK_Territories` PRIMARY KEY (`TerritoryID`)
);


ALTER TABLE `dbo.CustomerCustomerDemo` ADD CONSTRAINT `FK_CustomerCustomerDemo`
    FOREIGN KEY (`CustomerTypeID`) REFERENCES `dbo.CustomerDemographics` (`CustomerTypeID`);

ALTER TABLE `dbo.CustomerCustomerDemo` ADD CONSTRAINT `FK_CustomerCustomerDemo_Customers`
    FOREIGN KEY (`CustomerID`) REFERENCES `dbo.Customers` (`CustomerID`);

ALTER TABLE `dbo.Employees` ADD CONSTRAINT `FK_Employees_Employees`
    FOREIGN KEY (`ReportsTo`) REFERENCES `dbo.Employees` (`EmployeeID`);

ALTER TABLE `dbo.EmployeeTerritories` ADD CONSTRAINT `FK_EmployeeTerritories_Employees`
    FOREIGN KEY (`EmployeeID`) REFERENCES `dbo.Employees` (`EmployeeID`);

ALTER TABLE `dbo.EmployeeTerritories` ADD CONSTRAINT `FK_EmployeeTerritories_Territories`
    FOREIGN KEY (`TerritoryID`) REFERENCES `dbo.Territories` (`TerritoryID`);

ALTER TABLE `dbo.Order Details` ADD CONSTRAINT `FK_Order_Details_Orders`
    FOREIGN KEY (`OrderID`) REFERENCES `dbo.Orders` (`OrderID`);

ALTER TABLE `dbo.Order Details` ADD CONSTRAINT `FK_Order_Details_Products`
    FOREIGN KEY (`ProductID`) REFERENCES `dbo.Products` (`ProductID`);

ALTER TABLE `dbo.Orders` ADD CONSTRAINT `FK_Orders_Customers`
    FOREIGN KEY (`CustomerID`) REFERENCES `dbo.Customers` (`CustomerID`);

ALTER TABLE `dbo.Orders` ADD CONSTRAINT `FK_Orders_Employees`
    FOREIGN KEY (`EmployeeID`) REFERENCES `dbo.Employees` (`EmployeeID`);

ALTER TABLE `dbo.Orders` ADD CONSTRAINT `FK_Orders_Shippers`
    FOREIGN KEY (`ShipVia`) REFERENCES `dbo.Shippers` (`ShipperID`);

ALTER TABLE `dbo.Products` ADD CONSTRAINT `FK_Products_Categories`
    FOREIGN KEY (`CategoryID`) REFERENCES `dbo.Categories` (`CategoryID`);

ALTER TABLE `dbo.Products` ADD CONSTRAINT `FK_Products_Suppliers`
    FOREIGN KEY (`SupplierID`) REFERENCES `dbo.Suppliers` (`SupplierID`);

ALTER TABLE `dbo.Territories` ADD CONSTRAINT `FK_Territories_Region`
    FOREIGN KEY (`RegionID`) REFERENCES `dbo.Region` (`RegionID`);
