USE BusCompany;
GO

EXEC spInsertTowns @name = 'Montgomery';
EXEC spInsertTowns @name = 'Blueshell';

EXEC spInsertGarages @name = 'Tom`s Garage', @capacity = 15, @ID_town = 6;
EXEC spInsertGarages @name = 'Red`s Garage', @capacity = 35, @ID_town = 7;

EXEC spInsertBusTypes @description = 'Cruise';
EXEC spInsertBusTypes @description = 'Guide';

EXEC spInsertRoutes @name = 'Route 60', @description = 'From Dayland to Montgomery';
EXEC spInsertRoutes @name = 'Route 70', @description = 'From Montgomery to Blueshell';

EXEC spInsertJourneys @name = 'Dayland-Montgomery';
EXEC spInsertJourneys @name = 'Montgomery-Blueshell';

EXEC spAssignJourneyToRoute @ID_route = 6, @ID_journey = 6;
EXEC spAssignJourneyToRoute @ID_route = 7, @ID_journey = 7;

EXEC spAssignJourneyToTown @ID_town = 6, @ID_journey = 6;
EXEC spAssignJourneyToTown @ID_town = 7, @ID_journey = 7;

EXEC spInsertDrivers @name = 'Buck G.', @Telephone = '0345678765', @Address = '45th St.', @ID_journey = 6;
EXEC spInsertDrivers @name = 'Lucy H.', @Telephone = '2143767898', @Address = '5th St.', @ID_journey = 7;


EXEC spInsertRouteLog @date = '09-21-2021', @pass_average = 35, @ID_route = 6
EXEC spInsertRouteLog @date = '09-21-2021', @pass_average = 15, @ID_route = 7

EXEC spInsertBuses @licence_plate = 'KF4-HG12', @capacity = 12, @size = 'Small', @ID_type_bus = 5, @ID_route = 6
EXEC spInsertBuses @licence_plate = 'VU7-XD49', @capacity = 12, @size = 'Small', @ID_type_bus = 5, @ID_route = 7

--UPDATE
EXEC spUpdateTowns @name = 'Waverly FT', @ID_town = 1

EXEC spUpdateGarages @name = 'Parker`s Garage', @capacity = 25, @ID_town = 5, @ID_garage = 5;

EXEC spUpdateBusTypes @description = 'Cruise VIP', @ID_bus_type = 6;

EXEC spUpdateRoutes @name = 'Route 61', @description = 'From Dayland to Montgomery', @ID_route = 6;

EXEC spUpdateJourneys @name = 'Dayland-Montgomery, v2', @ID_journey = 6;

EXEC spUpdateDrivers @name = 'Johnny G.', @Telephone = '0345678765', @Address = '45th St.', @ID_journey = 6, @ID_driver = 6;

EXEC spUpdateRouteLog @date = '09-22-2021', @pass_average = 35, @ID_route = 6, @ID_route_log = 6;

EXEC spUpdateBuses @licence_plate = 'KF4-HG12', @capacity = 14, @size = 'Small', @ID_type_bus = 5, @ID_route = 6;

-- DELETE
EXEC spDeleteBuses @licence_plate = 'VU7-XD49';

EXEC spDeleteRouteLog @ID_route_log = 7;

EXEC spDeleteDrivers @ID_driver = 7;

EXEC spDeleteJourneyFromTown @ID_journey = 7, @ID_town = 7;

EXEC spDeleteJourneyFromRoute @ID_route = 7, @ID_journey = 7;

EXEC spDeleteJourneys @ID_journey = 7;

EXEC spDeleteRoutes @ID_route = 7;

EXEC spDeleteBusTypes @ID_bus_type = 7;

EXEC spDeleteGarages @ID_garage = 7;

EXEC spDeleteTowns @ID_town = 7;

--READ
EXEC spSelectTowns;
EXEC spSelectGarages;
EXEC spSelectBusTypes;
EXEC spSelectRoutes;
EXEC spSelectJourneys;
EXEC spSelectDrivers;
EXEC spSelectRouteLog;
EXEC spSelectBuses;





