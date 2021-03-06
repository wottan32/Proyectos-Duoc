create database "FactoryPC"
go
alter authorization on DATABASE::CentroMedico to sa
GO
USE [FactoryPC]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 10/25/2015 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[codProducto] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [bigint] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[codProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 10/25/2015 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[codCarrito] [int] NOT NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[codCarrito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/25/2015 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[rut] [varchar](50) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 10/25/2015 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venta](
	[codVenta] [int] NOT NULL,
	[total] [bigint] NOT NULL,
	[fechaVenta] [datetime] NOT NULL,
	[codCarrito] [int] NOT NULL,
	[rutUsuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[codVenta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductosXCarrito]    Script Date: 10/25/2015 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductosXCarrito](
	[codProducto] [int] NOT NULL,
	[codCarrito] [int] NOT NULL,
	[codLista] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_ProductosXCarrito] PRIMARY KEY CLUSTERED 
(
	[codLista] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_ProductosXCarrito_codCarrito]    Script Date: 10/25/2015 23:34:35 ******/
ALTER TABLE [dbo].[ProductosXCarrito]  WITH CHECK ADD  CONSTRAINT [FK_ProductosXCarrito_codCarrito] FOREIGN KEY([codCarrito])
REFERENCES [dbo].[Carrito] ([codCarrito])
GO
ALTER TABLE [dbo].[ProductosXCarrito] CHECK CONSTRAINT [FK_ProductosXCarrito_codCarrito]
GO
/****** Object:  ForeignKey [FK_ProductosXCarrito_codProducto]    Script Date: 10/25/2015 23:34:35 ******/
ALTER TABLE [dbo].[ProductosXCarrito]  WITH CHECK ADD  CONSTRAINT [FK_ProductosXCarrito_codProducto] FOREIGN KEY([codProducto])
REFERENCES [dbo].[Producto] ([codProducto])
GO
ALTER TABLE [dbo].[ProductosXCarrito] CHECK CONSTRAINT [FK_ProductosXCarrito_codProducto]
GO
/****** Object:  ForeignKey [FK_Venta_codCarrito]    Script Date: 10/25/2015 23:34:35 ******/
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_codCarrito] FOREIGN KEY([codCarrito])
REFERENCES [dbo].[Carrito] ([codCarrito])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_codCarrito]
GO
/****** Object:  ForeignKey [FK_Venta_rutUsuario]    Script Date: 10/25/2015 23:34:35 ******/
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_rutUsuario] FOREIGN KEY([rutUsuario])
REFERENCES [dbo].[Usuario] ([rut])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_rutUsuario]
GO
