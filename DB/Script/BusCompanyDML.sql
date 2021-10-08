USE BusCompany
GO

INSERT INTO [dbo].[Town]
           ([Name])
     VALUES
           ('Waverly'),
		   ('Riverside'),
		   ('Oakland'),
		   ('Kingston'),
		   ('Dayland');
GO

INSERT INTO [dbo].[Garage]
           ([Name]
           ,[Capacity]
           ,[ID_town])
     VALUES
           ('Lucy`s Garage', 8, 1),
		   ('Cars', 20, 2),
		   ('Super Lot', 30, 3),
		   ('Car Farm', 16, 4),
		   ('Parker', 20, 5);
GO

INSERT INTO [dbo].[Type_bus]
           ([Description])
     VALUES
           ('Single deck'),
		   ('Double deck'),
		   ('Triple deck'),
		   ('VIP'),
		   ('Basic');
GO

INSERT INTO [dbo].[Route]
           ([Name]
           ,[Description])
     VALUES
           ('Route 10', 'From Waverly to Oakland'),
		   ('Route 15', 'From Riverside to Kingston'),
		   ('Route 13', 'From Waverly to Riverside'),
		   ('Route 30', 'From Oakland to Dayland'),
		   ('Route 50', 'From Kingston to Dayland');
GO

INSERT INTO [dbo].[Journey]
           ([Name])
     VALUES
           ('Waverly-Riverside'),
		   ('Riverside-Oakland'),
		   ('Oakland-Kingston'),
		   ('Kingston-Dayland'),
		   ('Waverly-Riverside-Oakland');
GO

INSERT INTO [dbo].[Route_journey]
           ([ID_route]
           ,[ID_journey])
     VALUES
           (1,1),
		   (1,2),
		   (1,5),
		   (2,2),
		   (2,3),
		   (3,1),
		   (4,3),
		   (4,4),
		   (5,4);
GO


INSERT INTO [dbo].[Journey_town]
           ([ID_town]
           ,[ID_journey])
     VALUES
           (1,1),
		   (1,5),
		   (2,1),
		   (2,2),
		   (2,5),
		   (3,2),
		   (3,3),
		   (4,3),
		   (4,4),
		   (5,4);
GO

INSERT INTO [dbo].[Driver]
           ([Name]
           ,[Address]
           ,[Telephone]
           ,[ID_journey])
     VALUES
           ('Jose Perez', 'R St. 123', '585-5674', 1),
		   ('Mike H.', 'Ju Ave. 4', '435-9342', 2),
		   ('Luis X.', 'Las UT. 128', '364-0786', 3),
		   ('Sam Y.', 'Kuh 54', '585-3701', 4),
		   ('Fer I.', 'Pul St. 02', '585-1958', 5);
GO

INSERT INTO [dbo].[Route_log]
           ([pass_average]
           ,[Date]
           ,[ID_route])
     VALUES
           (30, '09-10-2021', 1),
		   (40, '09-10-2021', 2),
		   (35, '09-11-2021', 3),
		   (25, '09-12-2021', 4),
		   (70, '09-13-2021', 5);
GO

INSERT INTO [dbo].[Bus]
           ([licence_plate]
           ,[capacity]
           ,[size]
           ,[ID_type_bus]
           ,[ID_route])
     VALUES
           ('B12-KU78' , 40, 'Medium', 1, 1),
		   ('B08-HV4' , 80, 'Big', 2, 2),
		   ('B2-NH2' , 120, 'Huge', 3, 3),
		   ('B83-LQ9' , 15, 'Small', 4, 4),
		   ('B02-WH43' , 25, 'Small', 5, 5);
GO












