CREATE DATABASE JUAREZ_DB
GO
USE JUAREZ_DB
GO
CREATE TABLE MARCA
(
	Id int not null primary key identity(1,1),
	Nombre varchar(100) not null,
	Descripcion varchar(100) not null
)
GO
CREATE TABLE CATEGORIA
(
	Id int not null primary key identity(1,1),
	Nombre varchar(100) not null
)
GO
CREATE TABLE PRODUCTO
(
	Id int not null primary key identity(1,1),
	Nombre varchar(100) not null,
	Stock int not null,
	Precio money not null,
	Descripcion varchar(1000),
	ImagenURL varchar(1000),
	IdMarca int not null foreign key references Marca(Id),
	IdCategoria int not null foreign key references Categoria(Id),
	Eliminado bit 
)
GO
CREATE TABLE PERSONA
(
	Id int not null primary key identity(1,1),
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
	Id int not null primary key identity(1,1),
	NombreTipo varchar(100) not null
)
GO
CREATE TABLE Usuario
(
	Id int not null primary key identity(1,1),
	Nombre varchar(100) not null,
	Contrasenia varchar(100) not null,
	IdTipo int not null foreign key references TipoUsuario(Id),
	IdPersona int not null foreign key references PERSONA(Id),
)
GO
CREATE TABLE FORMA_DE_PAGO
(
	Id int not null primary key identity(1,1),
	TipoPago varchar(100) not null
)
GO
CREATE TABLE ESTADO_VENTA
(
	Id int not null primary key identity(1,1),
	Nombre varchar(100) not null
)
GO
CREATE TABLE VENTA
(
	Id int not null	 primary key identity(1,1),
	Fecha date not null,
	formaPago int foreign key references FORMA_DE_PAGO(Id),
	Usuario int not null foreign key references Usuario(Id),
	EstadoVenta int not null foreign key references ESTADO_VENTA(Id)
)
GO
CREATE TABLE DETALLE_VENTA
(
	Id int not null primary key identity(1,1),
	Precio money not null,
	Cantidad int not null,
	IdProdu int not null foreign key references PRODUCTO(Id),
	IdVenta int not null foreign key references VENTA(Id)
)
GO
SET IDENTITY_INSERT MARCA OFF
GO
SET IDENTITY_INSERT PRODUCTO OFF
GO
SET IDENTITY_INSERT CATEGORIA OFF
GO
SET IDENTITY_INSERT ESTADO_VENTA OFF
GO
SET IDENTITY_INSERT PERSONA OFF
GO
SET IDENTITY_INSERT TipoUsuario OFF
GO
SET IDENTITY_INSERT USUARIO OFF
GO
SET IDENTITY_INSERT FORMA_DE_PAGO OFF
GO
INSERT INTO MARCA(Nombre,Descripcion)VALUES('Gibson','Gibson guitarras')
GO
INSERT INTO MARCA(Nombre,Descripcion)VALUES('Eastwood & Airlines','La marca favorita de músicos como Jack White de The White Stripes')
GO
INSERT INTO MARCA(Nombre,Descripcion)VALUES('Esp','Esp')
GO
INSERT INTO MARCA(Nombre,Descripcion)VALUES('Fender','Fender')
GO
INSERT INTO MARCA(Nombre,Descripcion)VALUES('Ibanez','Ibanez')
GO
INSERT INTO MARCA(Nombre,Descripcion)VALUES('&Joy','Teclados musicales')
GO
INSERT INTO MARCA(Nombre,Descripcion)VALUES('Marshall','Amplificadores de guitarras electricas')
GO
INSERT INTO CATEGORIA(Nombre)VALUES('Guitarras electricas')
GO
INSERT INTO CATEGORIA(Nombre)VALUES('Bajo')
GO
INSERT INTO CATEGORIA(Nombre)VALUES('Bateria')
GO
INSERT INTO CATEGORIA(Nombre)VALUES('Saxos')
GO
INSERT INTO CATEGORIA(Nombre)VALUES('Teclado')
GO
INSERT INTO CATEGORIA(Nombre)VALUES('Amplificador')
GO
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,IdMarca,IdCategoria,Eliminado) VALUES ('Guitarra Gibson',10,$615000,'Guitarra Eléctrica Gibson Les Paul Standard 2018','https://http2.mlstatic.com/D_NQ_NP_976060-MLA31579021263_072019-O.webp',1,1,0)
GO
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,IdMarca,IdCategoria,Eliminado) VALUES ('Bateria Fender',10,$500000,'Bateria completa para utilizar de inmediato','https://th.bing.com/th/id/R.f01c3859adb050016564eb07182b1fca?rik=cI0a0adA%2bwqt9g&riu=http%3a%2f%2fqueverdeasturias.com%2fadmin%2fimagenes%2fbateria-musical-profesional-completa-platillos-principiante-11550-mlm20045234193022014-fjpg.jpg&ehk=9UEYMn8N5aCl1W8Kz5hZ2YngbuBuzm6lQjj5R%2fHaiQM%3d&risl=&pid=ImgRaw&r=0',1,1,0)
GO
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,IdMarca,IdCategoria,Eliminado) VALUES ('Guitarra Fender Stratocaster',5,$50000,'Guitarra Eléctrica Fender Stratocaster Standard Mex. Maple','https://http2.mlstatic.com/D_NQ_NP_2X_892466-MLA43460898489_092020-F.webp',1,1,0)
GO
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,IdMarca,IdCategoria,Eliminado) VALUES ('Bajo electrico Fender',4,$141000,'Bajo electrico Fender Telecaster, color Beige','https://tiendafeedback.com.ar/17548-large_default/bajo-electrico-fender-telecaster-bass-butterscotch-blonde.jpg',4,2,0)
GO
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,IdMarca,IdCategoria,Eliminado) VALUES ('Teclado musical',5,$20000,'Teclado musical organo electrico color negro','https://http2.mlstatic.com/D_NQ_NP_2X_973869-MLA40465990013_012020-F.webp',7,5,0)
GO
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,IdMarca,IdCategoria,Eliminado) VALUES ('Amplificador Marshall',6,$593523,'Marshall Jcm800 Stack Cabezal Valvular 100 W + Caja 4 X 12','https://http2.mlstatic.com/D_NQ_NP_2X_816584-MLA31575499450_072019-F.webp',7,6,0)
GO
INSERT INTO PERSONA(Nombre,Apellido,DNI,FechaNac,Telefono,Mail,Direccion)VALUES('Juan Manuel','Juarez','12312312','1993-05-14','12312312','juan@gmail.com','Calle falsa 123')
GO
INSERT INTO PERSONA(Nombre,Apellido,DNI,FechaNac,Telefono,Mail,Direccion)VALUES('Valentin','Juarez','12312312','2020-06-28','12312312','valentin@gmail.com','Calle falsa 123')
GO
INSERT INTO TipoUsuario(NombreTipo)VALUES('Administrator')
GO
INSERT INTO TipoUsuario(NombreTipo)VALUES('UsuarioNoAdmin')
GO
INSERT INTO Usuario(Nombre,Contrasenia,IdTipo,IdPersona) Values ('Juan','admin123',1,1)
GO
INSERT INTO Usuario(Nombre,Contrasenia,IdTipo,IdPersona) Values ('Valentin','Valentin01',2,2)
GO
INSERT INTO FORMA_DE_PAGO(TipoPago)VALUES('Mercado Pago')
GO
INSERT INTO FORMA_DE_PAGO(TipoPago)VALUES('Transferencia bancaria')
GO
INSERT INTO FORMA_DE_PAGO(TipoPago)VALUES('Efectivo')
GO
INSERT INTO ESTADO_VENTA(Nombre)VALUES('Pendiente de entrega')
GO
INSERT INTO ESTADO_VENTA(Nombre)VALUES('En camino')
GO
INSERT INTO ESTADO_VENTA(Nombre)VALUES('Entregado')
GO
CREATE VIEW LISTAR_PRODUCTOS AS(
SELECT P.Nombre,P.Stock,P.Precio,P.Descripcion,P.ImagenURL,M.Nombre AS Marca,C.Nombre AS Categoria,P.Eliminado
FROM PRODUCTO AS P
INNER JOIN MARCA AS M ON M.Id = P.IdMarca
INNER JOIN CATEGORIA AS C ON C.Id = P.IdCategoria
WHERE P.Eliminado=0
)
GO
CREATE PROCEDURE SP_AltaVenta
@Fecha date,
@formaPago int,
@idUsuario int,
@estadoVenta int
AS
INSERT INTO VENTA (Fecha,formaPago,Usuario,EstadoVenta) VALUES (GETDATE(),@formaPago,@idUsuario,@estadoVenta) 
GO
SET IDENTITY_INSERT DETALLE_VENTA OFF
GO
CREATE PROCEDURE SP_AltaDetalleVenta
@precio money,
@cantidad int,
@idProdu int,
@idVenta int
AS
INSERT INTO DETALLE_VENTA (Precio,Cantidad,IdProdu,IdVenta) VALUES (@precio,@cantidad,@idProdu,@idVenta)
GO
CREATE PROCEDURE SP_AltaProducto
@nombre varchar(100),
@stock int,
@precio money,
@descripcion varchar(1000),
@imagenUrl varchar(1000),
@idMarca int,
@idCategoria int,
@eliminado bit
AS
INSERT INTO PRODUCTO(Nombre,Stock,Precio,Descripcion,ImagenURL,IdMarca,IdCategoria,Eliminado) VALUES (@nombre,@stock,@precio,@descripcion,@imagenUrl,@idMarca,@idCategoria,@eliminado)
GO
CREATE PROCEDURE SP_AltaMarca
@Nombre varchar(100),
@Descripcion varchar(100)
AS
INSERT INTO MARCA(Nombre,Descripcion) VALUES (@Nombre,@Descripcion)
GO
CREATE PROCEDURE SP_AltaCategoria
@Nombre varchar(100)
AS
INSERT INTO CATEGORIA(Nombre) VALUES (@Nombre)
GO
CREATE PROCEDURE SP_BajaProducto
@idEliminado int
AS
UPDATE PRODUCTO SET Eliminado=1 WHERE @idEliminado = Id 
GO
CREATE PROCEDURE SP_CambiarEstado
@idVenta int
AS
UPDATE VENTA SET EstadoVenta = 2 WHERE Id = @idVenta	
GO
CREATE PROCEDURE SP_CambiarEstado2
@idVenta int
AS
UPDATE VENTA SET EstadoVenta = 3 WHERE Id = @idVenta

Select v.fecha,d.Precio,e.Nombre,d.cantidad,p.nombre,u.nombre
From VENTA as v
inner join DETALLE_VENTA as d on v.Id = d.IdVenta
inner join ESTADO_VENTA as e on e.Id = v.EstadoVenta
inner join PRODUCTO as p on d.IdProdu=p.Id
inner join Usuario as u on u.Id = v.Usuario
WHERE 2=u.Id

SELECT Id,Fecha,formaPago,Usuario,EstadoVenta from VENTA