CREATE DATABASE JUAREZ_DB
GO
USE JUAREZ_DB
GO
CREATE TABLE MARCA
(
	Id bigint not null primary key identity(1,1),
	Nombre varchar(100) not null,
	Descripcion varchar(100) not null
)
GO
CREATE TABLE CATEGORIA
(
	Id bigint not null primary key identity(1,1),
	Nombre varchar(100) not null
)
GO
CREATE TABLE PRODUCTO
(
	Id bigint not null primary key identity(1,1),
	Nombre varchar(100) not null,
	Stock int not null,
	Precio money not null,
	Descripcion varchar(1000),
	ImagenURL varchar(1000),
	Marca bigint not null foreign key references Marca(Id),
	IdCategoria bigint not null foreign key references Categoria(Id)
)
GO
CREATE TABLE PERSONA
(
	Id bigint not null primary key identity(1,1),
	Nombre varchar(100) not null,
	Apellido varchar(100) not null,
	DNI varchar (9) not null,
	FechaNac date null,
	Telefono varchar(20) null,
	Mail varchar(100) null,
	Direccion varchar(100) not null
)
go
CREATE TABLE TipoUsuario
(
	Id bigint not null primary key identity(1,1),
	NombreTipo varchar(100) not null
)
GO
CREATE TABLE Usuario
(
	Id bigint not null primary key identity(1,1),
	Nombre varchar(100) not null,
	Contrasenia varchar(100) not null,
	IdTipo bigint not null foreign key references TipoUsuario(Id),
	IdPersona bigint not null foreign key references PERSONA(Id),
)
GO
CREATE TABLE VENTA
(
	Id bigint not null primary key identity(1,1),
	Fecha date not null,
	formaPago varchar(200) not null,
	Usuario bigint not null foreign key references Usuario(Id)
)
GO
CREATE TABLE DETALLE_VENTA
(
	Id bigint not null primary key identity(1,1),
	Precio money not null,
	Cantidad int not null,
	IdProdu bigint not null foreign key references PRODUCTO(Id),
	IdVenta bigint not null foreign key references VENTA(Id)
)
GO
SET IDENTITY_INSERT MARCA OFF
GO
SET IDENTITY_INSERT PRODUCTO OFF
GO
SET IDENTITY_INSERT CATEGORIA OFF
GO
INSERT INTO MARCA(Nombre,Descripcion)VALUES('Gibson','Gibson guitarras')
GO
INSERT INTO CATEGORIA(Nombre)VALUES('Guitarras electricas')
GO
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,Marca,IdCategoria) VALUES ('Guitarra Gibson',10,$615000,'Guitarra Eléctrica Gibson Les Paul Standard 2018','https://http2.mlstatic.com/D_NQ_NP_976060-MLA31579021263_072019-O.webp',1,1)
GO
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,Marca,IdCategoria) VALUES ('Guitarra Gibenson',10,$615000,'Guitarra Eléctrica Gibson Les Paul Standard 2018','https://http2.mlstatic.com/D_NQ_NP_976060-MLA31579021263_072019-O.webp',1,1)
GO
CREATE VIEW LISTAR_PRODUCTOS AS(
SELECT P.Nombre,P.Stock,P.Precio,P.Descripcion,P.ImagenURL,M.Nombre AS Marca, C.Nombre AS Categoria
FROM PRODUCTO AS P
INNER JOIN MARCA AS M ON M.Id = P.Marca
INNER JOIN CATEGORIA AS C ON C.Id = P.IdCategoria
)
GO
CREATE PROCEDURE SP_AltaVenta
@Fecha date,
@formaPago varchar(100),
@idUsuario bigint
AS
INSERT INTO VENTA (Fecha,formaPago,Usuario) VALUES (GETDATE(),1,@idUsuario) 
GO
SET IDENTITY_INSERT DETALLE_VENTA OFF
GO
CREATE PROCEDURE SP_AltaDetalleVenta
@idVenta bigint,
@idProdu bigint,
@cantidad int,
@precio money 
AS
INSERT INTO DETALLE_VENTA (IdVenta,IdProdu,Cantidad,Precio) VALUES (@idVenta,@idProdu,@cantidad,@precio)
GO
SET IDENTITY_INSERT PERSONA OFF
GO
INSERT INTO PERSONA(Nombre,Apellido,DNI,FechaNac,Telefono,Mail,Direccion)VALUES('Juan Manuel','Juarez','12312312','1993-05-14','12312312','juan@gmail.com','Calle falsa 123')
GO
SET IDENTITY_INSERT TipoUsuario OFF
GO
INSERT INTO TipoUsuario(NombreTipo)VALUES('Administrator')
GO
SET IDENTITY_INSERT USUARIO OFF
GO
INSERT INTO Usuario(Nombre,Contrasenia,IdTipo,IdPersona) Values ('Juan','admin123',1,2)

