USE BusCompany;
GO

CREATE PROCEDURE spInsertTowns @name varchar(230)
AS
INSERT INTO [dbo].Town VALUES(@name)
GO

CREATE PROCEDURE spInsertGarages @name varchar(30), @capacity int, @ID_town int
AS
INSERT INTO [dbo].Garage VALUES(@name, @capacity, @ID_town)
GO

CREATE PROCEDURE spInsertBusTypes @description varchar(30)
AS
INSERT INTO [dbo].Type_bus VALUES(@description)
GO

CREATE PROCEDURE spInsertRoutes @name varchar(30), @description varchar(200)
AS
INSERT INTO [dbo].[Route] VALUES(@name, @description)
GO

CREATE PROCEDURE spInsertJourneys @name varchar(230)
AS
INSERT INTO [dbo].Journey VALUES(@name)
GO

CREATE PROCEDURE spAssignJourneyToRoute @ID_route int, @ID_journey int
AS
INSERT INTO [dbo].Route_journey VALUES(@ID_route, @ID_journey)
GO

CREATE PROCEDURE spAssignJourneyToTown @ID_town int, @ID_journey int
AS
INSERT INTO [dbo].Journey_town VALUES(@ID_town, @ID_journey)
GO

CREATE PROCEDURE spInsertDrivers @name varchar(180), @Telephone varchar(20), @Address varchar(200), @ID_journey int
AS
INSERT INTO [dbo].Driver VALUES(@name, @Telephone, @Address, @ID_journey)
GO

CREATE PROCEDURE spInsertRouteLog @date date, @pass_average int, @ID_route int
AS
INSERT INTO [dbo].Route_log VALUES(@date, @pass_average, @ID_route)
GO

CREATE PROCEDURE spInsertBuses @licence_plate varchar(10), @size varchar(20), @capacity int, @ID_type_bus int, @ID_route int
AS
INSERT INTO [dbo].Bus VALUES(@licence_plate, @size, @capacity, @ID_type_bus, @ID_route)
GO

--UPDATE

CREATE PROCEDURE spUpdateTowns @name varchar(230), @ID_town int
AS
UPDATE Town
SET name = @name
WHERE ID = @ID_town
GO

CREATE PROCEDURE spUpdateGarages @name varchar(30), @capacity int, @ID_town int, @ID_garage int
AS
UPDATE Garage
SET name = @name, capacity = @capacity, ID_town = @ID_town
WHERE ID = @ID_garage
GO

CREATE PROCEDURE spUpdateBusTypes @description varchar(30), @ID_bus_type int
AS
UPDATE Type_bus
SET [Description] = @description
WHERE ID = @ID_bus_type
GO

CREATE PROCEDURE spUpdateRoutes @name varchar(30), @description varchar(200), @ID_route int
AS
UPDATE [Route]
SET [Name] = @name, [Description] = @description
WHERE ID = @ID_route
GO

CREATE PROCEDURE spUpdateJourneys @name varchar(230), @ID_journey int
AS
UPDATE Journey
SET [name] = @name
WHERE ID = @ID_journey
GO

CREATE PROCEDURE spUpdateDrivers @name varchar(180), @Telephone varchar(20), @Address varchar(200), @ID_journey int, @ID_driver int
AS
UPDATE Driver
SET [Name] = @name, [Telephone] = @Telephone, [Address] = @Address, [ID_journey] = @ID_journey
WHERE ID = @ID_driver
GO

CREATE PROCEDURE spUpdateRouteLog @date date, @pass_average int, @ID_route int, @ID_route_log int
AS
UPDATE Route_log
SET [Date] = @date, [pass_average] = @pass_average, ID_route = @ID_route
WHERE ID = @ID_route_log
GO

CREATE PROCEDURE spUpdateBuses @licence_plate varchar(10), @size varchar(20), @capacity int, @ID_type_bus int, @ID_route int
AS
UPDATE Bus
SET licence_plate = @licence_plate, size = @size, capacity = @capacity, ID_type_bus = @ID_type_bus, ID_route = @ID_route
WHERE licence_plate = @licence_plate
GO

-- DELETE

CREATE PROCEDURE spDeleteTowns @ID_town int
AS
DELETE Town
WHERE ID = @ID_town
GO

CREATE PROCEDURE spDeleteGarages @ID_garage int
AS
DELETE Garage
WHERE ID = @ID_garage
GO

CREATE PROCEDURE spDeleteBusTypes @ID_bus_type int
AS
DELETE Type_bus
WHERE ID = @ID_bus_type
GO

CREATE PROCEDURE spDeleteRoutes  @ID_route int
AS
DELETE [Route]
WHERE ID = @ID_route
GO

CREATE PROCEDURE spDeleteJourneys @ID_journey int
AS
DELETE Journey
WHERE ID = @ID_journey
GO

CREATE PROCEDURE spDeleteDrivers @ID_driver int
AS
DELETE Driver
WHERE ID = @ID_driver
GO

CREATE PROCEDURE spDeleteJourneyFromTown @ID_journey int, @ID_town int
AS
DELETE Journey_town
WHERE ID_journey = @ID_journey AND ID_town = @ID_town
GO

CREATE PROCEDURE spDeleteJourneyFromRoute @ID_journey int, @ID_route int
AS
DELETE Route_journey
WHERE ID_journey = @ID_journey AND ID_route = @ID_route
GO

CREATE PROCEDURE spDeleteRouteLog @ID_route_log int
AS
DELETE Route_log
WHERE ID = @ID_route_log
GO

CREATE PROCEDURE spDeleteBuses @licence_plate varchar(10)
AS
DELETE Bus
WHERE licence_plate = @licence_plate
GO

--READ

CREATE PROCEDURE spSelectTowns  
AS
SELECT ID, [name] FROM Town
GO

CREATE PROCEDURE spSelectGarages 
AS
SELECT ID, [name], capacity, ID_town FROM Garage
GO

CREATE PROCEDURE spSelectBusTypes 
AS
SELECT ID, [Description] FROM Type_bus
GO

CREATE PROCEDURE spSelectRoutes
AS
SELECT ID, [Name], [Description] FROM [Route]
GO

CREATE PROCEDURE spSelectJourneys
AS
SELECT ID, [Name] FROM Journey
GO

CREATE PROCEDURE spSelectDrivers
AS
SELECT ID, [Name], Telephone, [Address], ID_journey  FROM Driver
GO

CREATE PROCEDURE spSelectRouteLog
AS
SELECT ID,[Date],pass_average, ID_route  FROM Route_log
GO

CREATE PROCEDURE spSelectBuses
AS
SELECT licence_plate,size, capacity, ID_type_bus, ID_route  FROM Bus
GO