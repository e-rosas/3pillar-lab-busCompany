USE BusCompany;
GO

SELECT licence_plate, capacity, size
FROM Bus
ORDER BY capacity DESC
GO

SELECT Name, Address, Telephone
FROM Driver
ORDER BY Name DESC
GO

SELECT Name, Capacity
FROM Garage
ORDER BY Capacity DESC
GO

SELECT Name, Description
FROM Route
ORDER BY Name
GO

SELECT Name, ID
FROM Journey
ORDER BY ID DESC
GO

SELECT DISTINCT Capacity
FROM Garage
ORDER BY Capacity DESC
GO

SELECT DISTINCT Capacity
FROM Bus
ORDER BY Capacity DESC
GO

SELECT DISTINCT ID_town
FROM Garage
ORDER BY ID_town DESC
GO

SELECT DISTINCT pass_average, Date
FROM Route_log
GO

SELECT DISTINCT Name, Address, Telephone
FROM Driver
GO

SELECT COUNT(ID)
FROM Driver
WHERE ID > 3
GO

SELECT COUNT(ID)
FROM Route_log
WHERE pass_average > 35
GO

SELECT COUNT(ID)
FROM Route_log
WHERE pass_average BETWEEN 10 AND 30
GO

SELECT COUNT(ID)
FROM Garage
WHERE Capacity BETWEEN 10 AND 20
GO

SELECT COUNT(ID)
FROM Garage
WHERE Capacity < 15
GO

SELECT Name, Address, Telephone
FROM Driver
WHERE Telephone IS NULL
GO

SELECT Name, Address, Telephone
FROM Driver
WHERE Address IS NULL
GO

SELECT Name, Description
FROM Route
WHERE Description IS NULL
GO

SELECT Name, Description
FROM Route
WHERE Name IS NULL
GO

SELECT Name, Capacity
FROM Garage
WHERE Capacity IS NULL
GO

SELECT Name, Address, Telephone
FROM Driver
WHERE Telephone IS NOT NULL
GO

SELECT Name, Address, Telephone
FROM Driver
WHERE Address IS NOT NULL
GO

SELECT Name, Description
FROM Route
WHERE Description IS NOT NULL
GO

SELECT Name, Description
FROM Route
WHERE Name IS NOT NULL
GO

SELECT Name, Capacity
FROM Garage
WHERE Capacity IS NOT NULL
GO

SELECT Name, Address, Telephone
FROM Driver
WHERE Name LIKE '%M'
GO

SELECT Name, Address, Telephone
FROM Driver
WHERE Telephone LIKE '%52'
GO

SELECT Name, Description
FROM Route
WHERE Name LIKE '%ROUTE'
GO

SELECT COUNT(ID)
FROM Route
WHERE Description LIKE '%Oakland%'
GO

SELECT  COUNT(ID_town) AS AmountOfGarages, ID_town
FROM Garage
GROUP BY ID_town
GO

SELECT  COUNT(ID_route) AS AmountOfJourneys, ID_route
FROM Route_journey
GROUP BY ID_route
GO

--All garages and their town, including towns that don't have any garage
SELECT        Garage.ID, Garage.Name AS Garage, Garage.Capacity, Town.Name AS Town
FROM            Garage RIGHT JOIN
                         Town ON Garage.ID_town = Town.ID
GO

SELECT        Garage.ID, Garage.Name AS Garage, Garage.Capacity, Town.Name AS Town
FROM            Garage LEFT JOIN
                         Town ON Garage.ID_town = Town.ID
GO

SELECT        Bus.licence_plate, Bus.capacity, Bus.size, Bus.ID_type_bus, Type_bus.Description
FROM            Bus 
				RIGHT JOIN Type_bus ON Bus.ID_type_bus = Type_bus.ID
GO

SELECT        Bus.licence_plate, Bus.capacity, Bus.size, Bus.ID_type_bus, Type_bus.Description
FROM            Bus 
				LEFT JOIN Type_bus ON Bus.ID_type_bus = Type_bus.ID
GO

SELECT Route.Name, Route.Description, SUM(Route_log.pass_average) AS TotalAverage
FROM Route 
		 INNER JOIN Route_log ON Route.ID = Route_log.ID_route
		 GROUP BY Route.Name, Route.Description
		 ORDER BY TotalAverage DESC
GO

SELECT Route.Name, Route.Description, Route_log.Date, SUM(Route_log.pass_average)
FROM Route 
		 INNER JOIN Route_log ON Route.ID = Route_log.ID_route
		 GROUP BY Route.Name, Route.Description, Route_log.Date
		 HAVING SUM(Route_log.pass_average) > 25

GO

--Bus, Bus type and route
SELECT        Bus.licence_plate, Bus.capacity, Bus.size, Bus.ID_type_bus, Bus.ID_route, Type_bus.ID, Type_bus.Description, Route.ID AS RouteID, Route.Name, Route.Description AS RouteDescription
FROM            Bus 
				INNER JOIN Type_bus ON Bus.ID_type_bus = Type_bus.ID 
				INNER JOIN Route ON Bus.ID_route = Route.ID
GO


--Garage and town
SELECT        Garage.ID, Garage.Name, Garage.Capacity, Town.Name AS Town
FROM            Garage INNER JOIN
                         Town ON Garage.ID_town = Town.ID
GO

--Routes and their journeys with driver
SELECT        Route.Name AS Route, Route.Description, Journey.Name AS Journey, Driver.Name AS Driver, Driver.Address, Driver.Telephone
FROM            Route INNER JOIN
                         Route_journey ON Route.ID = Route_journey.ID_route INNER JOIN
                         Journey ON Route_journey.ID_journey = Journey.ID INNER JOIN
                         Driver ON Journey.ID = Driver.ID_journey
GO

--Routes and their journeys with towns
SELECT Route.Name AS Route, Route.Description, Journey.Name AS Journey, Town.Name AS Town
FROM            Route INNER JOIN
                         Route_journey ON Route.ID = Route_journey.ID_route INNER JOIN
                         Journey ON Route_journey.ID_journey = Journey.ID INNER JOIN
                         Journey_town ON Journey.ID = Journey_town.ID_journey INNER JOIN
                         Town ON Journey_town.ID_town = Town.ID
				ORDER BY Route
GO

--Journeys, towns and their garages
SELECT Journey.Name, Town.Name AS Town, Garage.Name AS Garage, Garage.Capacity
FROM            Journey INNER JOIN
                         Journey_town ON Journey.ID = Journey_town.ID_journey INNER JOIN
                         Town ON Journey_town.ID_town = Town.ID INNER JOIN
                         Garage ON Town.ID = Garage.ID_town
				ORDER BY Name
GO

--Route garage capacity
SELECT Route.Name, SUM(Garage.Capacity) AS TotalCapacity
FROM            Route INNER JOIN
                         Route_journey ON Route.ID = Route_journey.ID_route INNER JOIN
                         Journey ON Route_journey.ID_journey = Journey.ID INNER JOIN
                         Journey_town ON Journey.ID = Journey_town.ID_journey INNER JOIN
                         Town ON Journey_town.ID_town = Town.ID INNER JOIN
						 Garage ON Town.ID = Garage.ID_town
				GROUP BY Route.Name
				ORDER BY TotalCapacity DESC
GO

--Route bus capacity
SELECT Route.Name, SUM(Bus.capacity) AS TotalCapacity
FROM            Route INNER JOIN
                         Bus ON Route.ID = Bus.ID_route 
				GROUP BY Route.Name
				ORDER BY TotalCapacity
GO

--Bus, Bus type and route
CREATE VIEW ViewBusTypeAndRoute
AS
SELECT        dbo.Bus.licence_plate, dbo.Bus.capacity, dbo.Bus.size, dbo.Bus.ID_type_bus, dbo.Bus.ID_route, dbo.Type_bus.ID, dbo.Type_bus.Description, dbo.Route.ID AS RouteID, dbo.Route.Name, dbo.Route.Description AS RouteDescription
FROM            dbo.Bus 
				INNER JOIN dbo.Type_bus ON dbo.Bus.ID_type_bus = dbo.Type_bus.ID 
				INNER JOIN dbo.Route ON dbo.Bus.ID_route = dbo.Route.ID
GO


--Garage and town
CREATE VIEW ViewGarageAndTown
AS
SELECT        dbo.Garage.ID, dbo.Garage.Name, dbo.Garage.Capacity, dbo.Town.Name AS Town
FROM            dbo.Garage INNER JOIN
                         dbo.Town ON dbo.Garage.ID_town = dbo.Town.ID
GO

--Routes and their journeys with driver
CREATE VIEW ViewRouteJourneyAndDrivers
AS
SELECT        dbo.Route.Name AS Route, dbo.Route.Description, dbo.Journey.Name AS Journey, dbo.Driver.Name AS Driver, dbo.Driver.Address, dbo.Driver.Telephone
FROM            dbo.Route INNER JOIN
                         dbo.Route_journey ON dbo.Route.ID = dbo.Route_journey.ID_route INNER JOIN
                         dbo.Journey ON dbo.Route_journey.ID_journey = dbo.Journey.ID INNER JOIN
                         dbo.Driver ON dbo.Journey.ID = dbo.Driver.ID_journey
GO

--Routes and their journeys with towns
CREATE VIEW ViewRouteJourneysAndTowns
AS
SELECT dbo.Route.Name AS Route, dbo.Route.Description, dbo.Journey.Name AS Journey, dbo.Town.Name AS Town
FROM            dbo.Route INNER JOIN
                         dbo.Route_journey ON dbo.Route.ID = dbo.Route_journey.ID_route INNER JOIN
                         dbo.Journey ON dbo.Route_journey.ID_journey = dbo.Journey.ID INNER JOIN
                         dbo.Journey_town ON dbo.Journey.ID = dbo.Journey_town.ID_journey INNER JOIN
                         dbo.Town ON dbo.Journey_town.ID_town = dbo.Town.ID
GO

--Journeys, towns and their garages
CREATE VIEW ViewJourneyTownsAndGarages
AS
SELECT dbo.Journey.Name, dbo.Town.Name AS Town, dbo.Garage.Name AS Garage, dbo.Garage.Capacity
FROM            dbo.Journey INNER JOIN
                         dbo.Journey_town ON dbo.Journey.ID = dbo.Journey_town.ID_journey INNER JOIN
                         dbo.Town ON dbo.Journey_town.ID_town = dbo.Town.ID INNER JOIN
                         dbo.Garage ON dbo.Town.ID = dbo.Garage.ID_town
GO

SELECT * FROM ViewBusTypeAndRoute;
SELECT * FROM ViewGarageAndTown;
SELECT * FROM ViewJourneyTownsAndGarages;
SELECT * FROM ViewRouteJourneyAndDrivers;
SELECT * FROM ViewRouteJourneysAndTowns;