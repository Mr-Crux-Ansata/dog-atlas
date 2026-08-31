CREATE LOGIN Dog_Atlas
WITH PASSWORD = 'DogAtlas123';
GO

USE Perros_Atlas;
GO

CREATE USER Dog_Atlas
FOR LOGIN Dog_Atlas;
GO

--Añadir como Datbase Owner
ALTER ROLE db_owner
ADD MEMBER Dog_Atlas;

GO