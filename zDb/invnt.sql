USE [master]
GO
/****** Object:  Database [InventoryWeb]    Script Date: 6/8/2024 2:42:23 PM ******/
CREATE DATABASE [InventoryWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryWeb', FILENAME = N'E:\MDF_LDF\InventoryWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventoryWeb_log', FILENAME = N'E:\MDF_LDF\InventoryWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InventoryWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventoryWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [InventoryWeb] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventoryWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventoryWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InventoryWeb', N'ON'
GO
ALTER DATABASE [InventoryWeb] SET QUERY_STORE = OFF
GO
USE [InventoryWeb]
GO
/****** Object:  Table [dbo].[StocksMt]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StocksMt](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialReceiptNote] [varchar](50) NULL,
	[MRNDate] [date] NULL,
	[BillNo] [varchar](50) NULL,
	[BillDate] [date] NULL,
	[MRNChallanNo] [varchar](50) NULL,
	[MRNChallanDate] [date] NULL,
	[RcvDate] [date] NULL,
	[StoreId] [int] NULL,
	[VendorId] [int] NULL,
	[PoNo] [varchar](50) NULL,
	[PoDate] [date] NULL,
	[Remarks] [varchar](100) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_StockMt] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StocksDt]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StocksDt](
	[StockdtId] [int] IDENTITY(1,1) NOT NULL,
	[StockId] [int] NULL,
	[Status] [varchar](50) NULL,
	[ProductId] [int] NULL,
	[ProdQuantity] [int] NULL,
	[SerialNo] [varchar](50) NULL,
	[SerialId] [int] NULL,
	[ChallanStatus] [varchar](50) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_StockDt] PRIMARY KEY CLUSTERED 
(
	[StockdtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInfosSetup]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInfosSetup](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](200) NULL,
	[Description] [varchar](max) NULL,
	[ImmageUrl] [varchar](max) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_ProductInfosSetup] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_StockMrProdDetails]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_StockMrProdDetails]
AS
SELECT m.StockId, m.MaterialReceiptNote, m.MRNDate, m.BillNo, m.BillDate, m.MRNChallanNo, m.MRNChallanDate, m.RcvDate, m.StoreId, m.VendorId, m.PoNo, m.PoDate, m.Remarks, COUNT(d.ProductId) AS Quantiy, p.ProductName, 
                  p.ProductId
FROM     dbo.StocksDt AS d INNER JOIN
                  dbo.StocksMt AS m ON d.StockId = m.StockId INNER JOIN
                  dbo.ProductInfosSetup AS p ON d.ProductId = p.ProductId
GROUP BY p.ProductName, m.StockId, m.MaterialReceiptNote, m.MRNDate, m.BillNo, m.BillDate, m.MRNChallanNo, m.MRNChallanDate, m.RcvDate, m.StoreId, m.VendorId, m.PoNo, m.PoDate, m.Remarks, p.ProductId
GO
/****** Object:  Table [dbo].[WorkOrders]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrders](
	[WorkOrderId] [int] IDENTITY(1,1) NOT NULL,
	[WorkOrderNo] [varchar](50) NULL,
	[QuotationId] [int] NULL,
	[WorkOrderDate] [smalldatetime] NULL,
	[Deadline] [smalldatetime] NULL,
	[Details] [varchar](200) NULL,
	[Currency] [varchar](50) NULL,
	[QuotationNetTotal] [numeric](18, 2) NULL,
	[QuotationGrandTotal] [numeric](18, 2) NULL,
	[WorkOrderAmount] [numeric](18, 2) NULL,
	[Remarks] [varchar](200) NULL,
	[ChallanStatus] [varchar](50) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_WorkOrder] PRIMARY KEY CLUSTERED 
(
	[WorkOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuotationsMT]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuotationsMT](
	[QuotationId] [int] IDENTITY(1,1) NOT NULL,
	[QuotationNo] [varchar](50) NULL,
	[ProjectTypeId_Stdt] [int] NULL,
	[Subject] [varchar](200) NULL,
	[ProjectName] [varchar](200) NULL,
	[CompanyId] [int] NULL,
	[ContactPersonId] [int] NULL,
	[ToDate] [smalldatetime] NULL,
	[ValidityDate] [smalldatetime] NULL,
	[Currency_Stdt] [int] NULL,
	[ToClientDesigId_Stdt] [int] NULL,
	[QuotationStatus_Stdt] [int] NULL,
	[SignedById] [int] NULL,
	[NetTotal] [numeric](18, 2) NULL,
	[GrandTotal] [numeric](18, 2) NULL,
	[Discount] [numeric](18, 2) NULL,
	[DiscountedTotal] [numeric](18, 2) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[QuotationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChallansMt]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChallansMt](
	[ChallanId] [int] IDENTITY(1,1) NOT NULL,
	[ChallanNo] [varchar](50) NULL,
	[WorkOrderId] [int] NULL,
	[QuotationId] [int] NULL,
	[Status] [varchar](50) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_ChallansMt] PRIMARY KEY CLUSTERED 
(
	[ChallanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuotationsDT]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuotationsDT](
	[QuotationDtId] [int] IDENTITY(1,1) NOT NULL,
	[QuotationId] [int] NULL,
	[QuotationNo] [varchar](50) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[TotalPrice] [numeric](18, 2) NULL,
	[VatPercent] [numeric](18, 2) NULL,
	[VatAmount] [numeric](18, 2) NULL,
	[TaxPercent] [numeric](18, 2) NULL,
	[TaxAmount] [numeric](18, 2) NULL,
	[AtiPercent] [numeric](18, 2) NULL,
	[AtiAmount] [numeric](18, 2) NULL,
	[OtherRemarks] [varchar](100) NULL,
	[OtherPercent] [numeric](18, 2) NULL,
	[OtherAmount] [numeric](18, 2) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_QuotationsDT] PRIMARY KEY CLUSTERED 
(
	[QuotationDtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChallansDt]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChallansDt](
	[ChallanDtId] [int] IDENTITY(1,1) NOT NULL,
	[ChallanId] [int] NULL,
	[ProductId] [int] NULL,
	[StockdtId] [int] NULL,
	[WorkOrderId] [int] NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_ChallansDt] PRIMARY KEY CLUSTERED 
(
	[ChallanDtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_WorkOrderProdDetails]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_WorkOrderProdDetails]
AS
SELECT w.WorkOrderId, w.WorkOrderNo, p.ProductId, p.ProductName, d.Quantity AS QuotationQty, COUNT(s.ProdQuantity) AS AvailableQty, COUNT(s.ProdQuantity) - d.Quantity AS ShortQty, c.ChallanId, ISNULL(cd_1.AddedQty, 0) AS AddedQty,
                      (SELECT COUNT(ProductId) AS Expr1
                       FROM      dbo.ChallansDt AS cd4
                       WHERE   (ProductId = p.ProductId) AND (WorkOrderId = w.WorkOrderId)) AS AllChallanProdQty
FROM     dbo.WorkOrders AS w INNER JOIN
                  dbo.QuotationsMT AS m ON w.QuotationId = m.QuotationId INNER JOIN
                  dbo.QuotationsDT AS d ON m.QuotationId = d.QuotationId INNER JOIN
                  dbo.ProductInfosSetup AS p ON d.ProductId = p.ProductId INNER JOIN
                  dbo.ChallansMt AS c ON w.WorkOrderId = c.WorkOrderId LEFT OUTER JOIN
                  dbo.StocksDt AS s ON p.ProductId = s.ProductId AND s.ChallanStatus = 'N' LEFT OUTER JOIN
                      (SELECT ChallanId, ProductId, COUNT(ProductId) AS AddedQty
                       FROM      dbo.ChallansDt AS cd
                       GROUP BY ChallanId, ProductId) AS cd_1 ON c.ChallanId = cd_1.ChallanId AND p.ProductId = cd_1.ProductId
GROUP BY w.WorkOrderId, w.WorkOrderNo, p.ProductId, p.ProductName, d.Quantity, c.ChallanId, cd_1.AddedQty
GO
/****** Object:  View [dbo].[VW_ExistingStockProd]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ExistingStockProd]
AS
SELECT s.StockdtId, s.ProdQuantity, s.SerialNo, s.SerialId, w.WorkOrderId, w.WorkOrderNo, p.ProductId, p.ProductName, dbo.ChallansMt.ChallanId
FROM     dbo.QuotationsMT AS q INNER JOIN
                  dbo.WorkOrders AS w ON q.QuotationId = w.QuotationId INNER JOIN
                  dbo.QuotationsDT AS qd ON q.QuotationId = qd.QuotationId INNER JOIN
                  dbo.StocksDt AS s INNER JOIN
                  dbo.ProductInfosSetup AS p ON s.ProductId = p.ProductId ON qd.ProductId = p.ProductId INNER JOIN
                  dbo.ChallansMt ON q.QuotationId = dbo.ChallansMt.QuotationId AND w.WorkOrderId = dbo.ChallansMt.WorkOrderId
WHERE  (s.ChallanStatus = 'N')
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyInfosSetup]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInfosSetup](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
 CONSTRAINT [PK_CompanyInfosSetup] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactPersonInfosSetup]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactPersonInfosSetup](
	[ContactPersonId] [int] IDENTITY(1,1) NOT NULL,
	[ContPersonName] [varchar](200) NULL,
 CONSTRAINT [PK_ContactPersonInfosSetup] PRIMARY KEY CLUSTERED 
(
	[ContactPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeInfosSetup]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeInfosSetup](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpNo] [varchar](50) NULL,
	[EmpName] [varchar](200) NULL,
 CONSTRAINT [PK_EmployeeInfosSetup] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetupDT_Datas]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupDT_Datas](
	[SetupDT_Id] [int] IDENTITY(1,1) NOT NULL,
	[SetupDT_Data] [varchar](255) NULL,
	[SetupMT_Id] [int] NULL,
	[Remarks] [varchar](255) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Setup_DT_Datas] PRIMARY KEY CLUSTERED 
(
	[SetupDT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetupMT_Datas]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupMT_Datas](
	[SetupMT_Id] [int] IDENTITY(1,1) NOT NULL,
	[SetupMT_Data] [varchar](255) NULL,
	[AddedBy] [nvarchar](450) NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[Remarks] [varchar](255) NULL,
 CONSTRAINT [PK_SetupMT_Datas] PRIMARY KEY CLUSTERED 
(
	[SetupMT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zones]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zones](
	[ZoneId] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [varchar](255) NULL,
	[AddedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[AddedDate] [smalldatetime] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[Remarks] [varchar](255) NULL,
	[TrackZoneId] [varchar](255) NULL,
	[TerritorySetupDT_Id] [int] NULL,
 CONSTRAINT [PK_Zone] PRIMARY KEY CLUSTERED 
(
	[ZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240115074008_AddUserIdentityTables', N'7.0.15')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'10e7e4e6-5347-48fd-b4ef-e9538a46d651', N'Role Test', N'ROLE TEST', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a6ad725d-4c8d-42ca-82e3-7bf6b373ca62', N'Invt User', N'INVT USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'bb2dd7ea-1267-4fe6-b91c-3850d4cf0bae', N'Super Admin', N'SUPER ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd9ca66a3-f0d0-49dd-8715-62266b7c39d4', N'Quot User', N'QUOT USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'de3301b2-5b9b-485a-88ab-b6a1fad6cc20', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e79a3a95-54dd-48c6-ac2e-af6c47af14fb', N'a6ad725d-4c8d-42ca-82e3-7bf6b373ca62')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', N'bb2dd7ea-1267-4fe6-b91c-3850d4cf0bae')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7415f5b1-ae00-4c6c-9a16-a8738d9897cb', N'd9ca66a3-f0d0-49dd-8715-62266b7c39d4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9b3ddc82-26ce-4144-9baa-be0e7c04100a', N'de3301b2-5b9b-485a-88ab-b6a1fad6cc20')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', N'de3301b2-5b9b-485a-88ab-b6a1fad6cc20')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'27323e8b-0226-49ea-ae62-c9fe039758e8', N'tes12@gmail.com', N'TES12@GMAIL.COM', N'tes12@gmail.com', N'TES12@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHy7K3dnSPQ7jT+z0XPTR3TNypNDK5Z8Y2wgkzI4ClepgjSL5qiYnVJDMz7/n2fl/Q==', N'JEFOB3ER3ZEZPMBNX7WSDANZJ455BPT5', N'9cf769d1-cb64-4963-8ea6-b76f7423f9bd', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', N'superadminuser@gmail.com', N'SUPERADMINUSER@GMAIL.COM', N'superadminuser@gmail.com', N'SUPERADMINUSER@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEEKG44byx2NoK5QoWrReo3BFDiqA/HrRzOHCO4UxHVD16b+Qju1W8X+bM1CEycLwdw==', N'DX3ZJTPTBZX624CQRJHPCUN6D4BHHN6H', N'26af7d26-f221-44d9-a67a-57d2d8c60d06', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'7415f5b1-ae00-4c6c-9a16-a8738d9897cb', N'quotationuser@gmail.com', N'QUOTATIONUSER@GMAIL.COM', N'quotationuser@gmail.com', N'QUOTATIONUSER@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMr8Nu9Xj4JvB8Qo/gZLqKTPjZqc3z4DO3Vyb/EdYStYNMU0KfJq/OgaiLSaeEDHig==', N'QCDHANLCNSKMQ5VVVA5YW2MHQY3OPERV', N'e83fb87c-0ddc-4dd0-bd4d-81728e57de23', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'90061852-d628-47dd-b085-94fa7a4296c8', N'user1@gmail.com', N'USER1@GMAIL.COM', N'user1@gmail.com', N'USER1@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEJP3YoZgnXtvOPXXcyjgTEuIxQmDy60oMp3PfIf2tASLSfhVK7kHXqYmJzhUn2SLJw==', N'3XVPMAYL7IFWJOSZJY2ZUQ667KQYK2RP', N'ff668759-2e08-448d-966f-7e4f9f2079e6', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'9b3ddc82-26ce-4144-9baa-be0e7c04100a', N'joy@gmail.com', N'JOY@GMAIL.COM', N'joy@gmail.com', N'JOY@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEFdTJBSoDI0PKJ+banW7FsB49RJoIkjZllAYUP3v5FFxF2hS6MQEM6z6xlCsQryLag==', N'NXA4YLH747JZ3XWQTUG6NGWA3KMKW5FK', N'dc47dc7c-95b2-49cf-adf6-9b815e73792d', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', N'adminuser@gmail.com', N'ADMINUSER@GMAIL.COM', N'adminuser@gmail.com', N'ADMINUSER@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEM13jcjVHZzjQr9VOzlIAcFZhHFx7KjEjvulDJ3A8Q4j34dPew7WJefiggHg5JaPUw==', N'N4POCTWLNCB7JGEKGTMMZTH535MPQGO7', N'e9213a40-ffcc-4090-94f3-3ac444ed128a', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'e79a3a95-54dd-48c6-ac2e-af6c47af14fb', N'inventoryuser@gmail.com', N'INVENTORYUSER@GMAIL.COM', N'inventoryuser@gmail.com', N'INVENTORYUSER@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMwmzEj3mqz0av7j7l2y7n01OSJwATkLyytI4BSGxhjaUsvOb3h9G6PPl649RHVM/Q==', N'DRZFUC33LAFTZNVZRTPADSH6PNNMWIXW', N'a6aff3af-191c-44ea-8900-910bc62685d4', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'fdb45109-b356-477d-aa2c-0cf3249c86b3', N'roleTest@gmail.com', N'ROLETEST@GMAIL.COM', N'roleTest@gmail.com', N'ROLETEST@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAECOa2LYeVCLDK1ya3YyTtn4xRIEJUq38ejoIygHB8m/d/RCRAfu9R4PSpdcpeMC2Qw==', N'H2G5OAKB26ZBQ6BPVGPLPKCJVAWTB5CG', N'0fa4a8cd-7c75-48f4-9565-d6cf08093852', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
GO
SET IDENTITY_INSERT [dbo].[ChallansDt] ON 

INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 3046, 1, 404, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 3046, 1, 405, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 3046, 1, 406, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 3046, 1, 407, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 3046, 1, 408, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 3046, 2, 425, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 3046, 2, 426, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 3046, 2, 427, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 3046, 2, 428, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 3046, 2, 429, 1073, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1010, 4042, 1, 409, 1074, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-23T10:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1011, 4042, 1, 410, 1074, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-23T10:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1012, 4042, 1, 411, 1074, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-23T10:45:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1013, 4042, 3, 461, 1074, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-23T10:47:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1014, 4042, 3, 463, 1074, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-23T10:47:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[ChallansDt] ([ChallanDtId], [ChallanId], [ProductId], [StockdtId], [WorkOrderId], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1015, 4042, 3, 462, 1074, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-06-01T17:42:00' AS SmallDateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChallansDt] OFF
GO
SET IDENTITY_INSERT [dbo].[ChallansMt] ON 

INSERT [dbo].[ChallansMt] ([ChallanId], [ChallanNo], [WorkOrderId], [QuotationId], [Status], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3046, N'CHLN-240511-01', 1073, 2073, N'Pending', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChallansMt] ([ChallanId], [ChallanNo], [WorkOrderId], [QuotationId], [Status], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4042, N'CHLN-240523-01', 1074, 2074, N'Pending', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-23T10:03:00' AS SmallDateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChallansMt] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyInfosSetup] ON 

INSERT [dbo].[CompanyInfosSetup] ([CompanyId], [CompanyName]) VALUES (1, N'BSRM')
INSERT [dbo].[CompanyInfosSetup] ([CompanyId], [CompanyName]) VALUES (2, N'S ALAM')
INSERT [dbo].[CompanyInfosSetup] ([CompanyId], [CompanyName]) VALUES (3, N'PHP')
SET IDENTITY_INSERT [dbo].[CompanyInfosSetup] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactPersonInfosSetup] ON 

INSERT [dbo].[ContactPersonInfosSetup] ([ContactPersonId], [ContPersonName]) VALUES (1, N'Moynul')
INSERT [dbo].[ContactPersonInfosSetup] ([ContactPersonId], [ContPersonName]) VALUES (2, N'Arman')
INSERT [dbo].[ContactPersonInfosSetup] ([ContactPersonId], [ContPersonName]) VALUES (3, N'Rashed')
SET IDENTITY_INSERT [dbo].[ContactPersonInfosSetup] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeInfosSetup] ON 

INSERT [dbo].[EmployeeInfosSetup] ([EmpId], [EmpNo], [EmpName]) VALUES (1, N'ATL-1', N'Jahangir Alam')
INSERT [dbo].[EmployeeInfosSetup] ([EmpId], [EmpNo], [EmpName]) VALUES (2, N'ATL-2', N'Nizam Uddin')
INSERT [dbo].[EmployeeInfosSetup] ([EmpId], [EmpNo], [EmpName]) VALUES (3, N'ATL-3', N'Rasif Khan')
SET IDENTITY_INSERT [dbo].[EmployeeInfosSetup] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductInfosSetup] ON 

INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Head Phone', N'<p>hkhkkhkjh khjkhkhjk&nbsp;</p>', N'/images/product/40e8e084-3110-4814-a068-9f82d650b369.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Mouse', N'<p>sfdkfskj sdlfjs&nbsp;</p>', N'/images/product/2641bb05-57e8-4e65-b261-d7437ad80f01.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Laptop', N'<p>sdhfsfhjk skd</p>', N'/images/product/93b1d58b-8978-4069-beee-ab3c2d3f4ec2.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, N'Watch', N'<p>Pick your best&nbsp;</p>', N'/images/product/8c82d9cd-5cc4-43df-99f1-9705b1307758.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, N'Skate Board', N'<p>Feel the dare</p>', N'/images/product/b813d969-2137-4544-ad5d-9c42b47bf400.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1014, N'fsdfs', N'<p>sdfsdf</p>', N'/images/Default_image.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1015, N'sdfsfsdf', N'<p>sdfsdfsfsdfsfsfs</p>', N'/images/Default_image.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1016, N'Fresh Water 1L', N'<p>sfsfsfsf</p>', N'/images/Default_image.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1017, N'Lenevo buds', N'<p>sdjfskdjf</p>', N'/images/Default_image.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductInfosSetup] ([ProductId], [ProductName], [Description], [ImmageUrl], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1018, N'testUseredited', N'<p>sfjskljklsfsfassfda</p>', N'/images/Default_image.png', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-21T17:35:00' AS SmallDateTime), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-21T17:38:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ProductInfosSetup] OFF
GO
SET IDENTITY_INSERT [dbo].[QuotationsDT] ON 

INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 2073, N'QT-240505-01', 1, 5, CAST(34.00 AS Numeric(18, 2)), CAST(170.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(5.10 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(5.10 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(5.10 AS Numeric(18, 2)), N're', CAST(3.00 AS Numeric(18, 2)), CAST(5.10 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 2073, N'QT-240505-01', 2, 5, CAST(32.00 AS Numeric(18, 2)), CAST(160.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(4.80 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(3.20 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(3.20 AS Numeric(18, 2)), N're', CAST(3.00 AS Numeric(18, 2)), CAST(4.80 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 2073, N'QT-240505-01', 16, 3, CAST(34.00 AS Numeric(18, 2)), CAST(102.00 AS Numeric(18, 2)), CAST(4.00 AS Numeric(18, 2)), CAST(4.08 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(2.04 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(3.06 AS Numeric(18, 2)), N'er', CAST(2.00 AS Numeric(18, 2)), CAST(2.04 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 2074, N'QT-240505-02', 1, 3, CAST(23.00 AS Numeric(18, 2)), CAST(69.00 AS Numeric(18, 2)), CAST(22.00 AS Numeric(18, 2)), CAST(15.18 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(1.38 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(1.38 AS Numeric(18, 2)), N'df', CAST(2.00 AS Numeric(18, 2)), CAST(1.38 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 2074, N'QT-240505-02', 3, 4, CAST(232.00 AS Numeric(18, 2)), CAST(928.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(27.84 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(27.84 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(27.84 AS Numeric(18, 2)), N'N/A', CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 2075, N'QT-240505-03', 1, 4, CAST(32.00 AS Numeric(18, 2)), CAST(128.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(3.84 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(3.84 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(3.84 AS Numeric(18, 2)), N'dsd', CAST(1.00 AS Numeric(18, 2)), CAST(1.28 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 2075, N'QT-240505-03', 2, 5, CAST(3.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(0.30 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(0.45 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(0.45 AS Numeric(18, 2)), N're', CAST(3.00 AS Numeric(18, 2)), CAST(0.45 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 2075, N'QT-240505-03', 16, 4, CAST(35.00 AS Numeric(18, 2)), CAST(140.00 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(2.80 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(4.20 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), N'N/A', CAST(3.00 AS Numeric(18, 2)), CAST(4.20 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 2075, N'QT-240505-03', 3, 3, CAST(34.00 AS Numeric(18, 2)), CAST(102.00 AS Numeric(18, 2)), CAST(4.00 AS Numeric(18, 2)), CAST(4.08 AS Numeric(18, 2)), CAST(4.00 AS Numeric(18, 2)), CAST(4.08 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(3.06 AS Numeric(18, 2)), N'er', CAST(3.00 AS Numeric(18, 2)), CAST(3.06 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 2073, N'QT-240505-01', 13, 3, CAST(22.00 AS Numeric(18, 2)), CAST(66.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), N'N/A', CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2042, 2076, N'QT-240521-01', 1016, 6, CAST(45.00 AS Numeric(18, 2)), CAST(270.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(2.70 AS Numeric(18, 2)), N'jkhjkkd', CAST(18.00 AS Numeric(18, 2)), CAST(48.60 AS Numeric(18, 2)), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-06-05T10:54:00' AS SmallDateTime), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-06-06T15:23:00' AS SmallDateTime))
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2045, 2076, N'QT-240521-01', 3, 22, CAST(22.00 AS Numeric(18, 2)), CAST(484.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(4.84 AS Numeric(18, 2)), N'22rrtet', CAST(9.00 AS Numeric(18, 2)), CAST(43.56 AS Numeric(18, 2)), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-06-05T12:06:00' AS SmallDateTime), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-06-06T15:26:00' AS SmallDateTime))
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2070, 2076, N'QT-240521-01', 1018, 1, CAST(434.00 AS Numeric(18, 2)), CAST(434.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), N'gdgdfg', CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-06-06T15:28:00' AS SmallDateTime), N'N/A', NULL)
INSERT [dbo].[QuotationsDT] ([QuotationDtId], [QuotationId], [QuotationNo], [ProductId], [Quantity], [UnitPrice], [TotalPrice], [VatPercent], [VatAmount], [TaxPercent], [TaxAmount], [AtiPercent], [AtiAmount], [OtherRemarks], [OtherPercent], [OtherAmount], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2071, 2076, N'QT-240521-01', 2, 1, CAST(43.00 AS Numeric(18, 2)), CAST(43.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), N'erere', CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-06-08T09:51:00' AS SmallDateTime), N'N/A', NULL)
SET IDENTITY_INSERT [dbo].[QuotationsDT] OFF
GO
SET IDENTITY_INSERT [dbo].[QuotationsMT] ON 

INSERT [dbo].[QuotationsMT] ([QuotationId], [QuotationNo], [ProjectTypeId_Stdt], [Subject], [ProjectName], [CompanyId], [ContactPersonId], [ToDate], [ValidityDate], [Currency_Stdt], [ToClientDesigId_Stdt], [QuotationStatus_Stdt], [SignedById], [NetTotal], [GrandTotal], [Discount], [DiscountedTotal], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2073, N'QT-240505-01', 1013, N'test', N'test', 1, 1, CAST(N'2024-05-05T10:16:00' AS SmallDateTime), CAST(N'2024-05-05T10:16:00' AS SmallDateTime), 1015, 1017, 1020, 1, CAST(398.00 AS Numeric(18, 2)), CAST(441.54 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsMT] ([QuotationId], [QuotationNo], [ProjectTypeId_Stdt], [Subject], [ProjectName], [CompanyId], [ContactPersonId], [ToDate], [ValidityDate], [Currency_Stdt], [ToClientDesigId_Stdt], [QuotationStatus_Stdt], [SignedById], [NetTotal], [GrandTotal], [Discount], [DiscountedTotal], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2074, N'QT-240505-02', 1014, N'er', N'er', 3, 1, CAST(N'2024-05-05T10:19:00' AS SmallDateTime), CAST(N'2024-05-05T10:19:00' AS SmallDateTime), 1016, 1017, 1020, 2, CAST(997.00 AS Numeric(18, 2)), CAST(1099.84 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsMT] ([QuotationId], [QuotationNo], [ProjectTypeId_Stdt], [Subject], [ProjectName], [CompanyId], [ContactPersonId], [ToDate], [ValidityDate], [Currency_Stdt], [ToClientDesigId_Stdt], [QuotationStatus_Stdt], [SignedById], [NetTotal], [GrandTotal], [Discount], [DiscountedTotal], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2075, N'QT-240505-03', 1012, N'dfs', N'sds', 1, 1, CAST(N'2024-05-05T10:20:00' AS SmallDateTime), CAST(N'2024-05-05T10:20:00' AS SmallDateTime), 1015, 1017, 1020, 3, CAST(385.00 AS Numeric(18, 2)), CAST(424.93 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[QuotationsMT] ([QuotationId], [QuotationNo], [ProjectTypeId_Stdt], [Subject], [ProjectName], [CompanyId], [ContactPersonId], [ToDate], [ValidityDate], [Currency_Stdt], [ToClientDesigId_Stdt], [QuotationStatus_Stdt], [SignedById], [NetTotal], [GrandTotal], [Discount], [DiscountedTotal], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2076, N'QT-240521-01', 1012, N'UserDate Test edited', N'UserDate Test  edited', 1, 1, CAST(N'2024-05-21T15:36:00' AS SmallDateTime), CAST(N'2024-05-21T15:36:00' AS SmallDateTime), 1015, 1017, 1020, 2, CAST(150.00 AS Numeric(18, 2)), CAST(189.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-21T15:36:00' AS SmallDateTime), N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-21T15:38:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[QuotationsMT] OFF
GO
SET IDENTITY_INSERT [dbo].[SetupDT_Datas] ON 

INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'SubCategory', 1002, N'testRemarks', N'1', CAST(N'2024-01-18T16:10:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'ABC Company', 3, N'testRemarks', N'1', CAST(N'2024-01-18T16:14:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1002, N'Ontario', 1, N'testRemarks', N'1', CAST(N'2024-01-19T00:20:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1003, N'Toronto', 1, N'testRemarks', N'1', CAST(N'2024-01-19T18:28:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1004, N'CTG', 1003, N'testRemarks', N'1', CAST(N'2024-01-21T14:30:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1005, N'Dhaka', 1003, N'testRemarks', N'1', CAST(N'2024-01-21T14:30:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1006, N'Rasif', 1004, N'testRemarks', N'1', CAST(N'2024-01-21T14:30:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1007, N'Joy', 1004, N'testRemarks', N'1', CAST(N'2024-01-21T14:30:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1008, N'Programmer', 1005, N'testRemarks', N'1', CAST(N'2024-01-21T14:30:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1009, N'Jr. Programmer', 1005, N'testRemarks', N'1', CAST(N'2024-01-21T14:30:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1010, N'Karnafully', 1006, N'testRemarks', N'1', CAST(N'2024-01-22T13:12:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1011, N'sdfsdf', 3, N'testRemarks', N'1', CAST(N'2024-01-23T10:09:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1012, N'Fire Hydrrrnt', 1007, N'testRemarks', N'1', CAST(N'2024-01-23T12:54:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1013, N'CCTV', 1007, N'testRemarks', N'1', CAST(N'2024-01-23T12:55:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1014, N'civil Design', 1007, N'testRemarks', N'1', CAST(N'2024-01-23T12:56:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1015, N'BDT', 1008, N'testRemarks', N'1', CAST(N'2024-01-23T12:58:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1016, N'USD', 1008, N'testRemarks', N'1', CAST(N'2024-01-23T12:58:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1017, N'Director', 1009, N'testRemarks', N'1', CAST(N'2024-01-23T12:59:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1018, N'MD', 1009, N'testRemarks', N'1', CAST(N'2024-01-23T12:59:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1019, N'Pending', 1010, N'testRemarks', N'1', CAST(N'2024-01-23T12:59:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1020, N'Confirmed', 1010, N'testRemarks', N'1', CAST(N'2024-01-23T12:59:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1021, N'Hp NoteBook', 1011, N'testRemarks', N'1', CAST(N'2024-01-27T10:18:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1022, N'Hick Vision CCCam', 1011, N'testRemarks', N'1', CAST(N'2024-01-27T10:19:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1023, N'SonySpeaker', 1011, N'testRemarks', N'1', CAST(N'2024-01-27T10:20:00' AS SmallDateTime), N'1', CAST(N'2024-01-21T14:28:00' AS SmallDateTime))
INSERT [dbo].[SetupDT_Datas] ([SetupDT_Id], [SetupDT_Data], [SetupMT_Id], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1024, N'testUserDateedit', 1, NULL, N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-21T14:23:00' AS SmallDateTime), N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-21T14:24:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SetupDT_Datas] OFF
GO
SET IDENTITY_INSERT [dbo].[SetupMT_Datas] ON 

INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1, N'Canadaa', NULL, CAST(N'2024-01-17T17:59:00' AS SmallDateTime), NULL, CAST(N'2024-05-20T16:34:00' AS SmallDateTime), NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (3, N'Company Name', NULL, CAST(N'2024-01-17T18:04:00' AS SmallDateTime), NULL, CAST(N'2024-01-17T18:06:00' AS SmallDateTime), NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1002, N'Category', NULL, CAST(N'2024-01-18T12:39:00' AS SmallDateTime), NULL, CAST(N'2024-01-18T15:11:00' AS SmallDateTime), NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1003, N'Bangladesh', NULL, CAST(N'2024-01-20T18:19:00' AS SmallDateTime), NULL, CAST(N'2024-01-21T14:29:00' AS SmallDateTime), NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1004, N'Employee', NULL, CAST(N'2024-01-20T18:19:00' AS SmallDateTime), NULL, CAST(N'2024-01-21T14:29:00' AS SmallDateTime), NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1005, N'Designation', NULL, CAST(N'2024-01-20T18:19:00' AS SmallDateTime), NULL, CAST(N'2024-01-21T14:29:00' AS SmallDateTime), NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1006, N'Zone', NULL, CAST(N'2024-01-22T13:12:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1007, N'Project Type', NULL, CAST(N'2024-01-23T12:53:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1008, N'Currency', NULL, CAST(N'2024-01-23T12:57:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1009, N'ToClientDesigId', NULL, CAST(N'2024-01-23T12:58:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1010, N'QuotationStatus', NULL, CAST(N'2024-01-23T12:59:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (1011, N'ProductName', NULL, CAST(N'2024-01-27T10:18:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (2011, N'sdfsdfs', NULL, CAST(N'2024-02-20T15:49:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (2012, N'sdfsjkf', NULL, CAST(N'2024-02-20T15:56:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (3011, N'dfsdfs', NULL, CAST(N'2024-02-25T12:48:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (3014, N'addmintesteeeeeeeeee', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-21T11:02:00' AS SmallDateTime), N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-21T12:45:00' AS SmallDateTime), NULL)
INSERT [dbo].[SetupMT_Datas] ([SetupMT_Id], [SetupMT_Data], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate], [Remarks]) VALUES (3015, N'superAdminTest', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-21T11:03:00' AS SmallDateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SetupMT_Datas] OFF
GO
SET IDENTITY_INSERT [dbo].[StocksDt] ON 

INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (404, 46, N'New', 1, 1, N'yu30ojjkj', 30, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (405, 46, N'New', 1, 1, N'yu31ojkk', 31, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (406, 46, N'New', 1, 1, N'yu32oj', 32, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (407, 46, N'New', 1, 1, N'yu33ojkkkkkll', 33, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (408, 46, N'New', 1, 1, N'yu34ojhjsfdfsdfsf', 34, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (409, 46, N'New', 1, 1, N'yu35oj', 35, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (410, 46, N'New', 1, 1, N'yu36oj', 36, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (411, 46, N'New', 1, 1, N'yu37oj', 37, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (412, 46, N'New', 1, 1, N'yu38oj', 38, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (413, 46, N'New', 1, 1, N'yu39oj', 39, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (414, 46, N'New', 1, 1, N'yu40oj', 40, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (415, 46, N'New', 1, 1, N'yu41oj', 41, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (416, 46, N'New', 1, 1, N'yu42oj', 42, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (417, 46, N'New', 1, 1, N'yu43oj', 43, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (418, 46, N'New', 1, 1, N'yu44oj', 44, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (419, 46, N'New', 1, 1, N'yu45oj', 45, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (420, 46, N'New', 1, 1, N'yu46oj', 46, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (421, 46, N'New', 1, 1, N'yu47oj', 47, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (422, 46, N'New', 1, 1, N'yu48oj', 48, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (423, 46, N'New', 1, 1, N'yu49oj', 49, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (424, 46, N'New', 1, 1, N'yu50oj', 50, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (425, 46, N'New', 2, 1, N'sdsa43sfdf', 43, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (426, 46, N'New', 2, 1, N'sdsa44sfdf', 44, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (427, 46, N'New', 2, 1, N'sdsa45sfdf', 45, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (428, 46, N'New', 2, 1, N'sdsa46sfdf', 46, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (429, 46, N'New', 2, 1, N'sdsa47sfdf', 47, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (430, 46, N'New', 2, 1, N'sdsa48sfdf', 48, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (431, 46, N'New', 2, 1, N'sdsa49sfdf', 49, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (432, 46, N'New', 2, 1, N'sdsa50sfdf', 50, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (433, 46, N'New', 2, 1, N'sdsa51sfdf', 51, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (434, 46, N'New', 2, 1, N'sdsa52sfdf', 52, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (435, 46, N'New', 2, 1, N'sdsa53sfdf', 53, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (436, 46, N'New', 2, 1, N'sdsa54sfdf', 54, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (437, 46, N'New', 2, 1, N'sdsa55sfdf', 55, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (438, 46, N'New', 2, 1, N'sdsa56sfdf', 56, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (439, 46, N'New', 2, 1, N'sdsa57sfdf', 57, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (440, 46, N'New', 2, 1, N'sdsa58sfdf', 58, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (441, 46, N'New', 2, 1, N'sdsa59sfdf', 59, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (442, 46, N'New', 2, 1, N'sdsa60sfdf', 60, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (443, 46, N'New', 2, 1, N'sdsa61sfdf', 61, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (444, 46, N'New', 2, 1, N'sdsa62sfdf', 62, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (445, 46, N'New', 2, 1, N'sdsa63sfdf', 63, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (446, 46, N'New', 2, 1, N'sdsa64sfdf', 64, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (447, 46, N'New', 2, 1, N'sdsa65sfdf', 65, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (448, 46, N'New', 2, 1, N'sdsa66sfdf', 66, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (449, 46, N'New', 2, 1, N'sdsa67sfdf', 67, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (450, 46, N'New', 2, 1, N'sdsa68sfdf', 68, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (451, 46, N'New', 2, 1, N'sdsa69sfdf', 69, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (452, 46, N'New', 2, 1, N'sdsa70sfdf', 70, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (453, 46, N'New', 2, 1, N'sdsa71sfdf', 71, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (454, 46, N'New', 2, 1, N'sdsa72sfdf', 72, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (455, 46, N'New', 2, 1, N'sdsa73sfdf', 73, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (456, 46, N'New', 2, 1, N'sdsa74sfdf', 74, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (457, 46, N'New', 2, 1, N'sdsa75sfdf', 75, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (458, 46, N'New', 2, 1, N'sdsa76sfdf', 76, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (459, 46, N'New', 2, 1, N'sdsa77sfdf', 77, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (460, 46, N'New', 2, 1, N'sdsa78sfdf', 78, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (461, 46, N'New', 3, 1, N'hj3kl', 3, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (462, 46, N'New', 3, 1, N'hj4kl', 4, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (463, 46, N'New', 3, 1, N'hj5kl', 5, N'Y', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (464, 46, N'New', 3, 1, N'hj6kl', 6, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (465, 46, N'New', 3, 1, N'hj7kl', 7, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (466, 46, N'New', 3, 1, N'hj8kl', 8, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (467, 46, N'New', 3, 1, N'hj9kl', 9, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (468, 46, N'New', 3, 1, N'hj10kl', 10, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (469, 46, N'New', 3, 1, N'hj11kl', 11, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (470, 46, N'New', 3, 1, N'hj12kl', 12, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (471, 46, N'New', 3, 1, N'hj13kl', 13, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (472, 46, N'New', 3, 1, N'hj14kl', 14, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (473, 46, N'New', 3, 1, N'hj15kl', 15, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (474, 46, N'New', 3, 1, N'hj16kl', 16, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (475, 46, N'New', 3, 1, N'hj17kl', 17, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (476, 46, N'New', 3, 1, N'hj18kl', 18, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (477, 46, N'New', 3, 1, N'hj19kl', 19, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (478, 46, N'New', 3, 1, N'hj20kl', 20, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (479, 46, N'New', 3, 1, N'hj21kl', 21, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (480, 46, N'New', 3, 1, N'hj22kl', 22, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (481, 46, N'New', 3, 1, N'hj23kl', 23, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (482, 46, N'New', 3, 1, N'hj24kl', 24, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (483, 46, N'New', 3, 1, N'hj25kl', 25, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (484, 46, N'New', 3, 1, N'hj26kl', 26, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (485, 46, N'New', 3, 1, N'hj27kl', 27, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (486, 46, N'New', 3, 1, N'hj28kl', 28, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (487, 46, N'New', 3, 1, N'hj29kl', 29, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (488, 46, N'New', 3, 1, N'hj30kl', 30, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (489, 46, N'New', 3, 1, N'hj31kl', 31, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (490, 46, N'New', 3, 1, N'hj32kl', 32, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (491, 46, N'New', 3, 1, N'hj33kl', 33, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (492, 46, N'New', 3, 1, N'hj34kl', 34, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (493, 46, N'New', 3, 1, N'hj35kl', 35, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (494, 46, N'New', 3, 1, N'hj36kl', 36, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (495, 46, N'New', 3, 1, N'hj37kl', 37, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (496, 46, N'New', 3, 1, N'hj38kl', 38, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (497, 46, N'New', 3, 1, N'hj39kl', 39, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (498, 46, N'New', 3, 1, N'hj40kl', 40, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (499, 46, N'New', 3, 1, N'hj41kl', 41, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (500, 46, N'New', 3, 1, N'hj42kl', 42, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (501, 46, N'New', 3, 1, N'hj43kl', 43, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (502, 46, N'New', 3, 1, N'hj44kl', 44, N'N', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (503, 46, N'New', 3, 1, N'hj45kl', 45, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1404, 46, N'New', 13, 1, N'wth1rr', 1, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1405, 46, N'New', 16, 1, N're13erwer', 13, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1406, 46, N'New', 16, 1, N're14erwer', 14, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1407, 46, N'New', 16, 1, N're15erwer', 15, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1408, 46, N'New', 1014, 1, N'dfsf67sdfa', 67, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1409, 46, N'New', 1014, 1, N'dfsf68sdfa', 68, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1410, 46, N'New', 1014, 1, N'dfsf69sdfa', 69, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1411, 46, N'New', 1014, 1, N'dfsf70sdfa', 70, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1412, 46, N'New', 1014, 1, N'dfsf71sdfa', 71, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1413, 46, N'New', 1014, 1, N'dfsf72sdfa', 72, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1414, 46, N'New', 1014, 1, N'dfsf73sdfa', 73, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1415, 46, N'New', 1014, 1, N'dfsf74sdfa', 74, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1416, 46, N'New', 1014, 1, N'dfsf75sdfa', 75, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1417, 46, N'New', 1014, 1, N'dfsf76sdfa', 76, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2418, 46, N'New', 1, 1, N'ukuku70jkjkj', 70, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2419, 46, N'New', 1, 1, N'ukuku71jkjkj', 71, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2420, 46, N'New', 1, 1, N'ukuku72jkjkj', 72, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2421, 46, N'New', 1, 1, N'ukuku73jkjkj', 73, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2422, 46, N'New', 1, 1, N'ukuku74jkjkj', 74, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2423, 46, N'New', 1, 1, N'ukuku75jkjkjkkkkkkkklkl', 75, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2424, 1046, N'New', 1, 1, N'yyyyyy80pppppf', 80, N'N', NULL, NULL, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T14:45:00' AS SmallDateTime))
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2425, 1046, N'New', 1, 1, N'yyyyyy81ppppp', 81, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2426, 1046, N'New', 1, 1, N'yyyyyy82ppppp', 82, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2427, 1046, N'New', 1, 1, N'yyyyyy83ppppp', 83, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2428, 1046, N'New', 1, 1, N'yyyyyy84ppppp', 84, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2429, 1046, N'New', 1, 1, N'yyyyyy85ppppp', 85, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2430, 46, N'New', 1, 1, N'aaaaaaaaa1llllll', 1, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2431, 46, N'New', 1, 1, N'aaaaaaaaa2llllll', 2, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2432, 46, N'New', 1, 1, N'aaaaaaaaa3llllll', 3, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2433, 46, N'New', 1, 1, N'aaaaaaaaa4llllllyutyutyu', 4, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2434, 46, N'New', 1, 1, N'aaaaaaaaa5llllll', 5, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2435, 46, N'New', 1, 1, N'aaaaaaaaa6llllll98osdfs', 6, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3418, 46, N'New', 1, 1, N'uuuuuuo20uuuuuo', 20, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3419, 46, N'New', 1, 1, N'uuuuuuo21uuuuuo', 21, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3420, 46, N'New', 1, 1, N'uuuuuuo22uuuuuo', 22, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3421, 46, N'New', 1, 1, N'uuuuuuo23uuuuuo', 23, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3422, 46, N'New', 1, 1, N'uuuuuuo24uuuuuo', 24, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3423, 46, N'New', 1, 1, N'uuuuuuo25uuuuuo', 25, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3424, 46, N'New', 1, 1, N'uuuuuuo26uuuuuo', 26, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3425, 46, N'New', 1, 1, N'uuuuuuo27uuuuuo', 27, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3426, 46, N'New', 1, 1, N'uuuuuuo28uuuuuo', 28, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3427, 46, N'New', 1, 1, N'uuuuuuo29uuuuuo', 29, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3428, 46, N'New', 1, 1, N'uuuuuuo30uuuuuo', 30, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3429, 46, N'New', 1, 1, N'Hello-112-End', 112, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3430, 46, N'New', 1, 1, N'Hello-113-End', 113, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3431, 46, N'New', 1, 1, N'Hello-114-End', 114, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3432, 46, N'New', 1, 1, N'Hello-115-End', 115, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (3433, 46, N'New', 1, 1, N'Hello-116-End', 116, N'N', NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4440, 2047, N'New', 1, 1, N'dsf-4-gdf', 4, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4441, 2047, N'New', 1, 1, N'dsf-5-gdf', 5, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4442, 2047, N'New', 1, 1, N'dsf-6-gdf', 6, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', NULL, NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4443, 2047, N'New', 1, 1, N'gfh-5-csd', 5, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T16:12:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4444, 2047, N'New', 1, 1, N'gfh-6-csdhhh', 6, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T16:12:00' AS SmallDateTime), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T16:20:00' AS SmallDateTime))
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4445, 2047, N'New', 1, 1, N'gfh-7-csd', 7, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T16:12:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4446, 2047, N'New', 2, 1, N'Mouse-34-mhhhhh', 34, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime))
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4447, 2047, N'New', 2, 1, N'Mouse-35-mmmm', 35, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4448, 2047, N'New', 2, 1, N'Mouse-36-mmmm', 36, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4449, 2047, N'New', 2, 1, N'Mouse-37-mmmm', 37, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4450, 2047, N'New', 2, 1, N'Mouse-38-mmmm', 38, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4451, 2047, N'New', 2, 1, N'Mouse-39-mmmm', 39, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4452, 2047, N'New', 2, 1, N'Mouse-40-mmmm', 40, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4453, 2047, N'New', 2, 1, N'Mouse-41-mmmm', 41, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4454, 2047, N'New', 2, 1, N'Mouse-42-mmmm', 42, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4455, 2047, N'New', 2, 1, N'Mouse-43-mmmm', 43, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4456, 2047, N'New', 2, 1, N'Mouse-44-mmmm', 44, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4457, 2047, N'New', 2, 1, N'Mouse-45-mmmm', 45, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:28:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4458, 2047, N'New', 2, 1, N'bbn-78-mmm', 78, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:39:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4459, 2047, N'New', 2, 1, N'bbn-79-mmm', 79, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:39:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4460, 2047, N'New', 2, 1, N'bbn-80-myyyyy', 80, N'N', N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:39:00' AS SmallDateTime), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T17:39:00' AS SmallDateTime))
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4461, 2047, N'New', 13, 1, N'fg-jm-57-mn', 57, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4462, 2047, N'New', 13, 1, N'fg-jm-58-mn', 58, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4463, 2047, N'New', 13, 1, N'fg-jm-59-mn', 59, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4464, 2047, N'New', 13, 1, N'fg-jm-60-mn', 60, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4465, 2047, N'New', 13, 1, N'fg-jm-61-mn', 61, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4466, 2047, N'New', 13, 1, N'fg-jm-62-mn', 62, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4467, 2047, N'New', 13, 1, N'fg-jm-63-mn', 63, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4468, 2047, N'New', 13, 1, N'fg-jm-64-mn', 64, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4469, 2047, N'New', 13, 1, N'fg-jm-65-mn', 65, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4470, 2047, N'New', 13, 1, N'fg-jm-66-mn', 66, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4471, 2047, N'New', 13, 1, N'fg-jm-67-mn', 67, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[StocksDt] ([StockdtId], [StockId], [Status], [ProductId], [ProdQuantity], [SerialNo], [SerialId], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (4472, 2047, N'New', 13, 1, N'fg-jm--mnhj-99', 68, N'N', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-23T09:38:00' AS SmallDateTime), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-23T09:43:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[StocksDt] OFF
GO
SET IDENTITY_INSERT [dbo].[StocksMt] ON 

INSERT [dbo].[StocksMt] ([StockId], [MaterialReceiptNote], [MRNDate], [BillNo], [BillDate], [MRNChallanNo], [MRNChallanDate], [RcvDate], [StoreId], [VendorId], [PoNo], [PoDate], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (46, N'MRN-240425-01', NULL, N'fg', NULL, N'MRCHLN-240425-01', NULL, NULL, 2, 2, N'wrw', CAST(N'2024-04-25' AS Date), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksMt] ([StockId], [MaterialReceiptNote], [MRNDate], [BillNo], [BillDate], [MRNChallanNo], [MRNChallanDate], [RcvDate], [StoreId], [VendorId], [PoNo], [PoDate], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1046, N'MRN-240507-01', NULL, N'4', NULL, N'MRCHLN-240507-01', NULL, NULL, 1, 2, N'3', CAST(N'2024-05-09' AS Date), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[StocksMt] ([StockId], [MaterialReceiptNote], [MRNDate], [BillNo], [BillDate], [MRNChallanNo], [MRNChallanDate], [RcvDate], [StoreId], [VendorId], [PoNo], [PoDate], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2046, N'MRN-240522-01', NULL, N'544', CAST(N'2024-05-22' AS Date), N'MRCHLN-240522-01', CAST(N'2024-05-22' AS Date), CAST(N'2024-05-22' AS Date), 4, 2, N'5', CAST(N'2024-05-22' AS Date), NULL, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T10:01:00' AS SmallDateTime), N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T10:03:00' AS SmallDateTime))
INSERT [dbo].[StocksMt] ([StockId], [MaterialReceiptNote], [MRNDate], [BillNo], [BillDate], [MRNChallanNo], [MRNChallanDate], [RcvDate], [StoreId], [VendorId], [PoNo], [PoDate], [Remarks], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (2047, N'MRN-240522-02', NULL, N'44', NULL, N'MRCHLN-240522-02', NULL, NULL, 334, 34, N'34', NULL, NULL, N'aacea57e-6c06-4fc1-ba4e-b93e140bb7e3', CAST(N'2024-05-22T12:03:00' AS SmallDateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[StocksMt] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkOrders] ON 

INSERT [dbo].[WorkOrders] ([WorkOrderId], [WorkOrderNo], [QuotationId], [WorkOrderDate], [Deadline], [Details], [Currency], [QuotationNetTotal], [QuotationGrandTotal], [WorkOrderAmount], [Remarks], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1073, N'WO-240505-01', 2073, CAST(N'2024-05-05T10:29:00' AS SmallDateTime), CAST(N'2024-05-05T10:29:00' AS SmallDateTime), N'dfsd', N'BDT', CAST(398.00 AS Numeric(18, 2)), CAST(441.54 AS Numeric(18, 2)), CAST(441.54 AS Numeric(18, 2)), N'sdfs', N'Pending', NULL, NULL, NULL, NULL)
INSERT [dbo].[WorkOrders] ([WorkOrderId], [WorkOrderNo], [QuotationId], [WorkOrderDate], [Deadline], [Details], [Currency], [QuotationNetTotal], [QuotationGrandTotal], [WorkOrderAmount], [Remarks], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1074, N'WO-240505-02', 2074, CAST(N'2024-05-05T10:29:00' AS SmallDateTime), CAST(N'2024-05-05T10:29:00' AS SmallDateTime), N'sdfsd', N'USD', CAST(997.00 AS Numeric(18, 2)), CAST(1099.84 AS Numeric(18, 2)), CAST(1099.84 AS Numeric(18, 2)), N'sdf', N'Pending', NULL, NULL, NULL, NULL)
INSERT [dbo].[WorkOrders] ([WorkOrderId], [WorkOrderNo], [QuotationId], [WorkOrderDate], [Deadline], [Details], [Currency], [QuotationNetTotal], [QuotationGrandTotal], [WorkOrderAmount], [Remarks], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1075, N'WO-240505-03', 2075, CAST(N'2024-05-05T10:29:00' AS SmallDateTime), CAST(N'2024-05-05T10:29:00' AS SmallDateTime), N'sdfs', N'BDT', CAST(385.00 AS Numeric(18, 2)), CAST(424.93 AS Numeric(18, 2)), CAST(424.93 AS Numeric(18, 2)), N'sdfs', N'Pending', NULL, NULL, NULL, NULL)
INSERT [dbo].[WorkOrders] ([WorkOrderId], [WorkOrderNo], [QuotationId], [WorkOrderDate], [Deadline], [Details], [Currency], [QuotationNetTotal], [QuotationGrandTotal], [WorkOrderAmount], [Remarks], [ChallanStatus], [AddedBy], [AddedDate], [UpdatedBy], [UpdatedDate]) VALUES (1076, N'WO-240521-01', 2076, CAST(N'2024-05-21T16:46:00' AS SmallDateTime), CAST(N'2024-05-21T16:46:00' AS SmallDateTime), N'dfsdf', N'BDT', CAST(150.00 AS Numeric(18, 2)), CAST(189.00 AS Numeric(18, 2)), CAST(189.00 AS Numeric(18, 2)), N'sdf', N'Pending', N'29fb8205-05ae-4ec7-a60a-b7bb91b334fa', CAST(N'2024-05-21T16:46:00' AS SmallDateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[WorkOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Zones] ON 

INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4168, N'karnafully-5', NULL, NULL, CAST(N'2024-01-21T18:26:00' AS SmallDateTime), NULL, NULL, N'ZO-240121-08', 1004)
INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4169, N'Block', NULL, NULL, CAST(N'2024-01-21T18:38:00' AS SmallDateTime), CAST(N'2024-01-21T18:39:00' AS SmallDateTime), NULL, N'ZO-240121-09', 1005)
INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4170, N'Bridge Ghath', NULL, NULL, CAST(N'2024-01-21T21:56:00' AS SmallDateTime), CAST(N'2024-01-21T21:57:00' AS SmallDateTime), NULL, N'ZO-240121-10', 1004)
INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4171, N'Danga Char', NULL, NULL, CAST(N'2024-01-22T09:45:00' AS SmallDateTime), NULL, NULL, N'ZO-240122-01', 1004)
INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4172, N'sdjflsaj', NULL, NULL, CAST(N'2024-01-22T15:10:00' AS SmallDateTime), CAST(N'2024-01-22T15:11:00' AS SmallDateTime), NULL, N'ZO-240122-02', 1004)
INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4173, N'sdfsd', NULL, NULL, CAST(N'2024-01-22T15:11:00' AS SmallDateTime), NULL, NULL, N'ZO-240122-03', 1004)
INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4174, N'sdfs', NULL, NULL, CAST(N'2024-01-22T15:57:00' AS SmallDateTime), NULL, NULL, N'ZO-240122-04', 1004)
INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4175, N'hello', NULL, NULL, CAST(N'2024-01-22T21:23:00' AS SmallDateTime), NULL, NULL, N'ZO-240122-05', 1004)
INSERT [dbo].[Zones] ([ZoneId], [ZoneName], [AddedBy], [UpdatedBy], [AddedDate], [UpdatedDate], [Remarks], [TrackZoneId], [TerritorySetupDT_Id]) VALUES (4176, N'dfgdg', NULL, NULL, CAST(N'2024-01-22T23:44:00' AS SmallDateTime), NULL, NULL, N'ZO-240122-06', 1004)
SET IDENTITY_INSERT [dbo].[Zones] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 6/8/2024 2:42:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/8/2024 2:42:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 6/8/2024 2:42:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 6/8/2024 2:42:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 6/8/2024 2:42:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 6/8/2024 2:42:24 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/8/2024 2:42:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ChallansDt]  WITH CHECK ADD  CONSTRAINT [FK_Challan_WorkOrdersId] FOREIGN KEY([WorkOrderId])
REFERENCES [dbo].[WorkOrders] ([WorkOrderId])
GO
ALTER TABLE [dbo].[ChallansDt] CHECK CONSTRAINT [FK_Challan_WorkOrdersId]
GO
ALTER TABLE [dbo].[ChallansDt]  WITH CHECK ADD  CONSTRAINT [FK_ChallanID] FOREIGN KEY([ChallanId])
REFERENCES [dbo].[ChallansMt] ([ChallanId])
GO
ALTER TABLE [dbo].[ChallansDt] CHECK CONSTRAINT [FK_ChallanID]
GO
ALTER TABLE [dbo].[ChallansDt]  WITH CHECK ADD  CONSTRAINT [FK_StockdtIdd] FOREIGN KEY([StockdtId])
REFERENCES [dbo].[StocksDt] ([StockdtId])
GO
ALTER TABLE [dbo].[ChallansDt] CHECK CONSTRAINT [FK_StockdtIdd]
GO
ALTER TABLE [dbo].[ChallansMt]  WITH CHECK ADD  CONSTRAINT [FK_Challan_QuotationId] FOREIGN KEY([QuotationId])
REFERENCES [dbo].[QuotationsMT] ([QuotationId])
GO
ALTER TABLE [dbo].[ChallansMt] CHECK CONSTRAINT [FK_Challan_QuotationId]
GO
ALTER TABLE [dbo].[ChallansMt]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrderid] FOREIGN KEY([WorkOrderId])
REFERENCES [dbo].[WorkOrders] ([WorkOrderId])
GO
ALTER TABLE [dbo].[ChallansMt] CHECK CONSTRAINT [FK_WorkOrderid]
GO
ALTER TABLE [dbo].[QuotationsDT]  WITH CHECK ADD  CONSTRAINT [FK_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ProductInfosSetup] ([ProductId])
GO
ALTER TABLE [dbo].[QuotationsDT] CHECK CONSTRAINT [FK_ProductId]
GO
ALTER TABLE [dbo].[QuotationsDT]  WITH CHECK ADD  CONSTRAINT [FK_QuatationId] FOREIGN KEY([QuotationId])
REFERENCES [dbo].[QuotationsMT] ([QuotationId])
GO
ALTER TABLE [dbo].[QuotationsDT] CHECK CONSTRAINT [FK_QuatationId]
GO
ALTER TABLE [dbo].[QuotationsMT]  WITH CHECK ADD  CONSTRAINT [FK_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyInfosSetup] ([CompanyId])
GO
ALTER TABLE [dbo].[QuotationsMT] CHECK CONSTRAINT [FK_CompanyId]
GO
ALTER TABLE [dbo].[QuotationsMT]  WITH CHECK ADD  CONSTRAINT [FK_ContactPersonId] FOREIGN KEY([ContactPersonId])
REFERENCES [dbo].[ContactPersonInfosSetup] ([ContactPersonId])
GO
ALTER TABLE [dbo].[QuotationsMT] CHECK CONSTRAINT [FK_ContactPersonId]
GO
ALTER TABLE [dbo].[QuotationsMT]  WITH CHECK ADD  CONSTRAINT [FK_Currency_Stdt] FOREIGN KEY([Currency_Stdt])
REFERENCES [dbo].[SetupDT_Datas] ([SetupDT_Id])
GO
ALTER TABLE [dbo].[QuotationsMT] CHECK CONSTRAINT [FK_Currency_Stdt]
GO
ALTER TABLE [dbo].[QuotationsMT]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeId_SetupDetail_Id] FOREIGN KEY([ProjectTypeId_Stdt])
REFERENCES [dbo].[SetupDT_Datas] ([SetupDT_Id])
GO
ALTER TABLE [dbo].[QuotationsMT] CHECK CONSTRAINT [FK_ProjectTypeId_SetupDetail_Id]
GO
ALTER TABLE [dbo].[QuotationsMT]  WITH CHECK ADD  CONSTRAINT [FK_QuotationStatus_Stdt] FOREIGN KEY([QuotationStatus_Stdt])
REFERENCES [dbo].[SetupDT_Datas] ([SetupDT_Id])
GO
ALTER TABLE [dbo].[QuotationsMT] CHECK CONSTRAINT [FK_QuotationStatus_Stdt]
GO
ALTER TABLE [dbo].[QuotationsMT]  WITH CHECK ADD  CONSTRAINT [FK_SignedById_emloyeesetup] FOREIGN KEY([SignedById])
REFERENCES [dbo].[EmployeeInfosSetup] ([EmpId])
GO
ALTER TABLE [dbo].[QuotationsMT] CHECK CONSTRAINT [FK_SignedById_emloyeesetup]
GO
ALTER TABLE [dbo].[QuotationsMT]  WITH CHECK ADD  CONSTRAINT [FK_ToClientDesigId_stdt] FOREIGN KEY([ToClientDesigId_Stdt])
REFERENCES [dbo].[SetupDT_Datas] ([SetupDT_Id])
GO
ALTER TABLE [dbo].[QuotationsMT] CHECK CONSTRAINT [FK_ToClientDesigId_stdt]
GO
ALTER TABLE [dbo].[SetupDT_Datas]  WITH CHECK ADD  CONSTRAINT [FK_SetupMT_Id] FOREIGN KEY([SetupMT_Id])
REFERENCES [dbo].[SetupMT_Datas] ([SetupMT_Id])
GO
ALTER TABLE [dbo].[SetupDT_Datas] CHECK CONSTRAINT [FK_SetupMT_Id]
GO
ALTER TABLE [dbo].[StocksDt]  WITH CHECK ADD  CONSTRAINT [FK_ProductIdStock] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ProductInfosSetup] ([ProductId])
GO
ALTER TABLE [dbo].[StocksDt] CHECK CONSTRAINT [FK_ProductIdStock]
GO
ALTER TABLE [dbo].[StocksDt]  WITH CHECK ADD  CONSTRAINT [FK_StockId] FOREIGN KEY([StockId])
REFERENCES [dbo].[StocksMt] ([StockId])
GO
ALTER TABLE [dbo].[StocksDt] CHECK CONSTRAINT [FK_StockId]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_QuotationId] FOREIGN KEY([QuotationId])
REFERENCES [dbo].[QuotationsMT] ([QuotationId])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_QuotationId]
GO
ALTER TABLE [dbo].[Zones]  WITH CHECK ADD  CONSTRAINT [FK_Territory_SetupDT_Id] FOREIGN KEY([TerritorySetupDT_Id])
REFERENCES [dbo].[SetupDT_Datas] ([SetupDT_Id])
GO
ALTER TABLE [dbo].[Zones] CHECK CONSTRAINT [FK_Territory_SetupDT_Id]
GO
/****** Object:  StoredProcedure [dbo].[SP_ChallanDtInsertData]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ChallanDtInsertData]
    @StockdtId int,
	@ProductId int,
	@ChallanId int,
	@WorkOrderId int,
	@AddedBy nvarchar(450),
	@AddedDate smalldatetime
AS
BEGIN


	INSERT INTO ChallansDt(ChallanId,ProductId,StockdtId,WorkOrderId,AddedBy,AddedDate)
	  VALUES (@ChallanId,@ProductId,@StockdtId,@WorkOrderId,@AddedBy,@AddedDate)

	 Update StocksDt
	set ChallanStatus='Y'
	where StockdtId=@StockdtId
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertChallansDt]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertChallansDt]
(
    @FromStockIdSelected int,
    @ToStockIdSelected int,
    @ChallanId int,
    @ProductId int,
	@WorkOrderId int,  
	@AddedBy nvarchar(450),
	@AddedDate smalldatetime
)
AS 
BEGIN
    IF @FromStockIdSelected <= @ToStockIdSelected
    BEGIN
        INSERT INTO ChallansDt (ChallanId, ProductId, StockDtId,WorkOrderId,AddedBy,AddedDate)
        SELECT @ChallanId, @ProductId, StockDtId ,@WorkOrderId,@AddedBy,@AddedDate
        FROM StocksDt
        WHERE StockDtId BETWEEN @FromStockIdSelected AND @ToStockIdSelected

		Update StocksDt
		set ChallanStatus='Y'
		WHERE StockDtId BETWEEN @FromStockIdSelected AND @ToStockIdSelected
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RoleAssignToUser]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RoleAssignToUser]
    --@UserId UNIQUEIDENTIFIER,
    --@RoleId UNIQUEIDENTIFIER

 @UserId nvarchar(450),
 @RoleId nvarchar(450)
AS
BEGIN
    INSERT INTO AspNetUserRoles (UserId, RoleId)
    VALUES (@UserId, @RoleId);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_StockDtInsertData]    Script Date: 6/8/2024 2:42:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_StockDtInsertData]
    @FromNumber INT,
    @ToNumber INT,
    @Prefix VARCHAR(10)=NULL,
	@Postfix VARCHAR(10)=NULL,
	@StockId INT,
	@ProductId INT,
	@AddedBy nvarchar(450),
	@AddedDate smalldatetime
AS
BEGIN
    IF @FromNumber <= @ToNumber
    BEGIN
        DECLARE @Counter INT ,@CountQuantity INT
        SET @Counter = @FromNumber
		SET @CountQuantity=0

        WHILE @Counter <= @ToNumber
        BEGIN
            INSERT INTO StocksDt (StockId,Status,ProductId,ProdQuantity,SerialNo,SerialId,ChallanStatus,AddedBy,AddedDate)
            VALUES (@StockId,'New',@ProductId,1,CONCAT(@Prefix, @Counter,@Postfix),@Counter,'N',@AddedBy,@AddedDate)
            SET @Counter = @Counter + 1
			SET @CountQuantity=@CountQuantity + 1
        END
    END
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[60] 4[1] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "q"
            Begin Extent = 
               Top = 180
               Left = 651
               Bottom = 343
               Right = 886
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "w"
            Begin Extent = 
               Top = 33
               Left = 225
               Bottom = 196
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "qd"
            Begin Extent = 
               Top = 276
               Left = 360
               Bottom = 439
               Right = 554
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 245
               Left = 50
               Bottom = 408
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 637
               Left = 355
               Bottom = 800
               Right = 549
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChallansMt"
            Begin Extent = 
               Top = 7
               Left = 932
               Bottom = 170
               Right = 1126
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ExistingStockProd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ExistingStockProd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ExistingStockProd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[40] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -360
         Left = 0
      End
      Begin Tables = 
         Begin Table = "d"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 75
               Left = 557
               Bottom = 238
               Right = 806
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 227
               Left = 287
               Bottom = 461
               Right = 497
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_StockMrProdDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_StockMrProdDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[12] 2[37] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -731
         Left = 0
      End
      Begin Tables = 
         Begin Table = "w"
            Begin Extent = 
               Top = 149
               Left = 710
               Bottom = 312
               Right = 946
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 114
               Left = 277
               Bottom = 277
               Right = 512
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 54
               Left = 0
               Bottom = 217
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 716
               Right = 300
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 99
               Left = 1120
               Bottom = 341
               Right = 1314
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 362
               Left = 320
               Bottom = 525
               Right = 514
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cd_1"
            Begin Extent = 
               Top = 487
               Left = 562
               Bottom = 628
               Right = 772
            End
            DisplayFlags = 280
            TopColumn = 0
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_WorkOrderProdDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4140
         Alias = 2076
         Table = 2604
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_WorkOrderProdDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_WorkOrderProdDetails'
GO
USE [master]
GO
ALTER DATABASE [InventoryWeb] SET  READ_WRITE 
GO
