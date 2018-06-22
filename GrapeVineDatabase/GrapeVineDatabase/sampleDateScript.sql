/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadTestData)' = 'true'

BEGIN 

DELETE FROM Bookings;
DELETE FROM TourEvents;
DELETE FROM Tours;
DELETE FROM Clients;

INSERT INTO Clients(clientID, clientFName, clientSName, clientGender) VALUES
	(1, 'Taylor', 'Price', 'M'),
	(2, 'Ellyse', 'Gamble', 'F'),
	(3, 'Tilly', 'Tan', 'F');

INSERT INTO Tours(tourName, tourDescription) VALUES	
	('West', 'Tour of wineries and outlets of the Geelong and Otways region'),
	('East', 'Tour of wineries and outlets of the Yarra Valley'),
	('South', 'Tour of wineries and outlets of Mornington Penisula'),
	('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region');

INSERT INTO TourEvents(tourName, eventDate, eventFee) VALUES
	('North', CONVERT(DATE, '9/1/2016', 103), $200.00),
	('North', CONVERT(DATE, '13/2/2016', 103), $225.00),
	('South', CONVERT(DATE, '16/1/2016', 103), $200.00),
	('West', CONVERT(DATE, '29/1/2016', 103), $225.00);
	
INSERT INTO Bookings(clientID, tourName, eventDate, payment, dateBooked) VALUES
	(1, 'North', CONVERT(DATE, '9/1/2016', 103), $200.00, CONVERT(DATE, '10/12/2015', 103)),
	(2, 'North', CONVERT(DATE, '9/1/2016', 103), $200.00, CONVERT(DATE, '16/12/2015', 103)),
	(1, 'North', CONVERT(DATE, '13/2/2016', 103), $225.00, CONVERT(DATE, '8/1/2016', 103)),
	(2, 'North', CONVERT(DATE, '13/2/2016', 103), $225.00, CONVERT(DATE, '14/1/2016', 103)),
	(3, 'North', CONVERT(DATE, '13/2/2016', 103), $225.00, CONVERT(DATE, '3/2/2016', 103)),
	(1, 'South', CONVERT(DATE, '16/1/2016', 103), $200.00, CONVERT(DATE, '10/12/2015', 103)),
	(2, 'South', CONVERT(DATE, '16/1/2016', 103), $200.00, CONVERT(DATE, '18/12/2015', 103)),
	(3, 'South', CONVERT(DATE, '16/1/2016', 103), $200.00, CONVERT(DATE, '9/1/2016', 103)),
	(2, 'West', CONVERT(DATE, '29/1/2016', 103), $200.00, CONVERT(DATE, '17/12/2015', 103)),
	(3, 'West', CONVERT(DATE, '29/1/2016', 103), $200.00, CONVERT(DATE, '18/12/2015', 103));
	
END;