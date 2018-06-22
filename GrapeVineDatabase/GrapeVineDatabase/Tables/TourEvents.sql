CREATE TABLE [dbo].[TourEvents]
(
	[tourName] NVARCHAR(50) NOT NULL,
	[eventDate] DATE NOT NULL,
	[eventFee] MONEY NOT NULL,
	CONSTRAINT PK_TourEvents PRIMARY KEY (tourName, eventDate),
	CONSTRAINT FK_TourEvents_TourName FOREIGN KEY (tourName) REFERENCES Tours(tourName)
)
