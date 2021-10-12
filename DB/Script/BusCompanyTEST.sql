EXEC spInsertTowns @name = 'Montgomery';
EXEC spInsertTowns @name = 'Blueshell';

EXEC spInsertGarages @name = 'Tom`s Garage', @capacity = 15, @ID_town = 6;
EXEC spInsertGarages @name = 'Red`s Garage', @capacity = 35, @ID_town = 7;

EXEC spInsertBusTypes @name = 'Cruise';

EXEC spInsertRoutes @name = 'Route 60', @Description = 'From Dayland to Montgomery';
EXEC spInsertRoutes @name = 'Route 70', @Description = 'From Montgomery to Blueshell';

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