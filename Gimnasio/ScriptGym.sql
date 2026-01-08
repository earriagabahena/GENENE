CREATE DATABASE Gym
--Creacion  de la Base de Datos "Gimnasio"
GO
-- =====================================================================
-- Author:		Edgar Alexis Arriaga Bahena
-- Create date: 06/01/2026
-- Description: Se crea base de datos tablas para proyecto: Gimnasio	
-- EAAB20260106: Liberacion BD.
-- =====================================================================

USE Gym
GO
-- Nos posicionamos en base de datos de gimnasio



----				CREACION DE TABLA CLIENTES							----
CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY IDENTITY(1,1),   
	Nombre NVARCHAR (100),
	Telefono NVARCHAR (50),
	Correo NVARCHAR (50),						
	FechaNac DATE,
	FechaIngreso DATETIME DEFAULT GETDATE(),
	FechaExp DATETIME
	)
GO
----				CREACION DE TABLA ENTRANADOR PERSONAL				----
CREATE TABLE Entrenadores (
	EntrenadorID INT PRIMARY KEY IDENTITY(1,1),
	ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
	Nombre NVARCHAR(100),
	Telefono NVARCHAR(50),
	Estatus NVARCHAR(50),
	)
GO
---				CREACION DE TABLA MEMBRESIAS					----
CREATE TABLE Membresias (
	MembresiaID INT PRIMARY KEY IDENTITY(1,1),
	ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
	NombreMem NVARCHAR(100),
	Precio DECIMAL(10,2),
	Duración NVARCHAR(100)
	
)
GO
----		CREACION DE TABLA DE INGRESO A INSTALACIONES			----
CREATE TABLE IngresosSalidas(
	EntradaID INT PRIMARY KEY IDENTITY(1,1),
	ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
	HoraEntrada DATETIME DEFAULT GETDATE(),
	HoraSalida DATETIME
)
GO
--					Finalizacíón de DataBase						-------


INSERT INTO [dbo].[Clientes]
           ([Nombre]
           ,[Correo]
           ,[Telefono])
     VALUES
           ('Alexis', '8272728282', 'jshajaj@gmail.com'),
			('Juan', '823348282', 'juan@gmail.com')
GO




SELECT * FROM Clientes