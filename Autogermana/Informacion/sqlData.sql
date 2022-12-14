USE [master]
GO
/****** Object:  Database [dbproductos]    Script Date: 9/8/2022 7:40:29 PM ******/
CREATE DATABASE [dbproductos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbproductos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DESARROLLO\MSSQL\DATA\dbproductos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbproductos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DESARROLLO\MSSQL\DATA\dbproductos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbproductos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbproductos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbproductos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbproductos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbproductos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbproductos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbproductos] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbproductos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbproductos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbproductos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbproductos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbproductos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbproductos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbproductos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbproductos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbproductos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbproductos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbproductos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbproductos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbproductos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbproductos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbproductos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbproductos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbproductos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbproductos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbproductos] SET  MULTI_USER 
GO
ALTER DATABASE [dbproductos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbproductos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbproductos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbproductos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbproductos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbproductos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbproductos] SET QUERY_STORE = OFF
GO
USE [dbproductos]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 9/8/2022 7:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 9/8/2022 7:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[codigo] [varchar](64) NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio_venta] [decimal](11, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[imagen] [varbinary](max) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [estado]) VALUES (1, N'VideoJuegos', N'Videojuegos de computador', 0)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [estado]) VALUES (2, N'Computadores', N'Computadores de escritorio y portatiles', 1)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [estado]) VALUES (3, N'Utilies escolares ', N'Elementos academicos', 1)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [estado]) VALUES (4, N'Higiene Hogar', N'Productos de higiene para el hogar', 1)
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([idproducto], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [imagen], [estado]) VALUES (1, 1, N'VJ001', N'Call Of Duty', CAST(98000.00 AS Decimal(11, 2)), 15, N'Juego de acción', NULL, 1)
INSERT [dbo].[producto] ([idproducto], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [imagen], [estado]) VALUES (2, 3, N'UE001', N'Lapicero', CAST(1200.00 AS Decimal(11, 2)), 50, N'Util para escribir o dibujar', NULL, 1)
INSERT [dbo].[producto] ([idproducto], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [imagen], [estado]) VALUES (3, 3, N'UE002', N'Borrador', CAST(400.00 AS Decimal(11, 2)), 30, N'Util para borrar lapiz', NULL, 1)
INSERT [dbo].[producto] ([idproducto], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [imagen], [estado]) VALUES (4, 2, N'C001', N'Portatil Hp ', CAST(2300000.00 AS Decimal(11, 2)), 10, N'Computador portatil ', NULL, 1)
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__72AFBCC6CF48280D]    Script Date: 9/8/2022 7:40:29 PM ******/
ALTER TABLE [dbo].[categoria] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__producto__72AFBCC62C10CAF4]    Script Date: 9/8/2022 7:40:29 PM ******/
ALTER TABLE [dbo].[producto] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
USE [master]
GO
ALTER DATABASE [dbproductos] SET  READ_WRITE 
GO
