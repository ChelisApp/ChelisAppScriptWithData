USE [master]
GO
/****** Object:  Database [ChelisA]    Script Date: 10-Nov-20 3:11:41 PM ******/
CREATE DATABASE [ChelisA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChelisA', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ChelisA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ChelisA_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ChelisA_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChelisA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChelisA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChelisA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChelisA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChelisA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChelisA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChelisA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChelisA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChelisA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ChelisA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChelisA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChelisA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChelisA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChelisA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChelisA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChelisA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChelisA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChelisA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChelisA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChelisA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChelisA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChelisA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChelisA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChelisA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChelisA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChelisA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChelisA] SET  MULTI_USER 
GO
ALTER DATABASE [ChelisA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChelisA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChelisA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChelisA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ChelisA]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[TransactionType] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[TransactionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerName] [nvarchar](100) NOT NULL,
	[CustomerType] [nvarchar](50) NULL,
	[RegistrationType] [nvarchar](50) NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
	[ContactName] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[State] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[OtherPhone] [nvarchar](20) NULL,
	[Marketer] [nvarchar](50) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inward]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inward](
	[InwardId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[QuantityReturned] [int] NULL,
	[OutwardId] [decimal](18, 0) NOT NULL,
	[GRNNumber] [nvarchar](50) NULL,
	[LocationName] [nvarchar](100) NOT NULL,
	[ReturnInReference] [nvarchar](50) NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Inward] PRIMARY KEY CLUSTERED 
(
	[InwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationName] [nvarchar](100) NOT NULL,
	[Area] [nvarchar](100) NULL,
	[Branch] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outward]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outward](
	[OutwardId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[Quantity] [int] NULL,
	[SRONumber] [nvarchar](50) NULL,
	[LocationName] [nvarchar](100) NOT NULL,
	[Marketer] [nvarchar](50) NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Outward] PRIMARY KEY CLUSTERED 
(
	[OutwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[ProductQuantity] [int] NULL,
	[ProductEdition] [nvarchar](20) NULL,
	[CopyrightDate] [nvarchar](20) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[OtherPhone] [nvarchar](20) NULL,
	[ContactName] [nvarchar](100) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
	[SaleInvNumber] [nvarchar](50) NULL,
	[TransactionType] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalePayment]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePayment](
	[SalePaymentId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[SaleInvNumber] [nvarchar](50) NOT NULL,
	[SaleTotalAmount] [decimal](18, 2) NULL,
	[AmountPaid] [decimal](18, 2) NULL,
	[PaymentDetails] [nvarchar](100) NULL,
	[PaymentConfirmedBy] [nvarchar](50) NULL,
	[PaymentReference] [nvarchar](50) NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_SalePayment] PRIMARY KEY CLUSTERED 
(
	[SalePaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleTotal]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleTotal](
	[SaleInvNumber] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[AmountDue] [decimal](18, 2) NULL,
	[InvoiceTreatedBy] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_SaleTotal] PRIMARY KEY CLUSTERED 
(
	[SaleInvNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[StockQuantity] [int] NULL,
	[SRONumber] [nvarchar](50) NULL,
	[SaleReturnNumber] [nvarchar](50) NULL,
	[LocationName] [nvarchar](100) NOT NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[Comment] [nvarchar](100) NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10-Nov-20 3:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](100) NOT NULL,
	[AdminCode] [nvarchar](100) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Activity] ([TransactionType], [Category]) VALUES (N'Cash Sales', N'NIBF Promo')
INSERT [dbo].[Activity] ([TransactionType], [Category]) VALUES (N'Data Entry Errors', N'Misclassification')
INSERT [dbo].[Activity] ([TransactionType], [Category]) VALUES (N'School Order', N'Regular')
INSERT [dbo].[Customer] ([CustomerName], [CustomerType], [RegistrationType], [RegistrationNumber], [ContactName], [Address], [State], [Phone], [Email], [OtherPhone], [Marketer]) VALUES (N'ABC', N'School', N'Credit', N'CBL/D00L/AZ123', N'Mr Sheun', N'55 Constitution Road', N'Kaduna', N'08065106677', N'abc@info.com', N'09088776655', N'Stephen')
INSERT [dbo].[Customer] ([CustomerName], [CustomerType], [RegistrationType], [RegistrationNumber], [ContactName], [Address], [State], [Phone], [Email], [OtherPhone], [Marketer]) VALUES (N'Abik Model School', N'School', N'Credit', N'CLB/DOOL/ZA67', N'Mrs. Saleh', N'Agua Along PVC Trikania, Kaduna', N'Kaduna', N'07062692121', N'abik@gmail.com', N'08076457645', N'Stephen')
INSERT [dbo].[Customer] ([CustomerName], [CustomerType], [RegistrationType], [RegistrationNumber], [ContactName], [Address], [State], [Phone], [Email], [OtherPhone], [Marketer]) VALUES (N'Berida Educational Academy', N'School', N'Credit', N'CBL/DOOL/ZA98', N'Mr. Zenith', N'Behind Maraban Rido Police Station, Kaduna', N'Kaduna', N'08027470965', N'berida@info.edu', N'', N'Stephen')
INSERT [dbo].[Customer] ([CustomerName], [CustomerType], [RegistrationType], [RegistrationNumber], [ContactName], [Address], [State], [Phone], [Email], [OtherPhone], [Marketer]) VALUES (N'Challawa Schools', N'School', N'Cash', N'', N'Mrs. Shola', N'Gwari avenue,Barnawa, Kaduna', N'Kaduna', N'07053911091', N'challawa@gmail.com', N'09087654321', N'Stephen')
INSERT [dbo].[Customer] ([CustomerName], [CustomerType], [RegistrationType], [RegistrationNumber], [ContactName], [Address], [State], [Phone], [Email], [OtherPhone], [Marketer]) VALUES (N'First School', N'School', N'Credit', N'CBL/DOOL/ZA99', N'Mr. Adamu', N'4 Constitution Road', N'Kaduna', N'08076547654', N'fisch@info.com', N'09076777677', N'Stephen')
INSERT [dbo].[Customer] ([CustomerName], [CustomerType], [RegistrationType], [RegistrationNumber], [ContactName], [Address], [State], [Phone], [Email], [OtherPhone], [Marketer]) VALUES (N'Great School', N'School', N'Credit', N'CBL/DOOL/ZA34', N'Mr. Sule', N'2 Constitution Road', N'Kaduna', N'08032890916', N'gresch@info.com', N'0907656574', N'Stephen')
INSERT [dbo].[Customer] ([CustomerName], [CustomerType], [RegistrationType], [RegistrationNumber], [ContactName], [Address], [State], [Phone], [Email], [OtherPhone], [Marketer]) VALUES (N'Temple School', N'School', N'Credit', N'CLB/DOOL/Z577', N'Mrs Umoh', N'23 Constitution Road', N'Kaduna', N'0807654876', N'temple@info.com', N'09088776655', N'Stephen')
SET IDENTITY_INSERT [dbo].[Inward] ON 

INSERT [dbo].[Inward] ([InwardId], [ProductISBN], [ProductName], [PublisherName], [QuantityReturned], [OutwardId], [GRNNumber], [LocationName], [ReturnInReference], [ApprovedBy], [Date]) VALUES (CAST(1 AS Decimal(18, 0)), N'9781870946070', N'The Phonics Handbook', N'Jolly Learning', 90, CAST(1 AS Decimal(18, 0)), N'67588499', N'Main Store', N'65757573', N'Mr. Jimoh', CAST(N'2020-10-25' AS Date))
INSERT [dbo].[Inward] ([InwardId], [ProductISBN], [ProductName], [PublisherName], [QuantityReturned], [OutwardId], [GRNNumber], [LocationName], [ReturnInReference], [ApprovedBy], [Date]) VALUES (CAST(2 AS Decimal(18, 0)), N'978-1-40-8502341', N'International Comprehension Student Book 1', N'Oxford', 70, CAST(3 AS Decimal(18, 0)), N'78659', N'Shop Floor', N'6758333', N'Kunle', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Inward] ([InwardId], [ProductISBN], [ProductName], [PublisherName], [QuantityReturned], [OutwardId], [GRNNumber], [LocationName], [ReturnInReference], [ApprovedBy], [Date]) VALUES (CAST(3 AS Decimal(18, 0)), N'9780007300884', N'Collins Easy Learning Age 3-5', N'Collins Publication', 10, CAST(4 AS Decimal(18, 0)), N'876543211', N'Sample', N'756113838', N'Mr. Jimoh', CAST(N'2020-10-26' AS Date))
SET IDENTITY_INSERT [dbo].[Inward] OFF
INSERT [dbo].[Location] ([LocationName], [Area], [Branch], [State]) VALUES (N'Main Store', N'Lagos', N'Surulere', N'Lagos')
INSERT [dbo].[Location] ([LocationName], [Area], [Branch], [State]) VALUES (N'Reversals', N'Kaduna', N'Kaduna', N'Kaduna')
INSERT [dbo].[Location] ([LocationName], [Area], [Branch], [State]) VALUES (N'Sample', N'Lagos', N'Surulere', N'Lagos')
INSERT [dbo].[Location] ([LocationName], [Area], [Branch], [State]) VALUES (N'Shop Floor', N'Lagos', N'Surulere', N'Lagos')
SET IDENTITY_INSERT [dbo].[Outward] ON 

INSERT [dbo].[Outward] ([OutwardId], [ProductISBN], [ProductName], [PublisherName], [Quantity], [SRONumber], [LocationName], [Marketer], [ApprovedBy], [Date]) VALUES (CAST(1 AS Decimal(18, 0)), N'9781870946070', N'The Phonics Handbook', N'Jolly Learning', 0, N'565757', N'Sample', N'Stephen', N'Mr. Jimoh', CAST(N'2020-10-25' AS Date))
INSERT [dbo].[Outward] ([OutwardId], [ProductISBN], [ProductName], [PublisherName], [Quantity], [SRONumber], [LocationName], [Marketer], [ApprovedBy], [Date]) VALUES (CAST(2 AS Decimal(18, 0)), N'9781316610985', N'Cambridge Primary Skills Builder Activity Book 1', N'Collins Publication', 33, N'67583', N'Reversals', N'', N'Kunle', CAST(N'2020-10-24' AS Date))
INSERT [dbo].[Outward] ([OutwardId], [ProductISBN], [ProductName], [PublisherName], [Quantity], [SRONumber], [LocationName], [Marketer], [ApprovedBy], [Date]) VALUES (CAST(3 AS Decimal(18, 0)), N'978-1-40-8502341', N'International Comprehension Student Book 1', N'Oxford', 7, N'76599333', N'Main Store', N'Stephen', N'Mr. Jimoh', CAST(N'2020-10-24' AS Date))
INSERT [dbo].[Outward] ([OutwardId], [ProductISBN], [ProductName], [PublisherName], [Quantity], [SRONumber], [LocationName], [Marketer], [ApprovedBy], [Date]) VALUES (CAST(4 AS Decimal(18, 0)), N'9780007300884', N'Collins Easy Learning Reading Age 3-5', N'Collins Publication', 13, N'8764322', N'Shop Floor', N'Uche', N'Uchenna Jimoh', CAST(N'2020-10-24' AS Date))
SET IDENTITY_INSERT [dbo].[Outward] OFF
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'90887657007007', N'This Book', N'Letts', CAST(2020.00 AS Decimal(18, 2)), 20, N'2012', N'2011')
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'9780007300884', N'Collins Easy Learning Reading Age 3–5', N'Collins Publication', CAST(1100.00 AS Decimal(18, 2)), 111, N'2019', N'2011')
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'9780007436736', N'Collins Primary Focus: Handwriting Workbook A', N'Oxford', CAST(1320.00 AS Decimal(18, 2)), 114, N'2019', N'2011')
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'9781316610985', N'Cambridge Primary Science Skills Builder Activity Book 1', N'Collins Publication', CAST(1970.00 AS Decimal(18, 2)), 115, N'2020', N'2017')
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'9781334678098008', N'Word Book', N'Jolly Learning', CAST(2000.00 AS Decimal(18, 2)), 90, N'2019', N'2017')
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'978-1-40-8502341', N'International Comprehension Student Book1', N'Oxford', CAST(1930.00 AS Decimal(18, 2)), 83, N'2020', N'2016')
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'9781844141722', N'Jolly Phonics Magnetic Letters (tub of 106)* ', N'Jolly Learning', CAST(820.00 AS Decimal(18, 2)), 130, N'2020', N'2017')
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'9781870946070', N'The Phonics Handbook', N'Jolly Learning', CAST(17030.00 AS Decimal(18, 2)), 55, N'2020', N'2016')
INSERT [dbo].[Product] ([ProductISBN], [ProductName], [PublisherName], [SellingPrice], [ProductQuantity], [ProductEdition], [CopyrightDate]) VALUES (N'988776534090', N'Colour Me', N'Letts', CAST(400.00 AS Decimal(18, 2)), 20, N'2017', N'2015')
INSERT [dbo].[Publisher] ([PublisherName], [Address], [Country], [Phone], [Email], [OtherPhone], [ContactName]) VALUES (N'Collins Publication', N'Leeds Street 2 point', N'Uk', N'+423217658', N'collins@info.ollins', N'+400995585', N'Mr. Ollins')
INSERT [dbo].[Publisher] ([PublisherName], [Address], [Country], [Phone], [Email], [OtherPhone], [ContactName]) VALUES (N'Jolly Learning', N'Beshire', N'Uk', N'+4347865', N'jolly@learning.com', N'+47776453456', N'Mr. Earnin')
INSERT [dbo].[Publisher] ([PublisherName], [Address], [Country], [Phone], [Email], [OtherPhone], [ContactName]) VALUES (N'Letts', N'Common Wealth', N'Uk', N'+4565732224', N'letts@gmail.com', N'', N'Mr. Sholetts')
INSERT [dbo].[Publisher] ([PublisherName], [Address], [Country], [Phone], [Email], [OtherPhone], [ContactName]) VALUES (N'Oxford', N'Unstead', N'Uk', N'+4567458', N'oxford@info.oxford.com', N'+457789234', N'Mr. Ford')
INSERT [dbo].[Publisher] ([PublisherName], [Address], [Country], [Phone], [Email], [OtherPhone], [ContactName]) VALUES (N'Schofield and Sims', N'Yorkshire', N'Uk', N'+499956572', N's&s@Sims.com', N'+455768543', N'Mr. Sims')
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(1 AS Decimal(18, 0)), N'Abik Model School', N'9781870946070', N'The Phonics Handbook', N'Jolly Learning', CAST(17030.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 30, CAST(408720.00 AS Decimal(18, 2)), N'23456789', N'Cash Sales', CAST(N'2020-10-23' AS Date))
INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(2 AS Decimal(18, 0)), N'Berida Educational Academy', N'9781316610985', N'Cambridge Primary Science Skill Builder Activity Book 1', N'Collins Publication', CAST(1960.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 55, CAST(86240.00 AS Decimal(18, 2)), N'78657573', N'School Order', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(3 AS Decimal(18, 0)), N'Challawa Schools', N'9781870946070', N'The Phonics Handbook', N'Jolly Learning', CAST(17030.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 70, CAST(953680.00 AS Decimal(18, 2)), N'23774557573', N'Data Entry Errors', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(4 AS Decimal(18, 0)), N'Abik Model School', N'978-1-40-8502341', N'International Comprehension Student Book 1', N'Oxford', CAST(1930.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 10, CAST(15440.00 AS Decimal(18, 2)), N'876543567', N'Cash Sales', CAST(N'2020-10-27' AS Date))
INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(5 AS Decimal(18, 0)), N'Challawa Schools', N'9780007436736', N'Collins Primary Focus- Handwriting Workbook 1', N'Oxford', CAST(1320.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 30, CAST(31680.00 AS Decimal(18, 2)), N'998877098', N'Cash Sales', CAST(N'2020-10-27' AS Date))
INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(6 AS Decimal(18, 0)), N'Berida Educational Academy', N'9781870946070', N'Jolly Phonics Handbook', N'Jolly Learning', CAST(17030.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 20, CAST(272480.00 AS Decimal(18, 2)), N'008765', N'Cash Sales', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(7 AS Decimal(18, 0)), N'Abik Model School', N'9781334678098008', N'Word Book', N'Jolly Learning', CAST(2000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 32, CAST(51200.00 AS Decimal(18, 2)), N'088006', N'Cash Sales', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(8 AS Decimal(18, 0)), N'Great School', N'988776534090', N'Color Me', N'Letts', CAST(400.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 179, CAST(57280.00 AS Decimal(18, 2)), N'00111', N'Cash Sales', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[Sale] ([SaleId], [CustomerName], [ProductISBN], [ProductName], [PublisherName], [SellingPrice], [Discount], [Quantity], [Amount], [SaleInvNumber], [TransactionType], [Date]) VALUES (CAST(9 AS Decimal(18, 0)), N'ABC', N'90887657007007', N'This Book', N'Letts', CAST(2020.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 179, CAST(289264.00 AS Decimal(18, 2)), N'000123', N'Cash Sales', CAST(N'2020-11-06' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
SET IDENTITY_INSERT [dbo].[SalePayment] ON 

INSERT [dbo].[SalePayment] ([SalePaymentId], [CustomerName], [SaleInvNumber], [SaleTotalAmount], [AmountPaid], [PaymentDetails], [PaymentConfirmedBy], [PaymentReference], [Date]) VALUES (CAST(1 AS Decimal(18, 0)), N'Abik Model School', N'23456789', CAST(40870.00 AS Decimal(18, 2)), CAST(40000.00 AS Decimal(18, 2)), N'Transfer', N'Mr. Jimoh', N'Reciept 233233', CAST(N'2020-10-24' AS Date))
INSERT [dbo].[SalePayment] ([SalePaymentId], [CustomerName], [SaleInvNumber], [SaleTotalAmount], [AmountPaid], [PaymentDetails], [PaymentConfirmedBy], [PaymentReference], [Date]) VALUES (CAST(2 AS Decimal(18, 0)), N'Berida Educational Academy', N'008765', CAST(272480.00 AS Decimal(18, 2)), CAST(200000.00 AS Decimal(18, 2)), N'transfer', N'Mr. Jimoh', N'', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[SalePayment] ([SalePaymentId], [CustomerName], [SaleInvNumber], [SaleTotalAmount], [AmountPaid], [PaymentDetails], [PaymentConfirmedBy], [PaymentReference], [Date]) VALUES (CAST(3 AS Decimal(18, 0)), N'Great School', N'00111', CAST(57280.00 AS Decimal(18, 2)), CAST(57000.00 AS Decimal(18, 2)), N'Transfer', N'Paul', N'', CAST(N'2020-11-07' AS Date))
INSERT [dbo].[SalePayment] ([SalePaymentId], [CustomerName], [SaleInvNumber], [SaleTotalAmount], [AmountPaid], [PaymentDetails], [PaymentConfirmedBy], [PaymentReference], [Date]) VALUES (CAST(4 AS Decimal(18, 0)), N'ABC', N'000123', CAST(289264.00 AS Decimal(18, 2)), CAST(200000.00 AS Decimal(18, 2)), N'Transfer', N'Mr. Paul', N'', CAST(N'2020-11-07' AS Date))
SET IDENTITY_INSERT [dbo].[SalePayment] OFF
INSERT [dbo].[SaleTotal] ([SaleInvNumber], [CustomerName], [AmountDue], [InvoiceTreatedBy], [Date]) VALUES (N'000123', N'ABC', CAST(89264.00 AS Decimal(18, 2)), N'Zainab', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[SaleTotal] ([SaleInvNumber], [CustomerName], [AmountDue], [InvoiceTreatedBy], [Date]) VALUES (N'00111', N'Great School', CAST(280.00 AS Decimal(18, 2)), N'Zainab', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[SaleTotal] ([SaleInvNumber], [CustomerName], [AmountDue], [InvoiceTreatedBy], [Date]) VALUES (N'008765', N'Berida Educational Academy', CAST(72480.00 AS Decimal(18, 2)), N'Zainab', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[SaleTotal] ([SaleInvNumber], [CustomerName], [AmountDue], [InvoiceTreatedBy], [Date]) VALUES (N'088006', N'Abik Model School', CAST(51200.00 AS Decimal(18, 2)), N'Zainab', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[SaleTotal] ([SaleInvNumber], [CustomerName], [AmountDue], [InvoiceTreatedBy], [Date]) VALUES (N'23456789', N'Abik Model School', CAST(870.00 AS Decimal(18, 2)), N'Amina', CAST(N'2020-10-23' AS Date))
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(1 AS Decimal(18, 0)), N'9781870946070', N'The Phonics Handbook', N'Jolly Learning', 30, N'5756y57765', N'', N'Main Store', N'Mr. Jimoh', N'Okay', CAST(N'2020-10-25' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(2 AS Decimal(18, 0)), N'9781844141722', N'Jolly Phonics Magnetic Letters (tub of 106)* ', N'Jolly Learning', 30, N'456789', N'', N'Main Store', N'Mr. Jimoh', N'Okay', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(3 AS Decimal(18, 0)), N'9781316610985', N'Jolly Phonics Magnetic Letters (tub of 106)* ', N'Jolly Learning', 60, N'675433', N'', N'Sample', N'Mr. Jimoh', N'oka', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(4 AS Decimal(18, 0)), N'9781316610985', N'Jolly Phonics Magnetic Letters (tub of 106)* ', N'Jolly Learning', 20, N'6755522', N'', N'Shop Floor', N'Kunle', N'okay', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(5 AS Decimal(18, 0)), N'9781870946070', N'The Phonics Handbook', N'Jolly Learning', 45, N'475623', N'', N'Sample', N'', N'', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(6 AS Decimal(18, 0)), N'9781316610985', N'The Phonics Handbook', N'Jolly Learning', 23, N'765889', N'', N'Shop Floor', N'', N'', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(7 AS Decimal(18, 0)), N'9780007300884', N'Collins Easy Learning Reading Age 3-5', N'Collins Publication', 24, N'7568478', N'', N'Sample', N'Joshua', N'right', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(8 AS Decimal(18, 0)), N'9780007436736', N'Collins Primary Focus- Handwriting Workbook A', N'Oxford', 44, N'44577642', N'', N'Sample', N'Kals', N'yes', CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(9 AS Decimal(18, 0)), N'9781334678098008', N'Word Book', N'Jolly Learning', 22, N'7689', N'', N'Main Store', N'Mr. Jimoh', N'Not Okay', CAST(N'2020-11-07' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(10 AS Decimal(18, 0)), N'988776534090', N'Color Me', N'Letts', 99, N'6667775', N'', N'Shop Floor', N'Mr. Jimoh', N'Not Okay', CAST(N'2020-11-06' AS Date))
INSERT [dbo].[Stock] ([StockId], [ProductISBN], [ProductName], [PublisherName], [StockQuantity], [SRONumber], [SaleReturnNumber], [LocationName], [ApprovedBy], [Comment], [Date]) VALUES (CAST(11 AS Decimal(18, 0)), N'90887657007007', N'This Book', N'Letts', 99, N'76555', N'', N'Main Store', N'Mr. Jimoh', N'okay', CAST(N'2020-11-06' AS Date))
SET IDENTITY_INSERT [dbo].[Stock] OFF
INSERT [dbo].[User] ([UserName], [PassWord], [AdminCode]) VALUES (N'me', N'itisme', NULL)
INSERT [dbo].[User] ([UserName], [PassWord], [AdminCode]) VALUES (N'us', N'itis', N'itisus')
ALTER TABLE [dbo].[Inward]  WITH CHECK ADD  CONSTRAINT [FK_Inward_LocationName] FOREIGN KEY([LocationName])
REFERENCES [dbo].[Location] ([LocationName])
GO
ALTER TABLE [dbo].[Inward] CHECK CONSTRAINT [FK_Inward_LocationName]
GO
ALTER TABLE [dbo].[Inward]  WITH CHECK ADD  CONSTRAINT [FK_Inward_OutwardId] FOREIGN KEY([OutwardId])
REFERENCES [dbo].[Outward] ([OutwardId])
GO
ALTER TABLE [dbo].[Inward] CHECK CONSTRAINT [FK_Inward_OutwardId]
GO
ALTER TABLE [dbo].[Inward]  WITH CHECK ADD  CONSTRAINT [FK_Inward_ProductISBN] FOREIGN KEY([ProductISBN])
REFERENCES [dbo].[Product] ([ProductISBN])
GO
ALTER TABLE [dbo].[Inward] CHECK CONSTRAINT [FK_Inward_ProductISBN]
GO
ALTER TABLE [dbo].[Inward]  WITH CHECK ADD  CONSTRAINT [FK_Inward_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Inward] CHECK CONSTRAINT [FK_Inward_PublisherName]
GO
ALTER TABLE [dbo].[Outward]  WITH CHECK ADD  CONSTRAINT [FK_Outward_LocationName] FOREIGN KEY([LocationName])
REFERENCES [dbo].[Location] ([LocationName])
GO
ALTER TABLE [dbo].[Outward] CHECK CONSTRAINT [FK_Outward_LocationName]
GO
ALTER TABLE [dbo].[Outward]  WITH CHECK ADD  CONSTRAINT [FK_Outward_ProductISBN] FOREIGN KEY([ProductISBN])
REFERENCES [dbo].[Product] ([ProductISBN])
GO
ALTER TABLE [dbo].[Outward] CHECK CONSTRAINT [FK_Outward_ProductISBN]
GO
ALTER TABLE [dbo].[Outward]  WITH CHECK ADD  CONSTRAINT [FK_Outward_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Outward] CHECK CONSTRAINT [FK_Outward_PublisherName]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_PublisherName]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_CustomerName] FOREIGN KEY([CustomerName])
REFERENCES [dbo].[Customer] ([CustomerName])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_CustomerName]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_ProductISBN] FOREIGN KEY([ProductISBN])
REFERENCES [dbo].[Product] ([ProductISBN])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_ProductISBN]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_PublisherName]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_TransactionType] FOREIGN KEY([TransactionType])
REFERENCES [dbo].[Activity] ([TransactionType])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_TransactionType]
GO
ALTER TABLE [dbo].[SalePayment]  WITH CHECK ADD  CONSTRAINT [FK_SalePayment_CustomerName] FOREIGN KEY([CustomerName])
REFERENCES [dbo].[Customer] ([CustomerName])
GO
ALTER TABLE [dbo].[SalePayment] CHECK CONSTRAINT [FK_SalePayment_CustomerName]
GO
ALTER TABLE [dbo].[SalePayment]  WITH CHECK ADD  CONSTRAINT [FK_SalePayment_SaleInvNumber] FOREIGN KEY([SaleInvNumber])
REFERENCES [dbo].[SaleTotal] ([SaleInvNumber])
GO
ALTER TABLE [dbo].[SalePayment] CHECK CONSTRAINT [FK_SalePayment_SaleInvNumber]
GO
ALTER TABLE [dbo].[SaleTotal]  WITH CHECK ADD  CONSTRAINT [FK_SaleTotal_CustomerName] FOREIGN KEY([CustomerName])
REFERENCES [dbo].[Customer] ([CustomerName])
GO
ALTER TABLE [dbo].[SaleTotal] CHECK CONSTRAINT [FK_SaleTotal_CustomerName]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_LocationName] FOREIGN KEY([LocationName])
REFERENCES [dbo].[Location] ([LocationName])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_LocationName]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_ProductISBN] FOREIGN KEY([ProductISBN])
REFERENCES [dbo].[Product] ([ProductISBN])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_ProductISBN]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_PublisherName]
GO
USE [master]
GO
ALTER DATABASE [ChelisA] SET  READ_WRITE 
GO
