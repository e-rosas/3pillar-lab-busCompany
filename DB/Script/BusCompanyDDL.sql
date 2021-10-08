USE master;
GO
DROP DATABASE IF EXISTS BusCompany;
GO
CREATE DATABASE BusCompany
GO
USE BusCompany
GO

CREATE TABLE Type_bus (
	ID INT IDENTITY(1,1),
	[Description] varchar(30) NOT NULL,
	PRIMARY KEY(ID)
)
GO

CREATE TABLE [Route] (
	ID INT IDENTITY(1,1),
	[Name] varchar(130) NOT NULL,
	[Description] varchar(200),
	PRIMARY KEY(ID)
)
GO

CREATE TABLE Route_log (
	ID INT IDENTITY(1,1),
	[Date] date NOT NULL,
	pass_average int DEFAULT 0,
	ID_route int,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_route) REFERENCES [Route](ID)
)
GO

CREATE TABLE Town (
	ID INT IDENTITY(1,1),
	[name] varchar(230) NOT NULL,
	PRIMARY KEY(ID)
)
GO

CREATE TABLE Garage (
	ID INT IDENTITY(1,1),
	[name] varchar(30) NOT NULL,
	capacity int,
	ID_town int,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_town) REFERENCES Town(ID)
)
GO

CREATE TABLE Journey (
	ID INT IDENTITY(1,1),
	[name] varchar(230) NOT NULL,
	PRIMARY KEY(ID)
)
GO

CREATE TABLE Driver (
	ID INT IDENTITY(1,1),
	[Name] varchar(180) NOT NULL,
	Telephone varchar(20) NOT NULL,
	[Address] varchar(200),
	ID_journey int,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_journey) REFERENCES Journey(ID)
)
GO

CREATE TABLE Bus (
	licence_plate varchar(10),
	size varchar(20),
	capacity int NOT NULL,
	ID_type_bus int,
	ID_route int,
	PRIMARY KEY(licence_plate),
	FOREIGN KEY(ID_type_bus) REFERENCES Type_bus(ID),
	FOREIGN KEY(ID_route) REFERENCES [Route](ID)
)
GO


CREATE TABLE Journey_town (
	ID_town int,
	ID_journey int,
	FOREIGN KEY(ID_town) REFERENCES Town(ID),
	FOREIGN KEY(ID_journey) REFERENCES Journey(ID)
)
GO

CREATE TABLE Route_journey (
	ID_route int,
	ID_journey int,
	FOREIGN KEY(ID_route) REFERENCES [Route](ID),
	FOREIGN KEY(ID_journey) REFERENCES Journey(ID)
)
GO