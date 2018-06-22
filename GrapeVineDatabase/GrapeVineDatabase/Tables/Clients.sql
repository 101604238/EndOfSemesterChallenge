CREATE TABLE [dbo].[Clients]
(
	[clientID] INT NOT NULL PRIMARY KEY,
	[clientFName] NVARCHAR(50) NOT NULL,
	[clientSName] NVARCHAR(50) NOT NULL,
	[clientGender] CHAR NOT NULL
)
