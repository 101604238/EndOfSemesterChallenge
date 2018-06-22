CREATE TABLE [dbo].[Bookings]
(
	[clientID] INT NOT NULL,
	[tourName] NVARCHAR(50) NOT NULL,
	[eventDate] DATE NOT NULL,
	[payment] MONEY NOT NULL,
	[dateBooked] DATE NOT NULL,

	CONSTRAINT PK_Bookings PRIMARY KEY (clientID, tourName, eventDate),
	CONSTRAINT FK_Bookings_ClientID FOREIGN KEY (clientID) REFERENCES Clients(clientID),
	CONSTRAINT FK_TourEventsTourName FOREIGN KEY (tourName, eventDate) REFERENCES TourEvents(tourName, eventDate)
)
