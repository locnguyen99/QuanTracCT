USE [master]
GO
/****** Object:  Database [QuanTracLunCT]    Script Date: 10/3/2020 11:21:01 PM ******/
CREATE DATABASE [QuanTracLunCT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanTracLunCT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL\MSSQL\DATA\QuanTracLunCT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanTracLunCT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL\MSSQL\DATA\QuanTracLunCT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanTracLunCT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanTracLunCT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanTracLunCT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanTracLunCT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanTracLunCT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanTracLunCT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanTracLunCT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanTracLunCT] SET  MULTI_USER 
GO
ALTER DATABASE [QuanTracLunCT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanTracLunCT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanTracLunCT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanTracLunCT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanTracLunCT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanTracLunCT', N'ON'
GO
ALTER DATABASE [QuanTracLunCT] SET QUERY_STORE = OFF
GO
USE [QuanTracLunCT]
GO
/****** Object:  Table [dbo].[CanhNghieng]    Script Date: 10/3/2020 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanhNghieng](
	[STT] [int] NULL,
	[MaCanh] [uniqueidentifier] NOT NULL,
	[MaCK] [uniqueidentifier] NOT NULL,
	[DiemDau] [varchar](50) NULL,
	[DiemCuoi] [varchar](50) NULL,
	[CanhDo] [float] NULL,
	[ChieuDai] [float] NULL,
	[CanhBS] [float] NULL,
	[PhuongNghieng] [varchar](50) NULL,
	[msDivisionS] [varchar](50) NULL,
	[m_alpha] [float] NULL,
	[m] [float] NULL,
	[SHC] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuKy]    Script Date: 10/3/2020 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuKy](
	[MaCK] [uniqueidentifier] NOT NULL,
	[TenCK] [nvarchar](50) NOT NULL,
	[MaCT] [uniqueidentifier] NOT NULL,
	[ThoiGianDo] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongTrinh]    Script Date: 10/3/2020 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongTrinh](
	[MaCT] [uniqueidentifier] NOT NULL,
	[TenCT] [nvarchar](50) NOT NULL,
	[DiaDiem] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiemNghieng]    Script Date: 10/3/2020 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemNghieng](
	[STT] [int] NULL,
	[MaDiem] [uniqueidentifier] NOT NULL,
	[TenDiem] [varchar](50) NOT NULL,
	[MaCK] [uniqueidentifier] NOT NULL,
	[X] [float] NULL,
	[Y] [float] NULL,
	[Mx] [float] NULL,
	[My] [float] NULL,
	[Mp] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DinhNghieng]    Script Date: 10/3/2020 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DinhNghieng](
	[STT] [int] NULL,
	[MaDinh] [uniqueidentifier] NOT NULL,
	[MaCK] [uniqueidentifier] NOT NULL,
	[DinhTrai] [varchar](50) NULL,
	[DinhGiua] [varchar](50) NULL,
	[DinhPhai] [varchar](50) NULL,
	[GocDo] [nvarchar](50) NULL,
	[GocSauBS] [nvarchar](50) NULL,
	[SHC] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moc]    Script Date: 10/3/2020 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moc](
	[MaMoc] [uniqueidentifier] NOT NULL,
	[TenMoc] [varchar](50) NOT NULL,
	[MaCK] [uniqueidentifier] NOT NULL,
	[S] [float] NULL,
	[CaoDo_H] [float] NULL,
	[LunTuongDoi] [float] NULL,
	[LunTuyetDoi] [float] NULL,
	[LunTB] [float] NULL,
	[LunTBTong] [float] NULL,
	[LunMax] [float] NULL,
	[LunMin] [float] NULL,
	[KhongLunMax] [float] NULL,
	[KhongLunMin] [float] NULL,
	[LunTongCongMax] [float] NULL,
	[LunTongCongMin] [float] NULL,
	[TocDoLunTB] [float] NULL,
	[TocDoLunTBTong] [float] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[STT] [int] NULL,
	[LoaiMoc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MocNghieng]    Script Date: 10/3/2020 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MocNghieng](
	[STT] [int] NULL,
	[MaMocN] [uniqueidentifier] NOT NULL,
	[TenMocN] [varchar](50) NOT NULL,
	[MaCK] [uniqueidentifier] NOT NULL,
	[X] [float] NULL,
	[Y] [float] NULL,
	[San] [int] NULL,
	[LoaiMoc] [varchar](50) NULL,
	[e] [float] NULL,
	[h] [float] NULL,
	[Epsilon] [float] NULL,
	[Alpha] [float] NULL,
	[Delta_X] [float] NULL,
	[Delta_Y] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMocN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuyenDo]    Script Date: 10/3/2020 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuyenDo](
	[MaTD] [uniqueidentifier] NOT NULL,
	[TenTuyen] [nvarchar](50) NOT NULL,
	[MaCK] [uniqueidentifier] NOT NULL,
	[DiemDau] [varchar](50) NULL,
	[DiemCuoi] [varchar](50) NULL,
	[STT] [int] NULL,
	[KhoangCach] [float] NULL,
	[SoMayTram] [int] NULL,
	[ChenhCao] [float] NULL,
	[LoaiMoc] [varchar](50) NULL,
	[SSTP] [float] NULL,
	[SHC] [float] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[DanhGia] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CanhNghieng] ([STT], [MaCanh], [MaCK], [DiemDau], [DiemCuoi], [CanhDo], [ChieuDai], [CanhBS], [PhuongNghieng], [msDivisionS], [m_alpha], [m], [SHC]) VALUES (1, N'd261cf44-343a-46d4-aba8-e6bb88d2f5c5', N'431a53c7-b910-413f-93e4-c24e354356f6', N'GPS2', N'A1', 120.438, 75.042, 120.438, N'139 08 18.7', N'1/23900', 4.4, 0.004, -0.003)
GO
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'Chu Kỳ 5', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2018-01-17' AS Date))
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'Chu Kỳ 9', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2017-07-04' AS Date))
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'Chu Kỳ 7', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2017-03-20' AS Date))
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'Chu Kỳ 1', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2018-04-06' AS Date))
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'Chu Kỳ 2', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2017-12-21' AS Date))
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'ce5288db-0000-42da-abdb-9801d86dca26', N'Chu Kỳ 6', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2017-09-15' AS Date))
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'431a53c7-b910-413f-93e4-c24e354356f6', N'Chu Kỳ 3', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2017-09-01' AS Date))
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'Chu Kỳ 4', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[ChuKy] ([MaCK], [TenCK], [MaCT], [ThoiGianDo]) VALUES (N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'Chu Kỳ 8', N'f155e5be-9364-4614-a106-b4d2cb8e8444', CAST(N'2016-06-12' AS Date))
GO
INSERT [dbo].[CongTrinh] ([MaCT], [TenCT], [DiaDiem]) VALUES (N'f155e5be-9364-4614-a106-b4d2cb8e8444', N'ĐẠI HỌC VĂN LANG', N'Phường 5, Quận Gò Vấp, TP.HCM')
GO
INSERT [dbo].[DiemNghieng] ([STT], [MaDiem], [TenDiem], [MaCK], [X], [Y], [Mx], [My], [Mp]) VALUES (1, N'11849da3-db39-477d-aeeb-d219cbf70b5e', N'A1', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', 1197560.464, 603506.744, 0.003, 0.002, 0.004)
GO
INSERT [dbo].[DinhNghieng] ([STT], [MaDinh], [MaCK], [DinhTrai], [DinhGiua], [DinhPhai], [GocDo], [GocSauBS], [SHC]) VALUES (2, N'2039efe6-87b1-4596-b56f-713e79548ff9', N'431a53c7-b910-413f-93e4-c24e354356f6', N'GPS2', N'A1', N'A2', N'135 34 39.0', N'135 34 37.9', -1.1)
GO
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'e212f0c1-e9ea-4398-93a4-03dfcab38f19', N'M4', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.21142, NULL, -7.89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc phục hồi', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'3ecada4e-c422-4d94-a08e-086b95dbad2f', N'M7', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.38763, -0.27, -4.55, NULL, NULL, 0.08, -0.15, NULL, NULL, NULL, NULL, NULL, NULL, N'Ổn định', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'1d5676c6-8216-4afe-a7ca-08aee7f0994d', N'VL04', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 2.04891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc không ổn định', 2, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'701e5eac-3e2a-41b5-9e8e-0b600fad62be', N'VL02', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 1.52996, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc không ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'f75b5a24-faca-4fd8-88fb-0d2b4a8aaad5', N'M1', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.28951, -0.95, -2.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c56460cf-c358-4082-9fd5-0eeb38548cab', N'M9', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.3195, 0.24, -2.04, NULL, NULL, NULL, NULL, NULL, 0.24, NULL, NULL, NULL, NULL, N'Lún', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'209b79ff-80b2-4496-92d2-0f6f38fcdb09', N'M5', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.47767, NULL, -8.54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'6d5d13fc-24a0-4b25-a21d-11e288e27bfe', N'GPS2', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 1.37626, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 3, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'7b4d32a0-5baa-4699-9390-16b2ae771478', N'M9', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.31715, 1.23, -4.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'd05b3cd3-328d-4fd7-8be3-177e2a2df954', N'VL04', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 2.03016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc không ổn định', 2, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'4797bcc8-494f-4935-b8b3-17e803799c0e', N'M3', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', 1, 3.2525, NULL, -5.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc phục hồi', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'848fdd94-29d3-4612-b095-1a648b2257e3', N'M9', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.31701, -0.14, -4.53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'3701bfb3-61a2-4be5-8194-1de06c75dd74', N'M3', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.4069, 0.56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'5a15bace-be0d-414e-9290-1ffb3a577911', N'M2', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.31001, NULL, -6.85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc phục hồi', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'0db12631-22ab-4c9b-b87e-20f5e9793eba', N'VL04', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 2.01025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 2, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'5ee916e6-0dd8-4aa4-bf0b-22a87eaf1174', N'M8', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.33375, -0.42, -6.96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 8, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'dbef591d-03e5-4672-9c95-22cbf681e2ac', N'VLA-2', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.217, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'50e4cc22-3ad2-45c8-b512-23585112af08', N'VL04', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 2.04824, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 2, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'3c8960f7-7400-42a6-809a-25854f778ec7', N'M1', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.28666, 0.18, -5.75, NULL, NULL, NULL, NULL, NULL, 0.18, NULL, NULL, NULL, NULL, N'Lún', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'4f9e1403-b064-49fc-b2e2-272315de306d', N'M3', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.25205, -0.45, -5.55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ổn định', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'36b34649-9b0a-44d2-b0ad-27fe18efcf59', N'M5', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.4769, -0.77, -10.48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'bda76446-9b49-4557-92c0-2b966e52e638', N'VL02', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 1.55153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc không ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'b9b93ad1-f66c-40b1-92f7-300ebafe70f5', N'M2', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.35437, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'59a943fa-16f9-4801-ab13-3bae7dd3ed9f', N'M8', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.33413, -4.51, -6.58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 8, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'81080ce7-4a31-477d-a2df-3e0b3a07022b', N'M8', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.33813, -1.79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 8, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'05f66c41-b916-421b-ab2e-4431ce0ed823', N'M4', N'e6573d2f-a25f-4629-b634-50da0862f8c2', NULL, 3.45062, -0.11, -7.89, NULL, NULL, NULL, -0.11, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'67d534eb-842f-427e-8c91-446ac179c80a', N'M8', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.33992, -0.79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 8, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'bc627bc9-f665-4b3f-b545-46e215ab5598', N'M9', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.31592, -3.58, -5.62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'911d631e-17b3-4275-b222-48068d69328e', N'M2', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.35334, -1.03, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'34b612b0-b178-42d6-8ebe-499aeb355afb', N'M1', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.28568, 0.08, -6.73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ổn định', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'fece5137-83bd-47ee-adaa-4c42921a89c0', N'GPS2', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 1.37576, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 3, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'44b14cf0-a10d-4b99-850f-4d1d91294829', N'M2', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.34767, -3.25, -6.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'143877e7-08b5-46e3-97b8-59e1c37c8b49', N'M9', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.32154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'647518cf-6ef3-48d2-a0e3-5b5f9d0d2017', N'M6', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.35719, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'a2603de6-5778-4f64-a836-5d6f0934b1af', N'M3', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.40457, -2.33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c5e63ed5-83d9-4183-a6a3-61adb9fb9a9c', N'M8', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.3336, -0.15, -7.11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 8, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'ced84c7b-16b0-460d-86cc-62af11598cdf', N'M5', N'431a53c7-b910-413f-93e4-c24e354356f6', NULL, 3.4761, -0.8, -11.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'9b583414-2dfd-4bc1-a2f1-641bdae97577', N'M7', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.39177, -0.41, NULL, NULL, NULL, NULL, -0.41, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'0dd0d2bc-98a0-44a9-a9c7-644ec56b17b3', N'M4', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.45073, -0.13, -7.78, NULL, NULL, NULL, -0.13, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'15f52bbe-02a6-4083-b378-66064474a5eb', N'M7', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.39218, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'1476cfba-e33f-4fe2-aa0e-6be20b48e8b5', N'M2', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.34712, -0.55, -7.25, NULL, NULL, -0.55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'de364b3c-4b66-4f27-920f-6c4ff4ffda7a', N'M6', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.35554, -1.08, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'af35984e-43d6-4af1-827b-6ff229f62a72', N'GPS2', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 1.37526, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 3, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'52606c88-84ea-4cd9-a8d3-73a5bc976121', N'M4', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.45546, -0.03, -3.05, NULL, NULL, NULL, -0.03, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c2629cef-5569-4d20-902d-73bf0966cae2', N'VLA-2', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.21668, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'80bcd9f5-acb1-4764-84fd-73f529085073', N'M9', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.23091, NULL, -4.53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc phục hồi', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'70712f57-fe70-4d3d-b131-74c3b16e64d2', N'M2', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.35212, -1.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'f979ab18-91c1-455c-8c28-76b8149b2deb', N'M2', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', NULL, 3.34752, 0.4, -6.85, NULL, NULL, NULL, NULL, 0.4, NULL, NULL, NULL, NULL, NULL, N'Lún', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'40574466-1988-474f-a8d7-810ab1e7de16', N'VL02', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 1.55174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc không ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'eb4bb322-3d57-4202-a572-8393c69579e0', N'GPS2', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 1.37611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 3, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'f963e6df-e4a7-4d3c-9732-858fdf8d99f8', N'M4', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 3.45086, -4.6, -7.65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'17c4a7f5-76b0-4654-a6b9-8791c8c3a796', N'M1', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 3.2856, -1.06, -6.81, NULL, NULL, -1.06, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'ea9d45d3-714a-4254-8a57-8a6aeb49d4c8', N'VL04', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 2.03005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 2, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'8fa6f59d-49fd-4f5f-817b-8a8a7d0dce9c', N'M1', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 3.29165, -0.76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'9416e9ff-dca9-487a-abfa-8d6e1bbb5118', N'M5', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 3.48614, -1.24, NULL, NULL, NULL, -1.24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'60b43bf3-d813-4eac-9ea6-8e3069be3d9d', N'VL02', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 1.55227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc không ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'e0bd9a47-3751-4004-887b-8ec17899d1fc', N'M7', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 3.39165, 0.66, -0.53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c68532da-46b6-40f5-b6e6-9195494ba4ba', N'M8', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 3.34071, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 8, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'9f139e9f-75e3-4585-a70d-98792623e6b0', N'M2', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', NULL, 3.31031, 0.3, -6.55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ổn định', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'4abd47a9-b2a2-498d-a277-98d3fd3cf89a', N'M5', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.48738, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'0f2a09af-2081-4c76-bf68-9998578372d4', N'M1', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.29241, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'7c818966-3d24-41ef-913e-9c0d8e8b2a1d', N'M7', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.38978, 1.07, -2.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'00fe7d2b-7438-4806-ac85-9c34be809909', N'M1', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.28646, -3.05, -5.95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'65b3e5fb-4573-4454-86ac-9cb9409977c7', N'M9', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.32095, -0.59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'4f22cfbf-c053-435e-91a2-9da8a8422751', N'M5', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, NULL, NULL, -8.54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'140fa3a1-febd-451d-95ab-9e33393302d2', N'M7', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.3879, -0.79, -4.28, NULL, NULL, NULL, -0.15, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'db072ab1-977f-460d-869e-9efd4ed2d644', N'M3', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.40124, -0.21, -5.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c6366052-d281-40cf-ba9c-a17328850bc7', N'M4', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.45851, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'7a8a8956-66d9-48ee-aae2-a6a620fd32f7', N'GPS2', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 1.37636, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 3, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'411e6bad-d06c-4543-bec9-a733a11e2da9', N'M1', N'ce5288db-0000-42da-abdb-9801d86dca26', NULL, 3.28648, 0.02, -5.93, NULL, NULL, NULL, NULL, NULL, 0.02, NULL, NULL, NULL, NULL, N'Lún', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'b5e9b938-d62a-412b-9a61-aca00c18a6b8', N'M6', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.35634, 0.8, -0.85, NULL, NULL, NULL, NULL, 0.8, NULL, NULL, NULL, NULL, NULL, N'Lún', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'715f74c7-ed79-4023-900f-acf5ea066d75', N'M6', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.35151, -4.83, -5.68, NULL, NULL, -4.83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'4512b95e-5f26-4e02-81fc-b3dddfbd7b76', N'VL02', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 1.5288, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'194a80fa-560c-4650-b50b-b419d5c62f8e', N'GPS2', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc hư', 3, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'9939bdd0-445d-4a05-9956-b67f26cb11d9', N'M3', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.404, -0.57, -2.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c42371c5-6482-462a-9a10-bbc2eeeb7703', N'M6', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.01849, NULL, -6.85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc phục hồi', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'1ebb2fff-50aa-41e7-876a-c2c906da2eb6', N'M7', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.39099, -0.78, NULL, NULL, NULL, NULL, -0.78, -2.33, NULL, NULL, NULL, NULL, NULL, N'Lún', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'e57f92e9-d36c-4546-87d7-c3e3fc65e318', N'M3', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.40634, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc quan trắc', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'dc6d4183-52cb-4f70-8fe0-ca667d489004', N'M7', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.38871, -2.94, -3.47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'4e1f893e-8904-49d6-8708-d125bb485ae3', N'M6', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.01824, -0.25, -5.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ổn định', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'f9ba8985-8a4a-4a1a-bc4b-d42064daeeea', N'M5', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', NULL, 3.48449, -1.65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'2f69a655-20e4-47ca-9e40-d4a506b75121', N'M8', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 3.33417, 0.04, -6.54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 8, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c8fcead4-3679-45ac-9590-d6d3719b90e3', N'M2', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 3.35092, -1.2, -3.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 2, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'b4149555-2c85-4eea-b760-d937daae62a7', N'VL04', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 2.04874, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc không ổn định', 2, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'7433ca0f-74bd-4d35-bce7-da7c045243cf', N'M5', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 3.47884, -3.86, -8.54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c8446dca-586a-4ec3-a87a-dc2d5450b3b3', N'M6', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 3.35287, 1.36, -4.32, NULL, NULL, NULL, NULL, 1.36, NULL, NULL, NULL, NULL, NULL, N'Lún', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'1235209c-a957-4453-89c3-dc7ec8ab686c', N'VL04', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 2.01057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 2, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'42ada1ba-83e9-4c09-938d-e1511961cae6', N'M8', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 3.33864, 0.51, -2.07, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 8, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'175747a8-a035-4967-8c14-e1fb417546ac', N'VL02', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 1.55001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'cc4b4725-d97a-4011-abce-e34ca09146af', N'VL02', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 1.52781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 1, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'20465557-20b0-4404-a6c1-e3c7f1c8f638', N'GPS2', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 1.35251, NULL, NULL, NULL, NULL, 0.08, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc hư', 3, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'9e53abcc-5444-4315-821f-e3d713ec74c2', N'M6', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', NULL, 3.3521, -0.77, -5.09, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c1e6925b-96e6-4b81-9e62-e5bc8a537303', N'GPS2', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 1.37636, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 3, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'01e5a910-5370-4cc9-9219-e5e38e5c3cbe', N'M4', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.4574, -1.11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'5bebbaf1-6f4a-47a5-b947-e7936dbd494d', N'M4', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.21125, -0.17, -8.06, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ổn định', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'9b6e5f1e-f8dd-4415-9f29-e96578afbb0a', N'M9', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.23083, -0.08, -4.61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ổn định', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'f7416b78-6f39-455f-a19e-eabc6629f2ab', N'M5', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.4827, -1.79, -4.68, NULL, NULL, -1.79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 5, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'c384ba5e-ce41-49b4-bf34-eaf4cb9b755c', N'M1', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.29046, -1.19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 1, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'4fcc159c-62a8-4391-8d45-ec8b45615e43', N'M7', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.38869, -1.09, -3.49, NULL, NULL, -1.09, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 7, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'0925807a-7a03-4526-994c-eda9dcfc267a', N'M8', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.33368, 0.08, -7.03, NULL, NULL, 0.08, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ổn định', 8, N'MocQT')
GO
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'575ec98f-3f21-4237-a77f-f4911efa56ad', N'M9', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.31926, -1.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 9, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'5adb4e37-f45e-4ecc-98d6-f52888907daf', N'M3', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.40165, -2.35, -4.69, NULL, NULL, NULL, -2.35, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'a69bea0d-1826-43d4-8562-f6a355f7121d', N'M3', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', NULL, 3.40145, -0.2, -4.89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 3, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'7e1aa632-bcd6-4db4-8d56-fb7b06202cf6', N'M4', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.45549, -1.91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 4, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'88786178-0b90-412a-9530-fd1519de4c26', N'M6', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 3.35662, -0.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Lún', 6, N'MocQT')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'260f4c4f-1c4e-46c9-be0a-fd955f4f3441', N'VL04', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 2.04884, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc không ổn định', 2, N'MocCS')
INSERT [dbo].[Moc] ([MaMoc], [TenMoc], [MaCK], [S], [CaoDo_H], [LunTuongDoi], [LunTuyetDoi], [LunTB], [LunTBTong], [LunMax], [LunMin], [KhongLunMax], [KhongLunMin], [LunTongCongMax], [LunTongCongMin], [TocDoLunTB], [TocDoLunTBTong], [GhiChu], [STT], [LoaiMoc]) VALUES (N'885654f6-0809-44b0-a1a5-ff2dcb64346e', N'VL04', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', NULL, 2.04774, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Mốc ổn định', 2, N'MocCS')
GO
INSERT [dbo].[MocNghieng] ([STT], [MaMocN], [TenMocN], [MaCK], [X], [Y], [San], [LoaiMoc], [e], [h], [Epsilon], [Alpha], [Delta_X], [Delta_Y]) VALUES (4, N'455d83a1-3467-4f26-95d7-79067cc87e1b', N'N4-4', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', 1197486.074, 603582.019, 4, N'MocQT', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'954897ef-20c4-441c-836a-0556cc7d299e', N'M5->M3', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M5', N'M3', 4, 34.5, 2, -81.08, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'e175a77b-b2dd-42d3-8d64-08a6d9c42e3d', N'M8->CP2', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M8 ', N'CP2', 6, 20.86, 1, -562.86, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'c70ef1a2-c22f-4a97-9e36-0abab9929a44', N'GPS2->VL04', N'431a53c7-b910-413f-93e4-c24e354356f6', N'GPS2 ', N'VL04', 4, 275.86, 7, 673.66, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'39cbafcf-acba-4da5-94ee-103b395abb28', N'M9->M4', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M9', N'M4', 9, 11.45, 1, 136.34, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'7dbff9c7-6562-4163-b221-109afbac5599', N'M2->M5', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M2', N'M5', 3, 27.63, 1, 132.49, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'30db095e-8525-403c-be9e-10e1230aecca', N'VL04->GPS2', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'VL04', N'GPS2', 2, 290.96, 7, -657.63, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'546e63d7-ab3b-4d7f-8579-118394bb1f01', N'VL02->GPS2', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'VL02', N'GPS2', 3, 305.61, 8, -174.5, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'84b84c01-3d20-429a-9a45-15eba449fec5', N'M5->M3', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M5', N'M3', 4, 33.85, 2, -79.16, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'72b7c4c5-5d7f-4575-9bd3-1713e13f8fcf', N'M5->M4', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M5 ', N'M4', 2, 29.45, 1, -264.83, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'2c27779e-928e-46d4-ba47-1a5deb23e09a', N'M8->M9', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M8', N'M9', 8, 41.35, 2, -19.12, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'3e8190d9-dfae-413f-85ae-1c5556b82a78', N'VL04->GPS2', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'VL04', N'GPS2', 1, 277.87, 7, -671.32, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ef31c0d3-7d36-4fc8-b1e7-1c5c4d66cecc', N'M2->M5', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M2', N'M5', 3, 34.36, 1, 132.99, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ebb6101e-4136-439c-8813-250f66e7aa39', N'M3->M6', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M3', N'M6', 5, 31.67, 1, -50.24, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'3c66df08-dde8-4c65-8496-275e9489366c', N'GPS2->VL02', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'GPS2', N'VL02', 2, 308.15, 9, 175, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'63bdcb7a-0572-4613-b635-2a29f695af80', N'M9->CP1', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M9 ', N'CP1', 4, 17.82, 1, 343.88, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'98342faf-442f-433f-87d9-2c367be8bdb2', N'GPS2->M3', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'GPS2 ', N'M3', 1, 204.36, 5, 2024.93, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'940cb416-4fd2-41ec-a82e-2edc238331da', N'M6->M7', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M6', N'M7', 6, 19.95, 1, 37.19, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'368d0aa5-de3f-4100-b65e-30a63618dc00', N'M1->M2', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M1 ', N'M2', 5, 20.55, 1, 22.26, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'9e0f8309-de9c-4c60-a003-30db0bafdb59', N'M1->M2', N'ce5288db-0000-42da-abdb-9801d86dca26', N'M1', N'M2', 8, 25.17, 1, 60.63, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'0c161616-bae5-4bd0-909b-3b89e21cdc87', N'M5->M1', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M5 ', N'M1', 4, 45.88, 2, -191.29, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'64decb1f-710a-442a-931d-3bc9bc12ab42', N'M4->M1', N'ce5288db-0000-42da-abdb-9801d86dca26', N'M4', N'M1', 7, 25.17, 2, -164.27, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'2f492c13-51e8-404e-8ee9-3e40aa2a07fa', N'VL04->M1', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'VL04', N'M1', 1, 203.07, 6, 1238.41, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'48ba33c6-6396-4b71-9d56-40353c0689ab', N'M1->M2', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M1', N'M2', 2, 19.16, 1, 61.73, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'62ce335b-c1be-48c2-9692-42beea90a989', N'M4->M5', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M4 ', N'M5', 7, 34.61, 1, 27.06, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'c7622740-7f2b-4591-ac33-432f3742d5b5', N'VL04->M1', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'VL04', N'M1', 1, 210.26, 6, 1243.9, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'afd812d3-549b-4409-baf6-44c2e9a188fc', N'M5->M1', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M5 ', N'M1', 8, 25.48, 1, -191, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'152a10ba-d8cb-462a-a031-461bf404b89c', N'M5->M3', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M5', N'M3', 4, 38.01, 2, -79.68, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'dde26818-37ae-4550-b7f7-46e3f1f576ec', N'GPS2->VL02', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'GPS2', N'VL02', 1, 354.8, 9, 153.92, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'4980acbf-bde7-492e-86ba-478aa6fc532c', N'M4->M9', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M4 ', N'M9', 3, 12.94, 1, 19.59, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'dc659f25-e1fb-475d-a8d5-492ca1cbd2b9', N'M8->M9', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M8', N'M9', 8, 36.16, 2, -18.63, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'79334c01-8a19-43bb-add4-4c286431f084', N'M9->M4', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M9', N'M4', 9, 11.87, 1, 134.93, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'db74347a-9789-4172-b875-4ef9c70c5d7c', N'M4->VL04', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M4', N'VL04', 10, 190.07, 5, -1402.9, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'e68385ee-9388-47e9-b8e5-52742cf9a90f', N'VL02->GPS2', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'VL02', N'GPS2', 3, 320.51, 8, -174.83, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ade94fdd-3780-4aa1-a8e5-53e299c387ad', N'M6->M7', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M6 ', N'M7', 3, 31.14, 1, 36.6, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'f886aa6a-e3dc-4fa7-923d-5428468645ad', N'M2->GPS2', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M2 ', N'GPS2', 10, 231.67, 6, -1971.1, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'459a1fc7-757c-4a99-806d-5728df807cbf', N'VL-04->VLA-2', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'VL-04', N'VLA-2', 2, 486.47, 11, 1205.57, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'd44dee53-937d-4820-b741-599960baabdd', N'M8->M9', N'ce5288db-0000-42da-abdb-9801d86dca26', N'M8 ', N'M9', 5, 43.89, 2, -17.05, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'85e76b40-e7e9-4422-a3d6-59999c6f9e0a', N'GPS2->VLA-2', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'GPS2', N'VLA-2', 3, 228.93, 6, 1864.59, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'4cc11101-0bf4-4b05-9e40-5c6c39a37081', N'M2->GPS2', N'ce5288db-0000-42da-abdb-9801d86dca26', N'M2 ', N'GPS2', 9, 199.62, 6, -1970.83, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'f3e992e8-39cf-45b7-b5db-5cecf908f541', N'M7->M8', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M7', N'M8', 7, 32.4, 2, -51.77, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'61d8fdc6-43e8-48d8-b230-630160b9cab7', N'CP2->M7', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'CP2 ', N'M7', 7, 13.33, 1, 616.84, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'e233e7ce-d6d2-405b-b075-67b3cffadb2a', N'M3->M6', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M3 ', N'M6', 7, 24.76, 1, -234.08, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'523cceeb-af62-4f34-8bab-6e4b7ad3969f', N'M9->M4', N'ce5288db-0000-42da-abdb-9801d86dca26', N'M9 ', N'M4', 6, 14.11, 1, 133.57, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'fd692126-4c82-4903-bbda-6ec62aa1d299', N'M1->M2', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M1', N'M2', 2, 18.61, 1, 61.94, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'1b26cad3-5a2e-4e42-833a-708df49c1bf1', N'VL02->GPS2', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'VL02', N'GPS2', 3, 312.37, 9, -152.44, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'923885e2-5d20-4691-9964-7103345a1a26', N'M7->M8', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M7', N'M8', 7, 28.52, 2, -54.6, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'b0c61a74-485e-4ed7-8766-73ab9353155d', N'M3->M6', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M3 ', N'M6', 2, 31.46, 1, -49.13, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'59fc18a6-f0e4-4eeb-9ada-73ed0bcd5d6f', N'M2->M5', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M2', N'M5', 3, 24.27, 1, 132.08, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'4a1b3d2d-eb67-4d0d-8662-75f7d4e9ee0e', N'VL04->M1', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'VL04', N'M1', 1, 388.08, 5, 1244.31, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'6e94c47e-f90b-4ebc-9044-7667e564c0f9', N'VL04->GPS2', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'VL04', N'GPS2', 4, 274.73, 6, -672.87, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ab008257-d447-4752-b5f7-768c4770951a', N'M7->M8', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M7', N'M8', 7, 14.69, 1, -52.99, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'eaae5df3-8d6a-4f81-8abf-7a0354017d48', N'VL02->VL04', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'VL02', N'VL04', 2, 318.07, 7, 500.14, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'bf8a3d4f-9bc3-46d6-94a8-7e24323ea10e', N'M7->M8', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M7 ', N'M8', 4, 69.18, 2, -54.92, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'e37f19d3-df7a-4366-b4e2-7e90a0a388b7', N'M6->M7', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M6', N'M7', 6, 19.64, 1, 35.32, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'186c5860-cef5-427f-b059-7f6ec6b17192', N'GPS2->VL02', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'GPS2', N'VL02', 2, 307.96, 8, 152.44, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'860804e5-a6d0-4982-ac18-81189c3d2616', N'M3->M6', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M3', N'M6', 5, 23.3, 1, -47.65, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'4b9e45bb-8b11-48a6-b605-8448760947f5', N'M7->M8', N'ce5288db-0000-42da-abdb-9801d86dca26', N'M7 ', N'M8', 4, 36.72, 1, -55.62, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'7b1be96b-0789-4ca6-acdc-8633f1a706b4', N'VLA-2->VL-04', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'VLA-2', N'VL-04', 1, 500.53, 12, -1206.08, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'70eab397-50a1-41b6-aa56-874a516a956c', N'M6->M7', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M6', N'M7', 6, 17.76, 1, 35.57, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'2d2c5802-7726-4089-bf8a-8a9654d92815', N'VL04->GPS2', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'VL04', N'GPS2', 1, 271.65, 7, -678.7, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'b470e1db-0df2-46a3-8bcc-8abeebcbd537', N'VL04->GPS2', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'VL04', N'GPS2', 1, 197.81, 7, -673.64, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'3682c439-1776-4bd6-96f6-8f17272ed2fe', N'M7->M6', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M7 ', N'M6', 8, 12.74, 1, -369.37, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'6c97ba62-1595-48c3-ac73-8fe5efe48960', N'VLA-2->VL04', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'VLA-2', N'VL04', 1, 287.17, 7, -1206.64, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'2f2f0706-d4fc-4b2d-bb5d-92f3c156d9e6', N'M8->VL.04', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M8 ', N'VL.04', 10, 310.13, 8, -1314.7, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'1f9c434d-f36b-4dae-8757-944dffadd1a0', N'M2->M5', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M2', N'M5', 3, 34.01, 1, 132.84, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'adb52d17-9d83-430b-b6b4-94daf4f69dab', N'M4->VL04', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M4', N'VL04', 10, 219.29, 4, -1410.59, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'8b0d5f1d-1e4d-43e7-9279-994dea3ece54', N'M3->M2', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M3 ', N'M2', 10, 28.69, 1, 58.28, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'f2dcdbd9-5640-4765-b404-9b92cd67e64a', N'M5->M3', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M5', N'M3', 4, 37.62, 2, -78.35, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'9325be1d-4323-478e-87c6-a53ca6202400', N'GPS2->VL04', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'GPS2', N'VL04', 4, 282.67, 8, 678.23, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'7cf6c890-eb9a-4af2-ad54-a58e22693331', N'M7->M8', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M7', N'M8', 7, 27.15, 1, -52.74, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'78f63167-5991-4eb3-83d3-a8f2b738622b', N'GPS2->VL02', N'ce5288db-0000-42da-abdb-9801d86dca26', N'GPS2', N'VL02', 1, 309.03, 8, 151.71, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'fc039836-54fb-4a29-9a07-aca84de34ac3', N'M8->M9', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M8', N'M9', 8, 24.75, 2, -18.89, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'900efe99-e681-477d-bf52-ace9092c9a78', N'VL04->M1', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'VL04', N'M1', 1, 201.57, 5, 1241.16, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'b2dd3e9c-def9-40bc-b60a-acfbff9ff410', N'M9->M4', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M9', N'M4', 9, 11.45, 1, 135.97, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'2b277607-548a-4e95-a728-ad6bea5e5560', N'VL02->VL04', N'ce5288db-0000-42da-abdb-9801d86dca26', N'VL02', N'VL04', 2, 320.81, 7, 502.26, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'1830ac71-e047-40ee-bc08-af7a4d40999a', N'VL02->GPS2', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'VL02', N'GPS2', 2, 306.22, 7, -176.1, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'f1eb1145-2ff3-45cd-af90-b051c6c2cb25', N'M9->M4', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M9 ', N'M4', 6, 23.65, 1, 133.62, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'9b3193a5-daa8-4167-a150-b3071ad505fb', N'M6->M7', N'ce5288db-0000-42da-abdb-9801d86dca26', N'M6 ', N'M7', 3, 18.9, 1, 36.9, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'3716c7e4-e344-4913-8de6-b34b96d99507', N'M3->M6', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M3', N'M6', 5, 31.92, 1, -48.91, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ad74dc6a-5b8b-4df5-b0ab-b45210c9cd5b', N'VL04->M1', N'431a53c7-b910-413f-93e4-c24e354356f6', N'VL04', N'M1', 1, 203.04, 5, 1243.05, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'c8715bb4-126d-4784-a939-b4e74adbc75d', N'M2->M1', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M2 ', N'M1', 11, 21.9, 1, -24.62, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ff12f771-4d9b-4397-9937-b63aac89312f', N'M3->M6', N'ce5288db-0000-42da-abdb-9801d86dca26', N'M3 ', N'M6', 2, 29.96, 1, -48.59, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'692f7be4-1888-40de-9fd1-b79b5956d618', N'M6->M7', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M6 ', N'M7', 8, 16.09, 1, 371.86, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'2e246a9e-981a-4818-8072-b8921f5e7883', N'M1->M2', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M1 ', N'M2', 9, 21.39, 1, 60.87, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'cd439739-4c19-466b-aadd-b8de4c8e3027', N'M6->M3', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M6 ', N'M3', 9, 24.43, 1, 233.82, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'7b3ae94d-4031-4053-86b8-b93bce7340f3', N'M4->M5', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M4 ', N'M5', 3, 29.53, 1, 267.07, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'b5d1ddf1-07c7-419c-99e9-b94f5ff6f6a6', N'M4->VL04', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M4', N'VL04', 10, 207.9, 5, -1409.2, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ca2ad658-996d-43c1-b17f-bb696937d933', N'M7->M8', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M7 ', N'M8', 9, 16.09, 1, -54.27, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'f8b1fab6-cdd4-4969-9eea-c0074c2901e3', N'VL02->GPS2', N'431a53c7-b910-413f-93e4-c24e354356f6', N'VL02 ', N'GPS2', 3, 307.8, 8, -177.16, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'622c7393-87d5-4538-ae8c-c0df8b900f42', N'M3->M6', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M3', N'M6', 5, 36.78, 2, -50.15, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'd8d96aa9-f808-4e6f-8253-c1be51b49873', N'M6->M7', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M6', N'M7', 6, 19.64, 2, 34.96, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'7ce12839-93a2-41e7-a349-c244ff248127', N'M1->M2', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M1', N'M2', 2, 18.09, 1, 61.21, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'f6f88897-94d3-45e8-967a-c4f0aa2dd978', N'M1->M2', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M1', N'M2', 2, 18.84, 1, 61.22, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'a532fe25-9741-4bf1-97ea-c626e0739968', N'M9->M4', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M9 ', N'M4', 2, 13.99, 1, -19.33, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'6bd90935-e062-421a-bdb2-ca3350833af3', N'VL.04->M9', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'VL.04', N'M9', 1, 272.69, 7, 1211.02, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'e63a062d-be43-4390-87ac-cb86b37849a2', N'M5->M3', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M5', N'M3', 4, 37.95, 2, -77.21, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ec38c172-e04a-4942-9410-cdccb1e217dd', N'GPS2->VL04', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'GPS2', N'VL04', 3, 271.04, 6, 672.08, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'9c4a1c1d-e8a2-4491-a98b-ce3b4c248065', N'M8->M9', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M8', N'M9', 8, 34.91, 2, -18.22, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'2731e27f-dc4e-4958-a111-d05752e2c2e6', N'M8->M9', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'M8 ', N'M9', 5, 51.15, 2, -16.72, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'0d171a91-23c1-4e61-b70c-d24e07da09fa', N'M6->M7', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M6', N'M7', 6, 20.03, 1, 35.19, N'MocQT', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'716a2a2f-07dc-4245-9284-d2f50b3c9f9e', N'M9->M4', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'M9', N'M4', 9, 11.44, 1, 136.5, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'72180c3e-3366-473f-9e1f-d52f94ef1ec7', N'M1->M2', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M1', N'M2', 2, 18.46, 1, 61.78, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'c2fa006e-99cf-42e1-b96b-d6803f3c5feb', N'GPS2 ->VL04', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'GPS2', N'VL04', 4, 276.76, 7, 673.3, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'bd02e86e-75f7-4729-9be2-dc2537f268ea', N'GPS2->VL04', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'GPS2', N'VL04', 4, 279.02, 7, 671.63, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'7b5cd578-e61e-4723-a0f8-dc46983648e0', N'M9->M4', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M9', N'M4', 9, 11.45, 1, 136.95, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'3e71b232-9728-49e9-b248-df7e2b09eb97', N'M4->VL04', N'431a53c7-b910-413f-93e4-c24e354356f6', N'M4', N'VL04', 10, 208.39, 5, -1406.89, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'72013a05-b9be-4e23-be75-dfac0d42beaf', N'M4->VL04', N'3637e195-24ee-4269-a91b-d8a2b21aba5b', N'M4', N'VL04', 10, 186.46, 5, -1407.41, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'027c2216-65f9-4dcd-93a3-e18176cbee46', N'M7->M8', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M7', N'M8', 7, 38.97, 2, -51.51, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'e7aa954a-1589-44d1-8261-e1ebad6f497e', N'M2->M5', N'51b99f40-fa67-45ef-8bb0-18eab8980b7f', N'M2', N'M5', 3, 23, 1, 131.16, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'3d80f6e5-d65a-4109-bfb6-e497227c347f', N'VL04->GPS2', N'431a53c7-b910-413f-93e4-c24e354356f6', N'VL04 ', N'GPS2', 1, 194.92, 7, -673.97, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'201d2443-fc73-4e74-a431-e5a37ca08ed8', N'GPS2->M3', N'ce5288db-0000-42da-abdb-9801d86dca26', N'GPS2 ', N'M3', 1, 222.56, 6, 2025.02, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'251ceeab-d510-4975-a82b-e97d5e0f90dd', N'VL04->GPS2', N'ce5288db-0000-42da-abdb-9801d86dca26', N'VL04', N'GPS2', 3, 272.58, 6, -654.24, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'ccc12547-a09d-44c4-90ea-eabc7021f76d', N'M8->M9', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M8', N'M9', 8, 33.52, 1, -19.19, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'6f54e46f-807f-4091-a2a4-eca18cfca63f', N'GPS2->VL02', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'GPS2', N'VL02', 2, 307.99, 8, 175.71, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'47959b89-f516-4756-a3eb-f12e9cbe268f', N'VL04->GPS2', N'ebb79be1-7a03-4463-9fc0-3e80d9791b17', N'VL04', N'GPS2', 3, 272.8, 6, -653.89, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'7c35204a-7f85-430c-b661-f13409c277db', N'GPS2->VL02', N'e6573d2f-a25f-4629-b634-50da0862f8c2', N'GPS2', N'VL02', 1, 306.69, 7, 176.92, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'd18158b2-4fca-42c6-b0e8-f3c3d4751150', N'CP1->M8', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'CP1 ', N'M8', 5, 20.61, 1, -241, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'fa4d07af-8d80-49ae-bb75-f8292a87fd55', N'VLA2->M5', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'VLA2', N'M5', 1, 30.06, 1, 259.41, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'895d4fb3-38a6-48fc-80ca-f9429ac47cb8', N'GPS2->VL02', N'431a53c7-b910-413f-93e4-c24e354356f6', N'GPS2', N'VL02', 2, 308.26, 9, 176.08, N'MocCS', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'0be20914-7de4-4e7f-8660-fb189f02e0dd', N'M2->M3', N'74b30fef-4559-49d3-85af-e9c2a1f36a0d', N'M2', N'M3', 6, 46.18, 2, -57.55, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'b0de93c3-cb4b-4487-bf1c-fbdde49340e1', N'M1->VLA2', N'20c1e9d4-a573-4fa2-ad15-3d2c68cf9589', N'M1 ', N'VLA2', 11, 27.42, 1, -68.96, N'MocQT', NULL, NULL, NULL, NULL)
INSERT [dbo].[TuyenDo] ([MaTD], [TenTuyen], [MaCK], [DiemDau], [DiemCuoi], [STT], [KhoangCach], [SoMayTram], [ChenhCao], [LoaiMoc], [SSTP], [SHC], [GhiChu], [DanhGia]) VALUES (N'14303656-298b-41d5-a489-fd62f10d4ad4', N'M3->M6', N'7a78d299-34b7-4ca9-ac05-42edd74b5cac', N'M6', N'M7', 5, 19.64, 1, 34.96, N'MocQT', NULL, NULL, NULL, NULL)
GO
ALTER TABLE [dbo].[CanhNghieng] ADD  DEFAULT (newid()) FOR [MaCanh]
GO
ALTER TABLE [dbo].[CanhNghieng] ADD  DEFAULT (newid()) FOR [MaCK]
GO
ALTER TABLE [dbo].[ChuKy] ADD  DEFAULT (newid()) FOR [MaCK]
GO
ALTER TABLE [dbo].[ChuKy] ADD  DEFAULT (newid()) FOR [MaCT]
GO
ALTER TABLE [dbo].[CongTrinh] ADD  DEFAULT (newid()) FOR [MaCT]
GO
ALTER TABLE [dbo].[DiemNghieng] ADD  DEFAULT (newid()) FOR [MaDiem]
GO
ALTER TABLE [dbo].[DiemNghieng] ADD  DEFAULT (newid()) FOR [MaCK]
GO
ALTER TABLE [dbo].[DinhNghieng] ADD  DEFAULT (newid()) FOR [MaDinh]
GO
ALTER TABLE [dbo].[DinhNghieng] ADD  DEFAULT (newid()) FOR [MaCK]
GO
ALTER TABLE [dbo].[Moc] ADD  DEFAULT (newid()) FOR [MaMoc]
GO
ALTER TABLE [dbo].[Moc] ADD  DEFAULT (newid()) FOR [MaCK]
GO
ALTER TABLE [dbo].[MocNghieng] ADD  DEFAULT (newid()) FOR [MaMocN]
GO
ALTER TABLE [dbo].[MocNghieng] ADD  DEFAULT (newid()) FOR [MaCK]
GO
ALTER TABLE [dbo].[TuyenDo] ADD  DEFAULT (newid()) FOR [MaTD]
GO
ALTER TABLE [dbo].[TuyenDo] ADD  DEFAULT (newid()) FOR [MaCK]
GO
ALTER TABLE [dbo].[CanhNghieng]  WITH CHECK ADD  CONSTRAINT [FK_ChuKy_CanhNghieng] FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKy] ([MaCK])
GO
ALTER TABLE [dbo].[CanhNghieng] CHECK CONSTRAINT [FK_ChuKy_CanhNghieng]
GO
ALTER TABLE [dbo].[ChuKy]  WITH CHECK ADD  CONSTRAINT [FK_CongTrinh_ChuKy] FOREIGN KEY([MaCT])
REFERENCES [dbo].[CongTrinh] ([MaCT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuKy] CHECK CONSTRAINT [FK_CongTrinh_ChuKy]
GO
ALTER TABLE [dbo].[DiemNghieng]  WITH CHECK ADD FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKy] ([MaCK])
GO
ALTER TABLE [dbo].[DiemNghieng]  WITH CHECK ADD FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKy] ([MaCK])
GO
ALTER TABLE [dbo].[DinhNghieng]  WITH CHECK ADD  CONSTRAINT [FK_ChuKy_DinhNghieng] FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKy] ([MaCK])
GO
ALTER TABLE [dbo].[DinhNghieng] CHECK CONSTRAINT [FK_ChuKy_DinhNghieng]
GO
ALTER TABLE [dbo].[Moc]  WITH CHECK ADD  CONSTRAINT [FK_ChuKy_Moc] FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKy] ([MaCK])
GO
ALTER TABLE [dbo].[Moc] CHECK CONSTRAINT [FK_ChuKy_Moc]
GO
ALTER TABLE [dbo].[MocNghieng]  WITH CHECK ADD  CONSTRAINT [FK_ChuKy_MocNghieng] FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKy] ([MaCK])
GO
ALTER TABLE [dbo].[MocNghieng] CHECK CONSTRAINT [FK_ChuKy_MocNghieng]
GO
ALTER TABLE [dbo].[TuyenDo]  WITH CHECK ADD  CONSTRAINT [FK__ChuKy__TuyenDo] FOREIGN KEY([MaCK])
REFERENCES [dbo].[ChuKy] ([MaCK])
GO
ALTER TABLE [dbo].[TuyenDo] CHECK CONSTRAINT [FK__ChuKy__TuyenDo]
GO
USE [master]
GO
ALTER DATABASE [QuanTracLunCT] SET  READ_WRITE 
GO
