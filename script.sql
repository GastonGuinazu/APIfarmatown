
USE [master]
GO
/****** Object:  Database [farmatown3]    Script Date: 04/11/2022 23:45:23 ******/
CREATE DATABASE [farmatown3] 
GO

USE [farmatown3]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[total] [decimal](10, 2) NULL,
	[tieneObraSocial] [bit] NULL,
	[dniCliente] [bigint] NULL,
	[idUsuario] [int] NULL,
	[tipoPago] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[facturasObraSocial]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[facturasObraSocial]
as
select count(idFactura) Cantidad_Con_OS, (select count(idFactura) from facturas where tieneObraSocial = 0) as Cantidad_Sin_OS from facturas where tieneObraSocial = 1
GO
/****** Object:  Table [dbo].[articulos]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulos](
	[idArticulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[stock] [int] NULL,
	[precioUnitario] [decimal](10, 2) NULL,
	[idTipoArticulo] [int] NULL,
	[id_droga] [int] NULL,
	[id_laboratorio] [int] NULL,
	[fecha_vto] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[dni] [bigint] NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[telefono] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_lote]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_lote](
	[id_detalle_lote] [int] IDENTITY(1,1) NOT NULL,
	[idArticulo] [int] NULL,
	[id_lote] [int] NULL,
	[cantidad_comprada] [int] NULL,
	[precio_compra] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detallesFactura]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallesFactura](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idFactura] [int] NULL,
	[idArticulo] [int] NULL,
	[descuento] [int] NULL,
	[montoDescontado] [decimal](10, 2) NULL,
	[subtotal] [decimal](10, 2) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drogas]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drogas](
	[id_droga] [int] IDENTITY(1,1) NOT NULL,
	[nombreDroga] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_droga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[laboratorios]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[laboratorios](
	[id_laboratorio] [int] IDENTITY(1,1) NOT NULL,
	[nombreLab] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_laboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lotes]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lotes](
	[id_lote] [int] IDENTITY(1,1) NOT NULL,
	[fecha_lote] [date] NULL,
	[total] [decimal](10, 2) NULL,
	[id_proveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedores]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedores](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre_proveedor] [varchar](40) NULL,
	[cuit] [bigint] NULL,
	[direccion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarjetas]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarjetas](
	[nro_tarjeta] [bigint] NOT NULL,
	[cod_seguridad] [int] NULL,
	[fecha_venc] [date] NULL,
	[dni] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_tarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoArticulos]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoArticulos](
	[idTipoArticulo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoPago]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoPago](
	[tipoPago] [bit] NOT NULL,
	[descripcion] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[tipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoUsuarios]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoUsuarios](
	[idTipoUsuario] [int] NOT NULL,
	[descripcion] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](15) NULL,
	[pwd] [varchar](15) NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[idTipoUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[articulos] ON 
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (1, N'ibuprofeno 600mg 20 comp', 102, CAST(400.00 AS Decimal(10, 2)), 1, 4, 1, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (2, N'ibuprofeno 400mg 20 comp', 100, CAST(300.00 AS Decimal(10, 2)), 1, 4, 1, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (3, N'ibuprofeno 600mg 30 ', 100, CAST(550.00 AS Decimal(10, 2)), 1, 4, 1, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (4, N'ibuevanol 20 caps', 101, CAST(350.00 AS Decimal(10, 2)), 1, 1, 1, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (5, N'ibuevanol plus 20 caps', 101, CAST(450.00 AS Decimal(10, 2)), 1, 4, 3, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (6, N'ibuevanol forte 10 caps', 100, CAST(500.00 AS Decimal(10, 2)), 1, 4, 3, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (7, N'bayaspirina 650mg 20 comp', 100, CAST(400.00 AS Decimal(10, 2)), 1, 2, 2, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (8, N'ibuevanol forte 10 comp', 100, CAST(450.00 AS Decimal(10, 2)), 1, 2, 2, CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (9, N'aspirina 500mg 20 comp', 103, CAST(450.00 AS Decimal(10, 2)), 1, 2, 2, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (10, N'aspirina 400mg 40 comp', 100, CAST(700.00 AS Decimal(10, 2)), 1, 2, 2, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (11, N'elissan 2mg 20 comp', 50, CAST(300.00 AS Decimal(10, 2)), 1, 1, 5, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (12, N'elissan 2mg 10 comp', 50, CAST(250.00 AS Decimal(10, 2)), 1, 1, 5, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (13, N'mentholatum 85g', 20, CAST(600.00 AS Decimal(10, 2)), 1, 5, 2, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (14, N'aziatop 20mg 14 caps', 80, CAST(500.00 AS Decimal(10, 2)), 1, 3, 4, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (15, N'omeprazol 20mg 14 caps', 80, CAST(550.00 AS Decimal(10, 2)), 1, 3, 4, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (16, N'acetaminofen 500mg 20 comp', 80, CAST(400.00 AS Decimal(10, 2)), 1, 9, 5, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (17, N'tylenol 500mg 20 comp', 80, CAST(420.00 AS Decimal(10, 2)), 1, 9, 5, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (18, N'panadol 500mg 16 comp', 80, CAST(480.00 AS Decimal(10, 2)), 1, 9, 5, CAST(N'2022-12-29' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (19, N'loperamida 2mg 6 comp', 40, CAST(200.00 AS Decimal(10, 2)), 1, 1, 3, CAST(N'2022-12-29' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (20, N'fortasec flas 2mg 500 20 comp', 80, CAST(400.00 AS Decimal(10, 2)), 1, 1, 5, CAST(N'2022-12-29' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (21, N'bialcohol 1000ml', 20, CAST(900.00 AS Decimal(10, 2)), 5, 6, 6, CAST(N'2022-12-29' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (22, N'bialcohol 250ml', 20, CAST(400.00 AS Decimal(10, 2)), 5, 6, 6, CAST(N'2022-12-29' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (23, N'sanicol 500ml', 20, CAST(900.00 AS Decimal(10, 2)), 5, 6, 4, CAST(N'2022-12-29' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (24, N'toy boy 50ml', 5, CAST(2000.00 AS Decimal(10, 2)), 2, 7, 7, CAST(N'2022-12-29' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (25, N'Ebano Salvia 100ml', 5, CAST(2500.00 AS Decimal(10, 2)), 2, 7, 7, CAST(N'2022-12-29' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (26, N'loewe 100ml', 5, CAST(4000.00 AS Decimal(10, 2)), 2, 7, 7, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (27, N'bagovit A 50g', 30, CAST(800.00 AS Decimal(10, 2)), 3, 8, 2, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (28, N'loreal 100g', 27, CAST(700.00 AS Decimal(10, 2)), 3, 8, 2, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (29, N'dermaglos 50g', 25, CAST(900.00 AS Decimal(10, 2)), 3, 8, 2, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (30, N'neutrogena 75g', 25, CAST(800.00 AS Decimal(10, 2)), 3, 8, 3, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (31, N'pañuelos elite', 200, CAST(150.00 AS Decimal(10, 2)), 4, 8, 5, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (32, N'barbijo descartable', 400, CAST(50.00 AS Decimal(10, 2)), 4, 8, 5, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (33, N'pañuelos achiss', 200, CAST(145.00 AS Decimal(10, 2)), 4, 8, 5, CAST(N'2023-02-03' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (34, N'pañales comodin 10u', 150, CAST(1800.00 AS Decimal(10, 2)), 4, 8, 5, CAST(N'2023-02-03' AS Date))
GO
INSERT [dbo].[articulos] ([idArticulo], [nombre], [stock], [precioUnitario], [idTipoArticulo], [id_droga], [id_laboratorio], [fecha_vto]) VALUES (35, N'estrella hisopo 125u', 40, CAST(200.00 AS Decimal(10, 2)), 4, 8, 4, CAST(N'2023-02-03' AS Date))
GO
SET IDENTITY_INSERT [dbo].[articulos] OFF
GO
INSERT [dbo].[clientes] ([dni], [nombre], [apellido], [telefono]) VALUES (1212, N'prueba', N'prue', 531255)
GO
INSERT [dbo].[clientes] ([dni], [nombre], [apellido], [telefono]) VALUES (11111, N'gas', N'gas', 435543)
GO
INSERT [dbo].[clientes] ([dni], [nombre], [apellido], [telefono]) VALUES (123123, N'fran', N'Valenzuela', 545454)
GO
INSERT [dbo].[clientes] ([dni], [nombre], [apellido], [telefono]) VALUES (13456789, N'rocco', N'hola', 132341)
GO
INSERT [dbo].[clientes] ([dni], [nombre], [apellido], [telefono]) VALUES (24578124, N'Diego', N'Ferreyra', 4578745)
GO
INSERT [dbo].[clientes] ([dni], [nombre], [apellido], [telefono]) VALUES (24875478, N'Juan', N'Perez', 4571545)
GO
INSERT [dbo].[clientes] ([dni], [nombre], [apellido], [telefono]) VALUES (25547845, N'Flor', N'Perezz', 4578460)
GO
SET IDENTITY_INSERT [dbo].[detalle_lote] ON 
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (1, 1, 1, 102, CAST(240.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (2, 2, 1, 100, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (3, 3, 1, 100, CAST(320.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (4, 4, 1, 101, CAST(230.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (5, 5, 1, 101, CAST(230.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (6, 6, 2, 100, CAST(340.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (8, 8, 2, 100, CAST(240.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (9, 9, 2, 103, CAST(235.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (10, 10, 2, 100, CAST(500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (11, 11, 2, 50, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (12, 12, 3, 50, CAST(160.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (13, 13, 3, 20, CAST(400.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (14, 14, 3, 80, CAST(350.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (15, 15, 3, 80, CAST(380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (16, 16, 3, 80, CAST(260.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (17, 17, 3, 80, CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (18, 18, 4, 80, CAST(330.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (19, 19, 4, 40, CAST(130.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (20, 20, 4, 80, CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (21, 21, 4, 20, CAST(630.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (22, 22, 4, 20, CAST(290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (23, 23, 4, 20, CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (24, 24, 5, 5, CAST(1450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (25, 25, 5, 5, CAST(1850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (26, 26, 5, 5, CAST(3000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (27, 27, 5, 30, CAST(550.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (28, 28, 5, 27, CAST(480.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (29, 29, 5, 25, CAST(630.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (30, 30, 6, 25, CAST(600.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (31, 31, 6, 200, CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (32, 32, 6, 400, CAST(35.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (33, 33, 6, 200, CAST(90.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (34, 34, 6, 150, CAST(1400.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (35, 35, 6, 40, CAST(145.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (38, 1, 8, 2, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (39, 1, 8, 2, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (40, 2, 8, 1, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (41, 3, 9, 2, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (42, 3, 9, 2, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (43, 1, 15, 5, CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (45, 5, 17, 2, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (46, 7, 18, 5, CAST(400.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (47, 4, 18, 3, CAST(350.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (48, 10, 18, 3, CAST(700.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (49, 2, 19, 3, CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (50, 5, 19, 3, CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detalle_lote] ([id_detalle_lote], [idArticulo], [id_lote], [cantidad_comprada], [precio_compra]) VALUES (51, 3, 22, 2, CAST(550.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[detalle_lote] OFF
GO
SET IDENTITY_INSERT [dbo].[detallesFactura] ON 
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (16, 6, 3, 15, CAST(555.00 AS Decimal(10, 2)), CAST(3145.00 AS Decimal(10, 2)), 1, CAST(3700.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (22, 13, 1, 0, CAST(0.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(10, 2)), 3, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (23, 14, 1, 0, CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), 5, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (24, 15, 1, 0, CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), 1, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (25, 16, 1, 0, CAST(0.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), 2, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (26, 17, 1, 0, CAST(0.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), 2, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (27, 18, 1, 0, CAST(0.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), 2, CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (29, 20, 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(3700.00 AS Decimal(10, 2)), 1, CAST(3700.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (30, 21, 1, 0, CAST(0.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), 1, CAST(400.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[detallesFactura] ([idDetalle], [idFactura], [idArticulo], [descuento], [montoDescontado], [subtotal], [cantidad], [precio]) VALUES (31, 21, 28, 0, CAST(0.00 AS Decimal(10, 2)), CAST(2100.00 AS Decimal(10, 2)), 3, CAST(700.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[detallesFactura] OFF
GO
SET IDENTITY_INSERT [dbo].[drogas] ON 
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (1, N'Loperamida')
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (2, N'Aspirina')
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (3, N'Omeprazol')
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (4, N'Ibuprofeno')
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (5, N'Alcanfor')
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (6, N'Alcohol')
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (7, N'Aceite esencial')
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (8, N'Ninguna')
GO
INSERT [dbo].[drogas] ([id_droga], [nombreDroga]) VALUES (9, N'Acetaminofen')
GO
SET IDENTITY_INSERT [dbo].[drogas] OFF
GO
SET IDENTITY_INSERT [dbo].[facturas] ON 
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (6, CAST(N'2022-09-30' AS Date), CAST(3505.00 AS Decimal(10, 2)), 1, 13456789, 3, 0)
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (13, CAST(N'2022-10-07' AS Date), CAST(600.00 AS Decimal(10, 2)), 0, 123123, 1, NULL)
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (14, CAST(N'2022-10-07' AS Date), CAST(1000.00 AS Decimal(10, 2)), 0, 25547845, 1, NULL)
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (15, CAST(N'2022-10-07' AS Date), CAST(200.00 AS Decimal(10, 2)), 0, 24578124, 1, NULL)
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (16, CAST(N'2022-10-07' AS Date), CAST(400.00 AS Decimal(10, 2)), 0, 123123, 1, NULL)
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (17, CAST(N'2022-10-07' AS Date), CAST(400.00 AS Decimal(10, 2)), 0, 123123, 1, NULL)
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (18, CAST(N'2022-10-07' AS Date), CAST(400.00 AS Decimal(10, 2)), 0, 123123, 1, 1)
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (20, CAST(N'2022-10-10' AS Date), CAST(3700.00 AS Decimal(10, 2)), 0, 13456789, 3, 0)
GO
INSERT [dbo].[facturas] ([idFactura], [fecha], [total], [tieneObraSocial], [dniCliente], [idUsuario], [tipoPago]) VALUES (21, CAST(N'2022-11-02' AS Date), CAST(2500.00 AS Decimal(10, 2)), 1, 11111, 3, 0)
GO
SET IDENTITY_INSERT [dbo].[facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[laboratorios] ON 
GO
INSERT [dbo].[laboratorios] ([id_laboratorio], [nombreLab]) VALUES (1, N'Drogueria Argentina S.A.')
GO
INSERT [dbo].[laboratorios] ([id_laboratorio], [nombreLab]) VALUES (2, N'Química Luar')
GO
INSERT [dbo].[laboratorios] ([id_laboratorio], [nombreLab]) VALUES (3, N'Lazar')
GO
INSERT [dbo].[laboratorios] ([id_laboratorio], [nombreLab]) VALUES (4, N'Tablada SRL')
GO
INSERT [dbo].[laboratorios] ([id_laboratorio], [nombreLab]) VALUES (5, N'Norton SRL')
GO
INSERT [dbo].[laboratorios] ([id_laboratorio], [nombreLab]) VALUES (6, N'Porta')
GO
INSERT [dbo].[laboratorios] ([id_laboratorio], [nombreLab]) VALUES (7, N'Distribuidor de Perfumes')
GO
SET IDENTITY_INSERT [dbo].[laboratorios] OFF
GO
SET IDENTITY_INSERT [dbo].[lotes] ON 
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (1, CAST(N'2022-10-28' AS Date), CAST(120940.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (2, CAST(N'2022-10-25' AS Date), CAST(168205.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (3, CAST(N'2022-10-22' AS Date), CAST(88800.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (4, CAST(N'2022-10-26' AS Date), CAST(87000.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (5, CAST(N'2022-10-28' AS Date), CAST(76710.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (6, CAST(N'2022-10-26' AS Date), CAST(298800.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (8, CAST(N'2022-10-29' AS Date), CAST(1000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (9, CAST(N'2022-10-29' AS Date), CAST(15000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (10, CAST(N'2022-10-29' AS Date), CAST(16000.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (11, CAST(N'2022-10-29' AS Date), CAST(20000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (13, CAST(N'2022-11-01' AS Date), CAST(100.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (14, CAST(N'2022-10-02' AS Date), CAST(1650.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (15, CAST(N'2022-10-02' AS Date), CAST(1100.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (16, CAST(N'2022-10-02' AS Date), CAST(1100.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (17, CAST(N'2022-10-02' AS Date), CAST(900.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (18, CAST(N'2022-10-02' AS Date), CAST(5150.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (19, CAST(N'2022-10-02' AS Date), CAST(2250.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (20, CAST(N'2022-10-02' AS Date), CAST(1500.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (21, CAST(N'2022-10-02' AS Date), CAST(2600.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[lotes] ([id_lote], [fecha_lote], [total], [id_proveedor]) VALUES (22, CAST(N'2022-10-02' AS Date), CAST(1100.00 AS Decimal(10, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[lotes] OFF
GO
SET IDENTITY_INSERT [dbo].[proveedores] ON 
GO
INSERT [dbo].[proveedores] ([id_proveedor], [nombre_proveedor], [cuit], [direccion]) VALUES (1, N'Drogueria MG S.R.L', 30500006613, N'malaga 1610')
GO
INSERT [dbo].[proveedores] ([id_proveedor], [nombre_proveedor], [cuit], [direccion]) VALUES (2, N'Drogueria Capdevilla S.R.L', 30663205621, N'francisco suarez 2760')
GO
INSERT [dbo].[proveedores] ([id_proveedor], [nombre_proveedor], [cuit], [direccion]) VALUES (3, N'Drogueria Decade', 30500057102, N'fragueiro 474')
GO
INSERT [dbo].[proveedores] ([id_proveedor], [nombre_proveedor], [cuit], [direccion]) VALUES (4, N'P&G', 30604958640, N'roberto cayol 3799')
GO
SET IDENTITY_INSERT [dbo].[proveedores] OFF
GO
INSERT [dbo].[tarjetas] ([nro_tarjeta], [cod_seguridad], [fecha_venc], [dni]) VALUES (10101010, 123, CAST(N'2026-10-10' AS Date), 1212)
GO
INSERT [dbo].[tarjetas] ([nro_tarjeta], [cod_seguridad], [fecha_venc], [dni]) VALUES (125478458, 154, CAST(N'2022-10-30' AS Date), 25547845)
GO
INSERT [dbo].[tarjetas] ([nro_tarjeta], [cod_seguridad], [fecha_venc], [dni]) VALUES (1122334455667788, 12, CAST(N'2022-10-07' AS Date), 123123)
GO
SET IDENTITY_INSERT [dbo].[tipoArticulos] ON 
GO
INSERT [dbo].[tipoArticulos] ([idTipoArticulo], [descripcion]) VALUES (1, N'Medicamento')
GO
INSERT [dbo].[tipoArticulos] ([idTipoArticulo], [descripcion]) VALUES (2, N'Perfumeria')
GO
INSERT [dbo].[tipoArticulos] ([idTipoArticulo], [descripcion]) VALUES (3, N'Cosmetico')
GO
INSERT [dbo].[tipoArticulos] ([idTipoArticulo], [descripcion]) VALUES (4, N'Descartable')
GO
INSERT [dbo].[tipoArticulos] ([idTipoArticulo], [descripcion]) VALUES (5, N'Desinfectante')
GO
SET IDENTITY_INSERT [dbo].[tipoArticulos] OFF
GO
INSERT [dbo].[tipoPago] ([tipoPago], [descripcion]) VALUES (0, N'efectivo')
GO
INSERT [dbo].[tipoPago] ([tipoPago], [descripcion]) VALUES (1, N'tarjeta')
GO
INSERT [dbo].[tipoUsuarios] ([idTipoUsuario], [descripcion]) VALUES (1, N'admin')
GO
INSERT [dbo].[tipoUsuarios] ([idTipoUsuario], [descripcion]) VALUES (2, N'vendedor')
GO
INSERT [dbo].[tipoUsuarios] ([idTipoUsuario], [descripcion]) VALUES (3, N'gerente')
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([idUsuario], [usuario], [pwd], [nombre], [apellido], [idTipoUsuario]) VALUES (1, N'fran', N'1234', N'Francisco', N'Valenzuela', 2)
GO
INSERT [dbo].[usuarios] ([idUsuario], [usuario], [pwd], [nombre], [apellido], [idTipoUsuario]) VALUES (2, N'roco', N'1234', N'Matias', N'Etcetera', 2)
GO
INSERT [dbo].[usuarios] ([idUsuario], [usuario], [pwd], [nombre], [apellido], [idTipoUsuario]) VALUES (3, N'gaston', N'12345', N'Gaston', N'Guiñazu', 1)
GO
INSERT [dbo].[usuarios] ([idUsuario], [usuario], [pwd], [nombre], [apellido], [idTipoUsuario]) VALUES (4, N'noe', N'123', N'Noelia', N'Gonzales', 3)
GO
INSERT [dbo].[usuarios] ([idUsuario], [usuario], [pwd], [nombre], [apellido], [idTipoUsuario]) VALUES (5, N'Noe', N'katy', N'Noelia', N'Tulian', 2)
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[articulos]  WITH CHECK ADD FOREIGN KEY([idTipoArticulo])
REFERENCES [dbo].[tipoArticulos] ([idTipoArticulo])
GO
ALTER TABLE [dbo].[articulos]  WITH CHECK ADD  CONSTRAINT [fk_droga] FOREIGN KEY([id_droga])
REFERENCES [dbo].[drogas] ([id_droga])
GO
ALTER TABLE [dbo].[articulos] CHECK CONSTRAINT [fk_droga]
GO
ALTER TABLE [dbo].[articulos]  WITH CHECK ADD  CONSTRAINT [fk_laboratorio] FOREIGN KEY([id_laboratorio])
REFERENCES [dbo].[laboratorios] ([id_laboratorio])
GO
ALTER TABLE [dbo].[articulos] CHECK CONSTRAINT [fk_laboratorio]
GO
ALTER TABLE [dbo].[detalle_lote]  WITH CHECK ADD FOREIGN KEY([id_lote])
REFERENCES [dbo].[lotes] ([id_lote])
GO
ALTER TABLE [dbo].[detalle_lote]  WITH CHECK ADD FOREIGN KEY([idArticulo])
REFERENCES [dbo].[articulos] ([idArticulo])
GO
ALTER TABLE [dbo].[detallesFactura]  WITH CHECK ADD FOREIGN KEY([idArticulo])
REFERENCES [dbo].[articulos] ([idArticulo])
GO
ALTER TABLE [dbo].[detallesFactura]  WITH CHECK ADD FOREIGN KEY([idFactura])
REFERENCES [dbo].[facturas] ([idFactura])
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD FOREIGN KEY([dniCliente])
REFERENCES [dbo].[clientes] ([dni])
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD FOREIGN KEY([tipoPago])
REFERENCES [dbo].[tipoPago] ([tipoPago])
GO
ALTER TABLE [dbo].[lotes]  WITH CHECK ADD FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedores] ([id_proveedor])
GO
ALTER TABLE [dbo].[tarjetas]  WITH CHECK ADD FOREIGN KEY([dni])
REFERENCES [dbo].[clientes] ([dni])
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[tipoUsuarios] ([idTipoUsuario])
GO
/****** Object:  StoredProcedure [dbo].[sp_articulosVendidos]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_articulosVendidos]
@mes int
as
begin
select top 10 a.nombre as Articulo , sum(cantidad) as Cantidad_vendida, month(f2.fecha) as Mes,year(f2.fecha) as Año
from detallesFactura f join articulos a on a.idArticulo=f.idArticulo join
facturas f2 on f2.idFactura=f.idFactura
where month(f2.fecha)=@mes
group by month(f2.fecha),year(f2.fecha),a.nombre
order by Cantidad_vendida desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_clientesFrecuentes]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_clientesFrecuentes]
 as
select top 3 c.nombre+' '+c.apellido AS Nombre, count(dniCliente) as Compras_totales 
from clientes c, facturas f where c.dni = f.dniCliente group by c.nombre, c.apellido order by count(dniCliente) desc
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_ARTICULOS_COMBO_BOX]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_ARTICULOS_COMBO_BOX]
AS
BEGIN
		SELECT idArticulo, nombre +' | $' + convert(varchar(100), precioUnitario) as Articulo, tp.idTipoArticulo, descripcion,d.id_droga, nombreDroga, l.id_laboratorio, nombreLab,
	a.precioUnitario
	from articulos a join tipoArticulos tp on a.idTipoArticulo=tp.idTipoArticulo
	JOIN laboratorios l ON a.id_laboratorio = l.id_laboratorio
	JOIN drogas d ON a.id_droga= d.id_droga;
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_ARTICULOS_COMBO_BOX_FILTRO]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_ARTICULOS_COMBO_BOX_FILTRO]
@filtro varchar(20)
AS
BEGIN
	
	SELECT idArticulo, nombre, a.idTipoArticulo,descripcion,precioUnitario 
	from articulos a join tipoArticulos tp on a.idTipoArticulo=tp.idTipoArticulo
	where nombre like @filtro+'%';
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_ARTICULOS_GRILLA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_ARTICULOS_GRILLA]
AS
BEGIN
	
	SELECT idArticulo, nombre, tp.idTipoArticulo, descripcion,d.id_droga, nombreDroga, l.id_laboratorio, nombreLab,
	a.precioUnitario,stock
	from articulos a join tipoArticulos tp on a.idTipoArticulo=tp.idTipoArticulo
	JOIN laboratorios l ON a.id_laboratorio = l.id_laboratorio
	JOIN drogas d ON a.id_droga= d.id_droga;
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_ARTICULOS_POR_DROGA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_CONSULTAR_ARTICULOS_POR_DROGA]
@droga nvarchar(100)
AS
BEGIN
	
	SELECT idArticulo, nombre, tp.idTipoArticulo, descripcion,d.id_droga, nombreDroga, l.id_laboratorio, nombreLab,
	a.precioUnitario,stock
	from articulos a join tipoArticulos tp on a.idTipoArticulo=tp.idTipoArticulo
	JOIN laboratorios l ON a.id_laboratorio = l.id_laboratorio
	JOIN drogas d ON a.id_droga= d.id_droga
	where nombreDroga like '%'+@droga+'%'
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_ARTICULOS_POR_NOMBRE]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_ARTICULOS_POR_NOMBRE]
@nombre nvarchar(100)
AS
BEGIN
	
	SELECT idArticulo, nombre, tp.idTipoArticulo, descripcion,d.id_droga, nombreDroga, l.id_laboratorio, nombreLab,
	a.precioUnitario,stock
	from articulos a join tipoArticulos tp on a.idTipoArticulo=tp.idTipoArticulo
	JOIN laboratorios l ON a.id_laboratorio = l.id_laboratorio
	JOIN drogas d ON a.id_droga= d.id_droga
	where nombre like '%'+@nombre+'%'
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_CONSULTAR_CLIENTES]
AS
BEGIN
	
	select nombre,apellido,dni,telefono from clientes
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES_CON_TARJETA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_CLIENTES_CON_TARJETA]
AS
BEGIN	
select nombre,apellido,c.dni,telefono, nro_tarjeta,cod_seguridad, fecha_venc from clientes c LEFT JOIN tarjetas t ON c.dni = t.dni
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES_POR_DNI]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_CLIENTES_POR_DNI]
@DNI bigint
AS
BEGIN
	
	select nombre,apellido,dni,telefono from clientes
	where dni = @DNI
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_DETALLES_POR_ID_FACTURA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_CONSULTAR_DETALLES_POR_ID_FACTURA]
@idFactura int
as
begin
select idDetalle, a.nombre, cantidad,df.precio,montoDescontado,subtotal 
from detallesFactura df 
join articulos a on df.idArticulo=a.idArticulo
where idFactura=@idFactura 
end

GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_DROGAS_COMBO_BOX_ARTICULOS]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_DROGAS_COMBO_BOX_ARTICULOS]
AS
BEGIN	
	SELECT * FROM drogas;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FACTURA_POR_FECHA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_CONSULTAR_FACTURA_POR_FECHA]
@fechaDesde datetime,
@fechaHasta datetime
as
begin
SELECT idFactura, c.apellido + ' ' +c.nombre 'Cliente', fecha, total 
from facturas f join clientes c on f.dniCliente=c.dni
where f.fecha between @fechaDesde and @fechaHasta
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FACTURAS]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_FACTURAS]
AS
BEGIN
	SELECT idFactura, c.apellido + ' ' +c.nombre 'Nombre', fecha, total, p.descripcion
	from facturas f join clientes c on f.dniCliente=c.dni join tipoPago p on p.tipoPago=f.tipoPago
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_LABORATORIOS_COMBO_BOX_ARTICULOS]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_LABORATORIOS_COMBO_BOX_ARTICULOS]
AS
BEGIN	
	SELECT * FROM laboratorios;
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_STOCK]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CONSULTAR_STOCK]
@idArticulo int,
@stock int OUTPUT
as
begin
set @stock = (select stock from articulos where idArticulo=@idArticulo)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_TIPO_ARTICULOS_COMBO_BOX]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_CONSULTAR_TIPO_ARTICULOS_COMBO_BOX]
as
begin
	select * from tipoArticulos
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_TIPOS_USUARIO_COMBO_BOX]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_CONSULTAR_TIPOS_USUARIO_COMBO_BOX]
AS
BEGIN
	select * from  tipoUsuarios 
END	 
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_USUARIOS_GRILLA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_CONSULTAR_USUARIOS_GRILLA]
as
begin
select idUsuario,nombre,apellido,tu.descripcion 
from usuarios u join tipoUsuarios tu on u.idTipoUsuario=tu.idTipoUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CREAR_USUARIO]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_CREAR_USUARIO]
@nombreReal nvarchar(20),
@apellido nvarchar(20),
@username nvarchar(20),
@password nvarchar(20),
@tipoUsuario int
as
begin
insert into usuarios(usuario,pwd,nombre,apellido,idTipoUsuario)
values(@username,@password,@nombreReal,@apellido,@tipoUsuario)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_DETALLE]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ELIMINAR_DETALLE]
@idDetalle int
as
begin
delete from detallesFactura 
where idDetalle=@idDetalle
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_DETALLES]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ELIMINAR_DETALLES]
@idDetalle int
as
begin
delete from detallesFactura
where idDetalle=@idDetalle
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_FACTURA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure[dbo].[SP_ELIMINAR_FACTURA]
@idFactura int
as
begin
delete from detallesFactura
where idFactura=@idFactura

delete from facturas
where idFactura=@idFactura
end
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_ARTICULO]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_INSERTAR_ARTICULO]
@nombreArticulo varchar(20),
@stock int,
@precio decimal(10,2),
@tipoArticulo int
as
begin
insert into articulos(nombre,stock,precioUnitario,idTipoArticulo)
values (@nombreArticulo,@stock,@precio,@tipoArticulo)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_CLIENTE]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_INSERTAR_CLIENTE]
@DNI bigint,
@nom_cliente nvarchar(20),
@ape_cliente nvarchar(20),
@telefono bigint
as
begin
insert into CLIENTES(DNI,nombre,apellido,telefono)
values (@DNI,@nom_cliente,@ape_cliente,@telefono)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE_FACTURA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_INSERTAR_DETALLE_FACTURA] 
	@idFactura int,
	@idArticulo int,
	@cantidad int,
	@descuento int,
	@montoDescontado decimal(10,2),
	@subtotal decimal(10,2),
	@precio decimal(10,2)
AS
BEGIN
	INSERT INTO detallesFactura(idFactura, idArticulo, cantidad, descuento, montoDescontado, subtotal,precio)
    VALUES (@idFactura, @idArticulo, @cantidad, @descuento, @montoDescontado, @subtotal,@precio);
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_MAESTRO_FACTURA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_MAESTRO_FACTURA] 
	@total money,
	@tieneObraSocial bit,
	@dniCliente bigint,
	@idUsuario int,
	@tipoPago bit,
    @idFactura int output
	
AS
BEGIN
	INSERT INTO FACTURAS(fecha, total, tieneObraSocial, dniCliente,idUsuario, tipoPago)
    VALUES (GETDATE(), @total, @tieneObraSocial, @dniCliente, @idUsuario, @tipoPago);	
    set @idFactura = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_TARJETA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_INSERTAR_TARJETA]
@nro_tarjeta bigint,
@cod_seguridad int,
@fecha_venc date,
@dni bigint
as
begin
insert into TARJETAS(nro_tarjeta,cod_seguridad,fecha_venc,dni)
values (@nro_tarjeta,@cod_seguridad,@fecha_venc,@dni)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_ARTICULO]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MODIFICAR_ARTICULO]
@idArticulo int,
@nombre varchar(20),
@stock int,
@precio decimal(10,2),
@idTipoArticulo int,
@idDroga int,
@idLaboratorio int
as
begin
update articulos 
set nombre=@nombre, stock=@stock, precioUnitario=@precio, idTipoArticulo=@idTipoArticulo, id_droga=@idDroga, id_laboratorio=@idLaboratorio
WHERE idArticulo = @idArticulo
end
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_CLIENTE]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MODIFICAR_CLIENTE]
@DNI bigint,
@nombreCliente varchar(20),
@apellidoCliente varchar(20),
@telefono bigint
as
begin
update clientes 
set nombre=@nombreCliente, apellido=@apellidoCliente, telefono=@telefono
WHERE dni = @DNI
end
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_DATOS_USUARIO]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_OBTENER_DATOS_USUARIO]
@usuario nvarchar(20),
@contraseña nvarchar(20), 
@idUsuario int OUTPUT,
@nombre varchar(20) OUTPUT,
@apellido varchar(20) OUTPUT,
@tipoUsuario int OUTPUT
as
begin
Select usuario, pwd from usuarios 
where usuario=@usuario and pwd=@contraseña
set @idUsuario = (select max(idUsuario) from usuarios where usuario=@usuario and pwd=@contraseña)
set @nombre = (select nombre from usuarios where usuario=@usuario and pwd=@contraseña)
set @apellido = (select apellido from usuarios where usuario=@usuario and pwd=@contraseña)
set @tipoUsuario = (select idTipoUsuario from usuarios where usuario=@usuario and pwd=@contraseña)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_PROXIMA_FACTURA]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_PROXIMA_FACTURA]
@next int OUTPUT
AS
BEGIN
	SET @next = (SELECT MAX(idFactura)+1  FROM FACTURAS);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICAR_LOGIN]    Script Date: 04/11/2022 23:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_VERIFICAR_LOGIN]
@usuario nvarchar(20),
@contraseña nvarchar(20)
as
begin
Select usuario, pwd from usuarios 
where usuario=@usuario and pwd=@contraseña
end

GO
USE [master]
GO
ALTER DATABASE [farmatown3] SET  READ_WRITE 
GO

USE farmatown3
--TRIGGERS
go
--DESCONTAR STOCK LUEGO DE UNA VENTA
CREATE TRIGGER dbo.TRIG_DESCONTAR_STOCK ON dbo.detallesFactura
AFTER INSERT
AS
Update articulos set stock = stock-D.cantidad 
from articulos A inner join
INSERTED as D on D.idArticulo=A.idArticulo

go

--SUMAR STOCK DE LA FACTURA DESPUES DE UNA DEVOLUCION
CREATE TRIGGER dbo.TRIG_SUMAR_STOCK ON [detallesFactura]
   for Delete
   as
   Update A set a.stock=a.stock + df.cantidad
   from articulos as A inner join
   DELETED as df on df.idArticulo=A.idArticulo

go

--RESTAR AL TOTAL DE LA FACTURA DESPUES DE UNA DEVOLUCION
CREATE TRIGGER dbo.TRIG_ACTUALIZAR_TOTAL_FACTURA ON [detallesFactura]
	for Delete
	as
	Update F set F.total = F.total - df.subtotal
	from facturas F inner join
	deleted df on df.idFactura=f.idFactura

--RESTAR AL TOTAL DE LA FACTURA DESPUES DE QUITAR DETALLE	
--CREATE TRIGGER dbo.TRIG_ACTUALIZAR_TOTAL_DETALLE_LOTE ON [detalle_lote]
--	for Delete
--	as
--	Update L set L.total = L.total - dl.precio_compra * dl.cantidad_comprada
--	from lotes L inner join
--	deleted dl on dl.id_lote=L.id_lote


select * from lotes
insert into detalle_lote (idArticulo, id_lote, cantidad_comprada, precio_compra) values 
(25, 38, 1, 2500),(30,38,1,800)

CREATE FUNCTION make_sum() RETURNS TRIGGER
    AS $$
        BEGIN
            UPDATE payment
                SET total_price = (select sum(price) from basket where basket_id = new.basket_id);
            RETURN NULL;
    END;$$ LANGUAGE plpgsql;
    
CREATE TRIGGER make_sum
AFTER INSERT ON basket FOR EACH ROW EXECUTE PROCEDURE make_sum(); 
	



	create view vistaArticulosXAño as
	select a.nombre, sum(df.cantidad) as cantidad, year(f.fecha) as año
	from articulos a join detallesFactura df on df.idArticulo = a.idArticulo
	join facturas f on f.idFactura = df.idFactura
	group by a.nombre, year(f.fecha)
	
	create view vistaMasVendidosXMes as
	select a.nombre, sum(df.cantidad) as cantidad,  Cast(DATEPART(MM, f.fecha) as varchar) + '/' + CAST( DATEPART(yyyy, f.fecha) as varchar) as fecha
	from articulos a join detallesFactura df on df.idArticulo = a.idArticulo
	join facturas f on f.idFactura = df.idFactura
	group by a.nombre, fecha

	alter view vistaArticulosAVencer as
	select a.nombre, l.fecha_lote
	from lotes l join detalle_lote dl on l.id_lote = dl.id_lote
	join articulos a on a.idArticulo = dl.idArticulo
	where DATEDIFF(MONTH, l.fecha_lote, GETDATE()) >= 0

	select * from detalle_lote