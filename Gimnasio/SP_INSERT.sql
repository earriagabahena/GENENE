USE Gimnasio
GO

CREATE OR ALTER PROCEDURE SPClientes5
		@Nombre NVARCHAR(100),
		@Telefono NVARCHAR (15),
		@Correo NVARCHAR(100)
		

AS
BEGIN 

			INSERT INTO Clientes 
			(Nombre, Correo, Telefono)
			VALUES (@Nombre, @Correo, @Telefono)

END
GO

SELECT * FROM Clientes
GO

EXEC SPClientes5
				@Nombre = 'g',
				@Telefono ='34533',
				@Correo = 'ja';
				
GO