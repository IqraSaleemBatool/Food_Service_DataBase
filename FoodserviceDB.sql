USE [master]
GO
/****** Object:  Database [FoodserviceDB]    Script Date: 6/27/2026 4:17:57 PM ******/
CREATE DATABASE [FoodserviceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodserviceDB', FILENAME = N'D:\Semester#05\DBS\MSSQL16.SQLEXPRESS\MSSQL\DATA\FoodserviceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodserviceDB_log', FILENAME = N'D:\Semester#05\DBS\MSSQL16.SQLEXPRESS\MSSQL\DATA\FoodserviceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FoodserviceDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodserviceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodserviceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodserviceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodserviceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodserviceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodserviceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodserviceDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FoodserviceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodserviceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodserviceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodserviceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodserviceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodserviceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodserviceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodserviceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodserviceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FoodserviceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodserviceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodserviceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodserviceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodserviceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodserviceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodserviceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodserviceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FoodserviceDB] SET  MULTI_USER 
GO
ALTER DATABASE [FoodserviceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodserviceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodserviceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodserviceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodserviceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodserviceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FoodserviceDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FoodserviceDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FoodserviceDB]
GO
/****** Object:  User [FoodUser]    Script Date: 6/27/2026 4:17:58 PM ******/
CREATE USER [FoodUser] FOR LOGIN [FoodUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [FoodUser]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/27/2026 4:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 6/27/2026 4:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NULL,
	[Available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/27/2026 4:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[RestaurantID] [int] NULL,
	[RiderID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 6/27/2026 4:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/27/2026 4:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Method] [nvarchar](30) NULL,
	[Amount] [decimal](10, 2) NULL,
	[PaymentDate] [datetime] NULL,
	[Status] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 6/27/2026 4:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[RestaurantID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Street] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[ContactNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RestaurantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rider]    Script Date: 6/27/2026 4:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rider](
	[RiderID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ContactNumber] [nvarchar](20) NULL,
	[Availability] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RiderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [CreatedAt]) VALUES (1, N'Ali', N'Raza', N'ali@example.com', N'03001234567', CAST(N'2025-10-28T15:33:05.730' AS DateTime))
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [CreatedAt]) VALUES (2, N'Sara', N'Khan', N'sara@example.com', N'03111234567', CAST(N'2025-10-28T15:33:05.730' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuItem] ON 
GO
INSERT [dbo].[MenuItem] ([ItemID], [RestaurantID], [Name], [Description], [Price], [Available]) VALUES (1, 1, N'Pepperoni Pizza', N'Large pizza with pepperoni', CAST(1200.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItem] ([ItemID], [RestaurantID], [Name], [Description], [Price], [Available]) VALUES (2, 2, N'Zinger Burger', N'Crispy zinger with fries', CAST(550.00 AS Decimal(10, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[MenuItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [RestaurantID], [RiderID], [OrderDate], [Status]) VALUES (1, 1, 1, 1, CAST(N'2025-10-28T15:33:05.767' AS DateTime), N'Delivered')
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [RestaurantID], [RiderID], [OrderDate], [Status]) VALUES (2, 2, 2, 2, CAST(N'2025-10-28T15:33:05.767' AS DateTime), N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderItem] ([OrderID], [ItemID], [Quantity]) VALUES (1, 1, 2)
GO
INSERT [dbo].[OrderItem] ([OrderID], [ItemID], [Quantity]) VALUES (2, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 
GO
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Method], [Amount], [PaymentDate], [Status]) VALUES (1, 1, N'Credit Card', CAST(2400.00 AS Decimal(10, 2)), CAST(N'2025-10-28T15:33:05.777' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Method], [Amount], [PaymentDate], [Status]) VALUES (2, 2, N'Cash', CAST(550.00 AS Decimal(10, 2)), CAST(N'2025-10-28T15:33:05.777' AS DateTime), N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurant] ON 
GO
INSERT [dbo].[Restaurant] ([RestaurantID], [Name], [Street], [City], [ContactNumber]) VALUES (1, N'Pizza Palace', N'Main Road', N'Islamabad', N'0511234567')
GO
INSERT [dbo].[Restaurant] ([RestaurantID], [Name], [Street], [City], [ContactNumber]) VALUES (2, N'Burger Hub', N'Blue Area', N'Islamabad', N'0517654321')
GO
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[Rider] ON 
GO
INSERT [dbo].[Rider] ([RiderID], [Name], [ContactNumber], [Availability]) VALUES (1, N'Ahmed', N'03451234567', 1)
GO
INSERT [dbo].[Rider] ([RiderID], [Name], [ContactNumber], [Availability]) VALUES (2, N'Bilal', N'03331234567', 1)
GO
SET IDENTITY_INSERT [dbo].[Rider] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D105344EFA4886]    Script Date: 6/27/2026 4:17:58 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurant] ([RestaurantID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurant] ([RestaurantID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([RiderID])
REFERENCES [dbo].[Rider] ([RiderID])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[MenuItem] ([ItemID])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
USE [master]
GO
ALTER DATABASE [FoodserviceDB] SET  READ_WRITE 
GO
