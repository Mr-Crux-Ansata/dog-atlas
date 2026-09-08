USE master;
GO

CREATE LOGIN DogAtlas
WITH PASSWORD = 'Ofelia123!';
GO

USE DogAtlasDB;
GO

CREATE USER DogAtlas
FOR LOGIN DogAtlas;
GO

--Añadir como Datbase Owner
ALTER ROLE db_owner
ADD MEMBER DogAtlas;

GO



CREATE LOGIN Dog_Atlas
WITH PASSWORD = 'DogAtlas123';
GO

USE DogAtlasDB;
GO

CREATE USER Dog_Atlas
FOR LOGIN Dog_Atlas;
GO

ALTER ROLE db_owner
ADD MEMBER Dog_Atlas;
GO

