USE [master]
GO
/****** Object:  Database [pharmacymanagementsystem]    Script Date: 22/05/2024 11:15:32 pm ******/
CREATE DATABASE [pharmacymanagementsystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pharmacymanagementsystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\pharmacymanagementsystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pharmacymanagementsystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\pharmacymanagementsystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [pharmacymanagementsystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pharmacymanagementsystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pharmacymanagementsystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [pharmacymanagementsystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pharmacymanagementsystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pharmacymanagementsystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pharmacymanagementsystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pharmacymanagementsystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pharmacymanagementsystem] SET  MULTI_USER 
GO
ALTER DATABASE [pharmacymanagementsystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pharmacymanagementsystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pharmacymanagementsystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pharmacymanagementsystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pharmacymanagementsystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pharmacymanagementsystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [pharmacymanagementsystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [pharmacymanagementsystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [pharmacymanagementsystem]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Gender] [char](1) NULL,
	[contactNo] [varchar](15) NULL,
	[Email] [varchar](255) NULL,
	[DOB] [date] NULL,
	[qualifications] [text] NULL,
	[rating] [float] NULL,
	[workingTime] [time](7) NULL,
	[catID] [int] NULL,
	[DeptID] [int] NULL,
	[posID] [int] NULL,
	[hospital_id] [int] NULL,
	[photo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacist]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacist](
	[pharmaID] [int] IDENTITY(1,1) NOT NULL,
	[empID] [int] NULL,
	[experience] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[pharmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[pharmaID] [int] NULL,
	[Jobtype] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[staffview]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[staffview] as
select s.staffid,e.Name, e.contactNo, e.Email, e.DOB, s.Jobtype from Employee e, Staff s,Pharmacist p where e.EmpID=p.empID and p.pharmaID=s.pharmaID and catID=4
GO
/****** Object:  Table [dbo].[InventoryItems]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryItems](
	[InventoryItemID] [int] IDENTITY(1,1) NOT NULL,
	[Itemname] [varchar](255) NULL,
	[category] [varchar](255) NULL,
	[unitprice] [float] NULL,
	[stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[itemsview]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[itemsview] as
select * from inventoryitems
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ContactNo] [varchar](15) NOT NULL,
	[Email] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ContactNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CustomerView]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerView] AS
SELECT CustomerID, Name, ContactNo, Email
FROM Customer;
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[pharmaID] [int] NULL,
	[status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin_Manufacture_inventoryitem]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Manufacture_inventoryitem](
	[AdminID] [int] NULL,
	[ManufacturerID] [int] NOT NULL,
	[InventoryItemID] [int] NOT NULL,
 CONSTRAINT [PK_Admin_Manufacture_inventoryitem] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC,
	[InventoryItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin_Manufacture_inventoryitem_supplier]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Manufacture_inventoryitem_supplier](
	[AdminID] [int] NULL,
	[ManufacturerID] [int] NOT NULL,
	[InventoryItemID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_Admin_Manufacture_inventoryitem_supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC,
	[ManufacturerID] ASC,
	[InventoryItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin_Staff_Shift]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Staff_Shift](
	[AdminID] [int] NULL,
	[StaffID] [int] NOT NULL,
	[ShiftID] [int] NOT NULL,
 CONSTRAINT [PK_Admin_Staff_Shift] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC,
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[patientID] [int] NULL,
	[totalitems] [int] NULL,
	[totalamount] [int] NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_inventoryItem]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_inventoryItem](
	[InventoryItemID] [int] NOT NULL,
	[BillID] [int] NOT NULL,
 CONSTRAINT [PK_Bill_inventoryItem] PRIMARY KEY CLUSTERED 
(
	[InventoryItemID] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[catID] [int] IDENTITY(1,1) NOT NULL,
	[catName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Staff_Bill]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Staff_Bill](
	[CustomerID] [int] NULL,
	[StaffID] [int] NULL,
	[BillID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[deptID] [int] IDENTITY(1,1) NOT NULL,
	[deptName] [varchar](255) NULL,
	[hospital_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[hospital_ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[location] [varchar](255) NULL,
	[city] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[hospital_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogEntry]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEntry](
	[LogEntryID] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[EventType] [varchar](50) NULL,
	[AffectedEntity] [varchar](255) NULL,
	[OldValues] [varchar](255) NULL,
	[NewValues] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogEntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logindata]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logindata](
	[LogindataID] [int] IDENTITY(1,1) NOT NULL,
	[logindate] [date] NULL,
	[logintime] [time](7) NULL,
	[StaffID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogindataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ContactNo] [varchar](15) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[productline] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ContactNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[posID] [int] IDENTITY(1,1) NOT NULL,
	[posName] [varchar](255) NULL,
	[Salary] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[posID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[Saledate] [date] NULL,
	[QuantitySold] [int] NULL,
	[ToatalAMount] [int] NULL,
	[AdminID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_inventoryItem]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_inventoryItem](
	[InventoryItemID] [int] NOT NULL,
	[SalesID] [int] NOT NULL,
 CONSTRAINT [PK_Sales_inventoryItem] PRIMARY KEY CLUSTERED 
(
	[InventoryItemID] ASC,
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[shiftID] [int] NOT NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[shiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Shift]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Shift](
	[StaffID] [int] NOT NULL,
	[ShiftID] [int] NOT NULL,
 CONSTRAINT [PK_Staff_Shift] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC,
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ContactNo] [varchar](15) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[paymentterms] [varchar](255) NULL,
	[AdminID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ContactNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userlogin]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlogin](
	[username] [nchar](10) NULL,
	[userpassward] [nchar](10) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([pharmaID])
REFERENCES [dbo].[Pharmacist] ([pharmaID])
GO
ALTER TABLE [dbo].[Admin_Manufacture_inventoryitem]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Admin_Manufacture_inventoryitem]  WITH CHECK ADD FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItems] ([InventoryItemID])
GO
ALTER TABLE [dbo].[Admin_Manufacture_inventoryitem]  WITH CHECK ADD FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Admin_Manufacture_inventoryitem_supplier]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Admin_Manufacture_inventoryitem_supplier]  WITH CHECK ADD FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItems] ([InventoryItemID])
GO
ALTER TABLE [dbo].[Admin_Manufacture_inventoryitem_supplier]  WITH CHECK ADD FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Admin_Manufacture_inventoryitem_supplier]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Admin_Staff_Shift]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Admin_Staff_Shift]  WITH CHECK ADD FOREIGN KEY([ShiftID])
REFERENCES [dbo].[Shifts] ([shiftID])
GO
ALTER TABLE [dbo].[Admin_Staff_Shift]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Bill_inventoryItem]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[Bill_inventoryItem]  WITH CHECK ADD FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItems] ([InventoryItemID])
GO
ALTER TABLE [dbo].[Customer_Staff_Bill]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[Customer_Staff_Bill]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_Staff_Bill]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([hospital_id])
REFERENCES [dbo].[Hospital] ([hospital_ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([catID])
REFERENCES [dbo].[Category] ([catID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([deptID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([hospital_id])
REFERENCES [dbo].[Hospital] ([hospital_ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([posID])
REFERENCES [dbo].[Position] ([posID])
GO
ALTER TABLE [dbo].[Logindata]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD FOREIGN KEY([empID])
REFERENCES [dbo].[Employee] ([EmpID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Sales_inventoryItem]  WITH CHECK ADD FOREIGN KEY([InventoryItemID])
REFERENCES [dbo].[InventoryItems] ([InventoryItemID])
GO
ALTER TABLE [dbo].[Sales_inventoryItem]  WITH CHECK ADD FOREIGN KEY([SalesID])
REFERENCES [dbo].[Sales] ([SalesID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([pharmaID])
REFERENCES [dbo].[Pharmacist] ([pharmaID])
GO
ALTER TABLE [dbo].[Staff_Shift]  WITH CHECK ADD FOREIGN KEY([ShiftID])
REFERENCES [dbo].[Shifts] ([shiftID])
GO
ALTER TABLE [dbo].[Staff_Shift]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
/****** Object:  StoredProcedure [dbo].[AddInventoryItem]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddInventoryItem]
    @ItemName NVARCHAR(100),
    @Category NVARCHAR(100),
    @UnitPrice DECIMAL(10, 2),
    @Stock INT
AS
BEGIN
    INSERT INTO InventoryItems (ItemName, Category, UnitPrice, Stock)
    VALUES (@ItemName, @Category, @UnitPrice, @Stock);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddManufacturer]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddManufacturer]
    @Name NVARCHAR(100),
    @Contactno NVARCHAR(50),
    @Email NVARCHAR(500),
	@productline NVARCHAR(1000)
AS
BEGIN
    INSERT INTO Manufacturer ( Name, Contactno, Email,productline)
    VALUES ( @Name, @Contactno, @Email, @productline);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddSupplier]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSupplier]
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @ContactNo NVARCHAR(50),
    @PaymentTerms NVARCHAR(100)
AS
BEGIN
    INSERT INTO Supplier (Name, Email, ContactNo, PaymentTerms)
    VALUES (@Name, @Email, @ContactNo, @PaymentTerms);
END;
GO
/****** Object:  StoredProcedure [dbo].[EditCustomer]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditCustomer]
    @CustomerID INT,
    @Name NVARCHAR(100),
    @ContactNo NVARCHAR(50),
    @Email NVARCHAR(100)
AS
BEGIN
    UPDATE Customer
    SET Name = @Name,
        ContactNo = @ContactNo,
        Email = @Email
    WHERE CustomerID = @CustomerID;
END;
GO
/****** Object:  StoredProcedure [dbo].[EditManufacturer]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditManufacturer]
    @ManufacturerID INT,
    @Name NVARCHAR(100),
    @ContactNo NVARCHAR(50),
    @Email NVARCHAR(100),
    @ProductLine NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Manufacturer
    SET
        Name = @Name,
        ContactNo = @ContactNo,
        Email = @Email,
        ProductLine = @ProductLine
    WHERE
        ManufacturerID = @ManufacturerID;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertBillCustomerStaff]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBillCustomerStaff](
    @name VARCHAR(255),
    @contactNo VARCHAR(20),
    @email VARCHAR(255),
    @totalItems INT,
    @totalAmount DECIMAL(10, 2),
    @date DATE
)
AS
BEGIN
    DECLARE @customerID INT;
    DECLARE @staffID INT;

    -- Insert into customer table
    INSERT INTO customer (Name, ContactNo, email) 
    VALUES (@name, @contactNo, @email);

    -- Get the ID of the last inserted customer
    SET @customerID = SCOPE_IDENTITY();

    -- Get the last added staffID from the logindata table
    SELECT TOP 1 @staffID = StaffID 
    FROM logindata 
    ORDER BY StaffID DESC;

    -- Insert into bill table
    DECLARE @billID INT;
    INSERT INTO bill (patientID, totalitems, totalamount, date) 
    VALUES (@customerID, @totalItems, @totalAmount, @date);
    
    -- Get the ID of the last inserted bill
    SET @billID = SCOPE_IDENTITY();

    -- Insert into Customer_Staff_Bill table
    INSERT INTO Customer_Staff_Bill (CustomerID, StaffID, BillID)
    VALUES (@customerID, @staffID, @billID);
END;
GO
/****** Object:  StoredProcedure [dbo].[Removeinventoryitem]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Removeinventoryitem]
    @InventoryItemID INT
AS
BEGIN
    -- Check if the item exists
    IF EXISTS (SELECT 1 FROM InventoryItems WHERE InventoryItemID = @InventoryItemID)
    BEGIN
        -- Delete the item from the Inventory table
        DELETE FROM Inventoryitems WHERE InventoryItemID = @InventoryItemID;
    END
    ELSE
    BEGIN
        -- Raise an error if the item does not exist
        RAISERROR('Item with ID %d does not exist.', 16, 1, @InventoryItemID);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[RemoveManufacturer]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveManufacturer]
    @ManufacturerID INT
AS
BEGIN
    DELETE FROM Manufacturer
    WHERE ManufacturerID = @ManufacturerID;
END;
GO
/****** Object:  StoredProcedure [dbo].[RemoveSupplier]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveSupplier]
    @SupplierID INT
AS
BEGIN
    DELETE FROM Supplier
    WHERE SupplierID = @SupplierID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplier]    Script Date: 22/05/2024 11:15:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSupplier]
    @SupplierID INT,
    @Name NVARCHAR(50),
    @ContactNo NVARCHAR(20),
    @Email NVARCHAR(50),
    @PaymentTerms NVARCHAR(100)
AS
BEGIN
    UPDATE Supplier
    SET Name = @Name,
        ContactNo = @ContactNo,
        Email = @Email,
        PaymentTerms = @PaymentTerms
    WHERE SupplierID = @SupplierID;
END;
GO
USE [master]
GO
ALTER DATABASE [pharmacymanagementsystem] SET  READ_WRITE 
GO
