USE [master]
GO
/****** Object:  Database [stockmaster]    Script Date: 7/1/2023 11:14:20 AM ******/
CREATE DATABASE [stockmaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
GO
ALTER DATABASE [stockmaster] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [stockmaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [stockmaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [stockmaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [stockmaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [stockmaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [stockmaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [stockmaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [stockmaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [stockmaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [stockmaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [stockmaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [stockmaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [stockmaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [stockmaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [stockmaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [stockmaster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [stockmaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [stockmaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [stockmaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [stockmaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [stockmaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [stockmaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [stockmaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [stockmaster] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [stockmaster] SET  MULTI_USER 
GO
ALTER DATABASE [stockmaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [stockmaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [stockmaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [stockmaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [stockmaster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [stockmaster] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [stockmaster] SET QUERY_STORE = ON
GO
ALTER DATABASE [stockmaster] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [stockmaster]
GO
/****** Object:  Table [dbo].[master_action]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_action](
	[action_id] [char](5) NOT NULL,
	[action_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_master_action] PRIMARY KEY CLUSTERED 
(
	[action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master_division]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_division](
	[division_id] [char](5) NOT NULL,
	[division_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_master_division] PRIMARY KEY CLUSTERED 
(
	[division_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master_item]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_item](
	[item_id] [char](10) NOT NULL,
	[item_name] [varchar](max) NOT NULL,
	[item_description] [varchar](max) NOT NULL,
	[item_qty_per_lot] [varchar](50) NOT NULL,
	[item_price] [varchar](50) NOT NULL,
	[item_max_stock] [varchar](50) NOT NULL,
	[item_min_stock] [varchar](50) NOT NULL,
	[item_supplier_id] [char](10) NOT NULL,
	[create_date] [datetime] NULL,
	[create_by] [varchar](50) NULL,
	[update_date] [datetime] NULL,
	[update_by] [varchar](50) NULL,
	[item_actual_qty] [varchar](50) NULL,
 CONSTRAINT [PK_master_item] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master_level]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_level](
	[level_id] [char](2) NOT NULL,
	[level_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_master_level] PRIMARY KEY CLUSTERED 
(
	[level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master_shelf]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_shelf](
	[shelf_id] [char](10) NOT NULL,
	[shelf_name] [varchar](50) NOT NULL,
	[shelf_description] [varchar](max) NULL,
	[create_date] [datetime] NULL,
	[create_by] [varchar](50) NULL,
	[update_date] [datetime] NULL,
	[update_by] [varchar](50) NULL,
 CONSTRAINT [PK_master_shelf] PRIMARY KEY CLUSTERED 
(
	[shelf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master_supplier]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_supplier](
	[supplier_id] [char](10) NOT NULL,
	[supplier_name] [varchar](max) NOT NULL,
	[supplier_email] [varchar](max) NULL,
	[supplier_address] [varchar](max) NOT NULL,
	[supplier_contact] [varchar](50) NULL,
	[create_date] [datetime] NULL,
	[create_by] [varchar](50) NULL,
	[update_date] [datetime] NULL,
	[update_by] [varchar](50) NULL,
 CONSTRAINT [PK_master_supplier] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master_user]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_user](
	[user_id] [varchar](50) NOT NULL,
	[user_name] [varchar](max) NOT NULL,
	[user_password] [varchar](max) NOT NULL,
	[user_level_id] [char](2) NOT NULL,
	[user_division_id] [char](5) NOT NULL,
	[create_date] [datetime] NULL,
	[create_by] [varchar](50) NULL,
	[update_date] [datetime] NULL,
	[update_by] [varchar](50) NULL,
 CONSTRAINT [PK_master_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction_order]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_order](
	[t_order_id] [char](10) NOT NULL,
	[t_order_item_id] [char](10) NULL,
	[t_order_item_qty] [varchar](50) NULL,
	[t_order_item_price] [varchar](max) NULL,
	[t_order_supplier_id] [char](10) NULL,
	[t_order_date] [datetime] NULL,
	[t_order_by] [varchar](50) NULL,
	[t_order_status] [varchar](50) NULL,
 CONSTRAINT [PK_transaction_order] PRIMARY KEY CLUSTERED 
(
	[t_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction_stock]    Script Date: 7/1/2023 11:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_stock](
	[t_stock_id] [char](10) NOT NULL,
	[t_stock_item_id] [char](10) NULL,
	[t_stock_action_id] [char](10) NULL,
	[t_stock_action_qty] [varchar](50) NULL,
	[t_stock_update_date] [datetime] NULL,
	[t_stock_update_by] [varchar](50) NULL,
	[t_stock_actual_qty] [varchar](50) NULL,
 CONSTRAINT [PK_transaction_stock] PRIMARY KEY CLUSTERED 
(
	[t_stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[master_action] ([action_id], [action_name]) VALUES (N'ACT01', N'ADD USER')
INSERT [dbo].[master_action] ([action_id], [action_name]) VALUES (N'ACT02', N'STOCK IN')
INSERT [dbo].[master_action] ([action_id], [action_name]) VALUES (N'ACT03', N'STOCK OUT')
INSERT [dbo].[master_action] ([action_id], [action_name]) VALUES (N'ACT04', N'STOCK ORDER')
INSERT [dbo].[master_action] ([action_id], [action_name]) VALUES (N'ACT05', N'LOGIN')
INSERT [dbo].[master_action] ([action_id], [action_name]) VALUES (N'ACT06', N'LOGOUT')
GO
INSERT [dbo].[master_division] ([division_id], [division_name]) VALUES (N'DIV01', N'WAREHOUSE')
INSERT [dbo].[master_division] ([division_id], [division_name]) VALUES (N'DIV02', N'PRODUCTION SHIRT')
INSERT [dbo].[master_division] ([division_id], [division_name]) VALUES (N'DIV03', N'PRODUCTION JACKET')
INSERT [dbo].[master_division] ([division_id], [division_name]) VALUES (N'DIV04', N'PRODUCTION SHOES')
GO
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM1     ', N'KAIN KATUN', N'KAIN YANG TERBUAT DARI KATUN', N'10', N'100000', N'100', N'30', N'SUPL2     ', NULL, N'admin', CAST(N'2023-06-25T06:03:59.490' AS DateTime), N'admin', N'100')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM10    ', N'KAIN HIJAU', N'KAIN WARNA HIJAU', N'5', N'50000', N'100', N'15', N'SUPL3     ', CAST(N'2023-06-25T05:47:28.227' AS DateTime), N'admin', CAST(N'2023-06-25T06:01:58.560' AS DateTime), N'admin', N'75')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM11    ', N'KAIN PUTIH', N'KAIN WARNA PUTIH', N'5', N'50000', N'100', N'15', N'SUPL3     ', CAST(N'2023-06-25T06:10:37.870' AS DateTime), N'admin', CAST(N'2023-06-25T06:10:59.290' AS DateTime), N'admin', N'85')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM12    ', N'KAIN HITAM', N'KAIN WARNA HITAM', N'5', N'50000', N'100', N'15', N'SUPL3     ', CAST(N'2023-06-25T13:37:38.233' AS DateTime), N'admin', CAST(N'2023-06-25T13:39:27.600' AS DateTime), N'admin', N'85')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM2     ', N'KAIN SUTRA', N'KAIN YANG TERBUAT DARI SUTRA', N'10', N'90000', N'100', N'30', N'SUPL1     ', NULL, N'admin', CAST(N'2023-06-25T06:11:35.260' AS DateTime), N'admin', N'100')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM3     ', N'KAIN DENIM', N'KAIN YANG BIASA DIGUNAKAN UTUK MEMBUAT CELANA JEANS', N'10', N'120000', N'100', N'30', N'SUPL1     ', NULL, N'admin', CAST(N'2023-06-25T06:02:12.470' AS DateTime), N'admin', N'70')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM4     ', N'BENANG PUTIH', N'BENANG DENGAN WARNA PUTIH', N'100', N'75000', N'1000', N'200', N'SUPL2     ', CAST(N'2023-06-20T05:48:14.080' AS DateTime), N'2180987', CAST(N'2023-06-25T06:02:14.857' AS DateTime), N'admin', N'700')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM5     ', N'ZIPPER SMALL', N'ZIPPER KECIL UNTUK CELANA', N'200', N'35000', N'2000', N'400', N'SUPL1     ', CAST(N'2023-06-22T03:13:19.980' AS DateTime), N'2180987', CAST(N'2023-06-25T06:02:18.367' AS DateTime), N'admin', N'1400')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM6     ', N'ZIPPER PANJANG', N'ZIPPER UNTUK TAS', N'150', N'40000', N'1500', N'300', N'SUPL1     ', CAST(N'2023-06-22T03:40:03.780' AS DateTime), N'2180987', CAST(N'2023-06-25T06:02:24.720' AS DateTime), N'admin', N'1050')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM7     ', N'KAIN MERAH', N'KAIN WARNA MERAH', N'5', N'50000', N'100', N'15', N'SUPL3     ', CAST(N'2023-06-25T05:41:46.533' AS DateTime), N'admin', CAST(N'2023-06-25T06:03:46.240' AS DateTime), N'admin', N'100')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM8     ', N'KAIN KUNING', N'KAIN WARNA KUNING', N'5', N'50000', N'100', N'15', N'SUPL3     ', CAST(N'2023-06-25T05:46:09.827' AS DateTime), N'admin', CAST(N'2023-06-25T06:02:44.410' AS DateTime), N'admin', N'60')
INSERT [dbo].[master_item] ([item_id], [item_name], [item_description], [item_qty_per_lot], [item_price], [item_max_stock], [item_min_stock], [item_supplier_id], [create_date], [create_by], [update_date], [update_by], [item_actual_qty]) VALUES (N'ITEM9     ', N'KAIN BIRU', N'KAIN WARNA BIRU', N'5', N'50000', N'100', N'15', N'SUPL3     ', CAST(N'2023-06-25T05:47:10.490' AS DateTime), N'admin', CAST(N'2023-06-25T06:02:40.867' AS DateTime), N'admin', N'65')
GO
INSERT [dbo].[master_level] ([level_id], [level_name]) VALUES (N'L1', N'USER')
INSERT [dbo].[master_level] ([level_id], [level_name]) VALUES (N'L2', N'LEADER')
INSERT [dbo].[master_level] ([level_id], [level_name]) VALUES (N'L3', N'Admin')
GO
INSERT [dbo].[master_shelf] ([shelf_id], [shelf_name], [shelf_description], [create_date], [create_by], [update_date], [update_by]) VALUES (N'SHELF1    ', N'SHELF A1', N'TEMPAT PENYIMPANAN KHUSUS KAIN', NULL, NULL, NULL, NULL)
INSERT [dbo].[master_shelf] ([shelf_id], [shelf_name], [shelf_description], [create_date], [create_by], [update_date], [update_by]) VALUES (N'SHELF2    ', N'SHELF A2', N'TEMPAT PENYIMPANAN KHUSUS BENAN', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[master_supplier] ([supplier_id], [supplier_name], [supplier_email], [supplier_address], [supplier_contact], [create_date], [create_by], [update_date], [update_by]) VALUES (N'SUPL1     ', N'PT ANDIKA SEJAHTERA', N'andikasejahtera@gmail.com', N'JL IRAQ KECAMATAN TEHERAN', N'012345678912', NULL, N'admin', NULL, N'admin')
INSERT [dbo].[master_supplier] ([supplier_id], [supplier_name], [supplier_email], [supplier_address], [supplier_contact], [create_date], [create_by], [update_date], [update_by]) VALUES (N'SUPL2     ', N'PT KATUN TURKI', N'katunturki01@gmail.com', N'JALAN RAYA ISTANBUL', N'987654321123', CAST(N'2023-06-20T04:47:04.563' AS DateTime), N'2180987', CAST(N'2023-06-20T04:47:04.563' AS DateTime), N'2180987')
INSERT [dbo].[master_supplier] ([supplier_id], [supplier_name], [supplier_email], [supplier_address], [supplier_contact], [create_date], [create_by], [update_date], [update_by]) VALUES (N'SUPL3     ', N'PT SERIBU KAIN', N'seribukain@outlook.com', N'JL MOSCOW RUSIA', N'04563217896', CAST(N'2023-06-25T05:39:54.890' AS DateTime), N'admin', CAST(N'2023-06-25T05:39:54.890' AS DateTime), N'admin')
GO
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180987', N'Admin', N'73acd9a5972130b75066c82595a1fae3', N'L2', N'DIV01', CAST(N'2023-06-20T01:52:54.263' AS DateTime), N'', CAST(N'2023-06-20T01:52:54.263' AS DateTime), N'')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180988', N'Joko', N'88ff858bd0b28a5c058a6e298d647a40', N'L2', N'DIV01', CAST(N'2023-06-20T01:55:16.200' AS DateTime), N'', CAST(N'2023-06-20T01:55:16.200' AS DateTime), N'')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180989', N'Agus', N'f0224a9ff017e484c8a7c9859678b044', N'L1', N'DIV01', CAST(N'2023-06-20T01:56:20.733' AS DateTime), N'', CAST(N'2023-06-20T01:56:20.733' AS DateTime), N'')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180990', N'Budi', N'a61bd9ff8e7358d7ec9058af7d597e9d', N'L2', N'DIV02', CAST(N'2023-06-20T02:04:07.050' AS DateTime), N'', CAST(N'2023-06-20T02:04:07.050' AS DateTime), N'')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180991', N'Asep', N'41bc5715c8c5aa6c5d453181e8fff916', N'L2', N'DIV03', CAST(N'2023-06-20T02:05:45.593' AS DateTime), N'', CAST(N'2023-06-20T02:05:45.593' AS DateTime), N'')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180992', N'Ucup', N'3fc7f3ef71444cdbe27696757b4fd7ed', N'L2', N'DIV04', CAST(N'2023-06-20T02:11:33.723' AS DateTime), N'', CAST(N'2023-06-20T02:11:33.723' AS DateTime), N'')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180993', N'Havid', N'7f1e3871f1402f4a0bb0ec33f12b1da9', N'L2', N'DIV03', CAST(N'2023-06-20T02:12:25.607' AS DateTime), N'2180987', CAST(N'2023-06-20T02:12:25.607' AS DateTime), N'2180987')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180994', N'Rama', N'6a42a7a9d38150dd930ffb398151496f', N'L1', N'DIV03', CAST(N'2023-06-20T02:16:10.647' AS DateTime), N'2180987', CAST(N'2023-06-20T02:16:10.647' AS DateTime), N'2180987')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180995', N'Pran', N'fda336c9a9d0fc318f86aec1e666bf08', N'L1', N'DIV02', CAST(N'2023-06-20T02:33:34.300' AS DateTime), N'2180987', CAST(N'2023-06-20T02:33:34.300' AS DateTime), N'2180987')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'2180996', N'Yusuf', N'e565ea2e2d400b6461382ca1fce17391', N'L1', N'DIV02', CAST(N'2023-06-20T04:42:11.753' AS DateTime), N'2180987', CAST(N'2023-06-20T04:42:11.753' AS DateTime), N'2180987')
INSERT [dbo].[master_user] ([user_id], [user_name], [user_password], [user_level_id], [user_division_id], [create_date], [create_by], [update_date], [update_by]) VALUES (N'admin', N'Admin', N'73acd9a5972130b75066c82595a1fae3', N'L2', N'DIV01', CAST(N'2023-06-25T05:36:53.843' AS DateTime), N'2180987', CAST(N'2023-06-25T05:36:53.843' AS DateTime), N'2180987')
GO
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER1    ', N'ITEM1     ', N'70', N'700000', N'SUPL2     ', CAST(N'2023-06-23T04:51:17.137' AS DateTime), N'2180987', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER10   ', N'ITEM12    ', N'85', N'850000', N'SUPL3     ', CAST(N'2023-06-25T13:38:32.927' AS DateTime), N'admin', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER2    ', N'ITEM6     ', N'1200', N'320000', N'SUPL1     ', CAST(N'2023-06-23T04:55:42.557' AS DateTime), N'2180987', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER3    ', N'ITEM2     ', N'80', N'720000', N'SUPL1     ', CAST(N'2023-06-23T06:14:16.733' AS DateTime), N'2180987', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER4    ', N'ITEM3     ', N'70', N'840000', N'SUPL1     ', CAST(N'2023-06-24T04:12:27.303' AS DateTime), N'2180987', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER5    ', N'ITEM4     ', N'800', N'600000', N'SUPL2     ', CAST(N'2023-06-24T09:16:48.670' AS DateTime), N'2180987', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER6    ', N'ITEM5     ', N'1600', N'280000', N'SUPL1     ', CAST(N'2023-06-24T10:06:36.013' AS DateTime), N'2180987', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER7    ', N'ITEM7     ', N'85', N'850000', N'SUPL3     ', CAST(N'2023-06-25T06:03:18.980' AS DateTime), N'admin', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER8    ', N'ITEM1     ', N'70', N'700000', N'SUPL2     ', CAST(N'2023-06-25T06:03:19.820' AS DateTime), N'admin', N'CLOSE')
INSERT [dbo].[transaction_order] ([t_order_id], [t_order_item_id], [t_order_item_qty], [t_order_item_price], [t_order_supplier_id], [t_order_date], [t_order_by], [t_order_status]) VALUES (N'ORDER9    ', N'ITEM2     ', N'70', N'630000', N'SUPL1     ', CAST(N'2023-06-25T06:11:16.690' AS DateTime), N'admin', N'CLOSE')
GO
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK1    ', N'ITEM1     ', N'ACT02     ', N'100', NULL, N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK10   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-22T01:49:56.707' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK100  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-24T09:16:35.210' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK101  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-24T09:16:36.050' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK102  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-24T09:16:37.040' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK103  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-24T09:16:38.440' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK104  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-24T09:16:40.150' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK105  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-24T09:16:42.473' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK106  ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-24T09:16:56.947' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK107  ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-24T09:16:58.350' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK108  ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-24T09:16:59.297' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK109  ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-24T09:17:00.870' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK11   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:36:41.833' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK110  ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-24T09:17:01.957' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK111  ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-24T09:17:03.123' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK112  ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-24T09:17:04.297' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK113  ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-24T09:17:05.350' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK114  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-24T10:06:13.620' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK115  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-24T10:06:15.810' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK116  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-24T10:06:20.760' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK117  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-24T10:06:26.930' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK118  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-24T10:06:31.560' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK119  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-24T10:06:32.897' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK12   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:40:58.780' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK120  ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-24T10:06:42.787' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK121  ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-24T10:06:43.723' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK122  ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-24T10:06:44.470' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK123  ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-24T10:06:45.297' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK124  ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-24T10:06:46.157' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK125  ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-24T10:06:47.010' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK126  ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-24T10:06:47.860' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK127  ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-24T10:06:48.747' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK128  ', N'ITEM10    ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:01:33.150' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK129  ', N'ITEM10    ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:01:48.010' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK13   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:01.660' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK130  ', N'ITEM10    ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:01:50.847' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK131  ', N'ITEM10    ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:01:57.403' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK132  ', N'ITEM10    ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:01:58.563' AS DateTime), N'admin', N'75')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK133  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:01.247' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK134  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:02.183' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK135  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:03.097' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK136  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:04.010' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK137  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:04.953' AS DateTime), N'admin', N'75')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK138  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:05.883' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK139  ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:07.503' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK14   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:04.527' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK140  ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:08.477' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK141  ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:09.227' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK142  ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:10.660' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK143  ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:11.613' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK144  ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:12.473' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK145  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-25T06:02:13.247' AS DateTime), N'admin', N'900')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK146  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-25T06:02:14.067' AS DateTime), N'admin', N'800')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK147  ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-25T06:02:14.857' AS DateTime), N'admin', N'700')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK148  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-25T06:02:15.693' AS DateTime), N'admin', N'1800')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK149  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-25T06:02:17.477' AS DateTime), N'admin', N'1600')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK15   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:06.807' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK150  ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-25T06:02:18.370' AS DateTime), N'admin', N'1400')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK151  ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:19.873' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK152  ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:20.710' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK153  ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:21.583' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK154  ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-25T06:02:23.170' AS DateTime), N'admin', N'1350')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK155  ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-25T06:02:23.943' AS DateTime), N'admin', N'1200')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK156  ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-25T06:02:24.720' AS DateTime), N'admin', N'1050')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK157  ', N'ITEM8     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:25.997' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK158  ', N'ITEM8     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:26.813' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK159  ', N'ITEM8     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:27.600' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK16   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:09.347' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK160  ', N'ITEM8     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:28.527' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK161  ', N'ITEM9     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:29.393' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK162  ', N'ITEM9     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:30.227' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK163  ', N'ITEM9     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:31.047' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK164  ', N'ITEM9     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:32.080' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK165  ', N'ITEM9     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:32.960' AS DateTime), N'admin', N'75')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK166  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:34.570' AS DateTime), N'admin', N'65')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK167  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:35.437' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK168  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:36.227' AS DateTime), N'admin', N'55')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK169  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:37.260' AS DateTime), N'admin', N'50')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK17   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:11.387' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK170  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:38.083' AS DateTime), N'admin', N'45')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK171  ', N'ITEM9     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:39.897' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK172  ', N'ITEM9     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:40.873' AS DateTime), N'admin', N'65')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK173  ', N'ITEM8     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:41.697' AS DateTime), N'admin', N'75')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK174  ', N'ITEM8     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:42.663' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK175  ', N'ITEM8     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:43.423' AS DateTime), N'admin', N'65')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK176  ', N'ITEM8     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:02:44.410' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK177  ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:02:46.040' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK178  ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:03:02.313' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK179  ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:03:03.450' AS DateTime), N'admin', N'50')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK18   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:13.377' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK180  ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:03:04.360' AS DateTime), N'admin', N'40')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK181  ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:03:05.087' AS DateTime), N'admin', N'30')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK182  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:03:08.933' AS DateTime), N'admin', N'40')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK183  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:03:09.740' AS DateTime), N'admin', N'35')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK184  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:03:10.623' AS DateTime), N'admin', N'30')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK185  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:03:11.630' AS DateTime), N'admin', N'25')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK186  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:03:12.687' AS DateTime), N'admin', N'20')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK187  ', N'ITEM7     ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:03:17.170' AS DateTime), N'admin', N'15')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK188  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:33.150' AS DateTime), N'admin', N'20')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK189  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:34.143' AS DateTime), N'admin', N'25')
GO
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK19   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:15.160' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK190  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:35.183' AS DateTime), N'admin', N'30')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK191  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:35.957' AS DateTime), N'admin', N'35')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK192  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:36.640' AS DateTime), N'admin', N'40')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK193  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:37.303' AS DateTime), N'admin', N'45')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK194  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:38.120' AS DateTime), N'admin', N'50')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK195  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:38.813' AS DateTime), N'admin', N'55')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK196  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:39.490' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK197  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:40.160' AS DateTime), N'admin', N'65')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK198  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:40.880' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK199  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:41.677' AS DateTime), N'admin', N'75')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK2    ', N'ITEM2     ', N'ACT02     ', N'100', NULL, N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK20   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:16.937' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK200  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:42.493' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK201  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:43.340' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK202  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:44.260' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK203  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:45.230' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK204  ', N'ITEM7     ', N'ACT02     ', N'5', CAST(N'2023-06-25T06:03:46.243' AS DateTime), N'admin', N'100')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK205  ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:03:53.993' AS DateTime), N'admin', N'40')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK206  ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:03:55.660' AS DateTime), N'admin', N'50')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK207  ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:03:56.390' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK208  ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:03:57.110' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK209  ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:03:57.753' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK21   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:18.623' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK210  ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:03:58.533' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK211  ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:03:59.493' AS DateTime), N'admin', N'100')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK212  ', N'ITEM11    ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:10:56.060' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK213  ', N'ITEM11    ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:10:57.357' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK214  ', N'ITEM11    ', N'ACT03     ', N'5', CAST(N'2023-06-25T06:10:59.290' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK215  ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:11:08.400' AS DateTime), N'admin', N'50')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK216  ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:11:09.760' AS DateTime), N'admin', N'40')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK217  ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-25T06:11:11.027' AS DateTime), N'admin', N'30')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK218  ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:11:28.353' AS DateTime), N'admin', N'40')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK219  ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:11:29.510' AS DateTime), N'admin', N'50')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK22   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-22T02:41:20.503' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK220  ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:11:30.450' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK221  ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:11:31.513' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK222  ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:11:32.673' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK223  ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:11:33.883' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK224  ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-25T06:11:35.263' AS DateTime), N'admin', N'100')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK225  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:05.663' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK226  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:12.637' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK227  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:13.533' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK228  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:14.520' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK229  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:15.480' AS DateTime), N'admin', N'75')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK23   ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-22T02:41:22.257' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK230  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:16.400' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK231  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:17.417' AS DateTime), N'admin', N'65')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK232  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:18.390' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK233  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:19.397' AS DateTime), N'admin', N'55')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK234  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:20.370' AS DateTime), N'admin', N'50')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK235  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:21.333' AS DateTime), N'admin', N'45')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK236  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:22.237' AS DateTime), N'admin', N'40')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK237  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:23.350' AS DateTime), N'admin', N'35')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK238  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:24.383' AS DateTime), N'admin', N'30')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK239  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:25.467' AS DateTime), N'admin', N'25')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK24   ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-22T02:41:23.983' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK240  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:26.717' AS DateTime), N'admin', N'20')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK241  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:38:27.797' AS DateTime), N'admin', N'15')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK242  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:47.863' AS DateTime), N'admin', N'20')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK243  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:49.440' AS DateTime), N'admin', N'25')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK244  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:50.370' AS DateTime), N'admin', N'30')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK245  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:51.317' AS DateTime), N'admin', N'35')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK246  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:52.233' AS DateTime), N'admin', N'40')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK247  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:53.157' AS DateTime), N'admin', N'45')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK248  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:54.293' AS DateTime), N'admin', N'50')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK249  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:55.420' AS DateTime), N'admin', N'55')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK25   ', N'ITEM4     ', N'ACT02     ', N'100', CAST(N'2023-06-22T02:41:25.870' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK250  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:57.047' AS DateTime), N'admin', N'60')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK251  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:58.280' AS DateTime), N'admin', N'65')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK252  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:38:59.420' AS DateTime), N'admin', N'70')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK253  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:39:00.510' AS DateTime), N'admin', N'75')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK254  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:39:01.577' AS DateTime), N'admin', N'80')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK255  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:39:02.630' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK256  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:39:03.707' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK257  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:39:04.863' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK258  ', N'ITEM12    ', N'ACT02     ', N'5', CAST(N'2023-06-25T13:39:06.070' AS DateTime), N'admin', N'100')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK259  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:39:19.013' AS DateTime), N'admin', N'95')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK26   ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:29.393' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK260  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:39:23.640' AS DateTime), N'admin', N'90')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK261  ', N'ITEM12    ', N'ACT03     ', N'5', CAST(N'2023-06-25T13:39:27.603' AS DateTime), N'admin', N'85')
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK27   ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:31.493' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK28   ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:33.317' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK29   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:35.050' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK3    ', N'ITEM3     ', N'ACT02     ', N'100', NULL, N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK30   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:37.017' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK31   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:39.067' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK32   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:42.337' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK33   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:44.177' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK34   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:47.143' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK35   ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-22T02:41:49.600' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK36   ', N'ITEM4     ', N'ACT03     ', N'100', CAST(N'2023-06-22T02:41:51.737' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK37   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-22T02:41:54.590' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK38   ', N'ITEM5     ', N'ACT02     ', N'200', CAST(N'2023-06-22T03:14:54.517' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK39   ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-22T03:14:59.343' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK4    ', N'ITEM4     ', N'ACT02     ', N'1000', NULL, N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK40   ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-22T03:15:01.547' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK41   ', N'ITEM5     ', N'ACT03     ', N'200', CAST(N'2023-06-22T03:15:03.657' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK42   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:41:09.810' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK43   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:41:10.687' AS DateTime), N'2180987', NULL)
GO
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK44   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:41:12.807' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK45   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:41:17.070' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK46   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-22T05:41:40.710' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK47   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:42:04.973' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK48   ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:42:28.260' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK49   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:44:53.627' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK5    ', N'ITEM4     ', N'ACT03     ', N'100', NULL, N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK50   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:44:57.023' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK51   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:44:59.597' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK52   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-22T05:45:02.370' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK53   ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-22T06:01:12.190' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK54   ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-22T06:01:12.993' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK55   ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-22T06:01:13.910' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK56   ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-22T06:01:14.940' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK57   ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-22T06:01:15.840' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK58   ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-22T06:01:17.387' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK59   ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-22T06:01:18.090' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK6    ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T01:49:46.310' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK60   ', N'ITEM6     ', N'ACT03     ', N'150', CAST(N'2023-06-22T06:01:18.933' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK61   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-22T06:01:25.750' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK62   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T04:01:26.440' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK63   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T04:01:27.993' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK64   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T05:36:16.280' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK65   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T05:36:17.070' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK66   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T05:36:17.950' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK67   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T05:36:18.733' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK68   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T05:36:19.530' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK69   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T05:36:20.263' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK7    ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T01:49:49.423' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK70   ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-23T05:36:20.970' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK71   ', N'ITEM6     ', N'ACT02     ', N'150', CAST(N'2023-06-23T05:36:23.063' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK72   ', N'ITEM6     ', N'ACT02     ', N'150', CAST(N'2023-06-23T05:36:24.003' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK73   ', N'ITEM6     ', N'ACT02     ', N'150', CAST(N'2023-06-23T05:36:24.857' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK74   ', N'ITEM6     ', N'ACT02     ', N'150', CAST(N'2023-06-23T05:36:25.700' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK75   ', N'ITEM6     ', N'ACT02     ', N'150', CAST(N'2023-06-23T05:36:26.473' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK76   ', N'ITEM6     ', N'ACT02     ', N'150', CAST(N'2023-06-23T05:36:27.303' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK77   ', N'ITEM6     ', N'ACT02     ', N'150', CAST(N'2023-06-23T05:36:28.130' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK78   ', N'ITEM6     ', N'ACT02     ', N'150', CAST(N'2023-06-23T05:36:28.940' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK79   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-23T05:36:35.763' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK8    ', N'ITEM1     ', N'ACT03     ', N'10', CAST(N'2023-06-22T01:49:51.797' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK80   ', N'ITEM2     ', N'ACT03     ', N'10', CAST(N'2023-06-23T05:43:19.113' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK81   ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-23T05:53:00.900' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK82   ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-23T05:53:01.903' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK83   ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-23T05:53:03.203' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK84   ', N'ITEM3     ', N'ACT03     ', N'10', CAST(N'2023-06-23T05:53:04.313' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK85   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:34.090' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK86   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:34.823' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK87   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:36.250' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK88   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:37.220' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK89   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:38.030' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK9    ', N'ITEM1     ', N'ACT02     ', N'10', CAST(N'2023-06-22T01:49:54.337' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK90   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:38.860' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK91   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:39.730' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK92   ', N'ITEM2     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:40.697' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK93   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:51.280' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK94   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:52.197' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK95   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:53.117' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK96   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:54.180' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK97   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:55.180' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK98   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:56.107' AS DateTime), N'2180987', NULL)
INSERT [dbo].[transaction_stock] ([t_stock_id], [t_stock_item_id], [t_stock_action_id], [t_stock_action_qty], [t_stock_update_date], [t_stock_update_by], [t_stock_actual_qty]) VALUES (N'STOCK99   ', N'ITEM3     ', N'ACT02     ', N'10', CAST(N'2023-06-24T09:08:57.060' AS DateTime), N'2180987', NULL)
GO
USE [master]
GO
ALTER DATABASE [stockmaster] SET  READ_WRITE 
GO
