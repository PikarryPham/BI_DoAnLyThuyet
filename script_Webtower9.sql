-- B1. TẠO CSDL CHO DB NGUỒN CHO DB Webtower
USE master 
GO
IF DB_ID('DALT_Webtower') IS NOT NULL
	DROP DATABASE DALT_Webtower
GO
CREATE DATABASE DALT_Webtower
GO
USE DALT_Webtower
GO
--------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KhachHang_WebTower9]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KhachHang_WebTower9](
	[MaKH] [varchar](4) NOT NULL,
	[TenKH] [varchar](50) NULL,
	[TenNuoc] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDon_WebTower9]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HoaDon_WebTower9](
	[MaHD] [varchar](4) NOT NULL,
	[MaKH] [varchar](4) NULL,
	[MaCH] [varchar](4) NULL,
	[NgayBan] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_HoaDon_Jade] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDon_WebTower9]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChiTietHoaDon_WebTower9](
	[MaChiTiet] [int] NOT NULL,
	[MaHD] [varchar](4) NULL,
	[MaSP] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon_Jade] PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDon_Jade_KhachHang_Jade]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDon_WebTower9]'))
ALTER TABLE [dbo].[HoaDon_WebTower9]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Jade_KhachHang_Jade] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang_WebTower9] ([MaKH])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChiTietHoaDon_Jade_HoaDon_Jade]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDon_WebTower9]'))
ALTER TABLE [dbo].[ChiTietHoaDon_WebTower9]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Jade_HoaDon_Jade] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon_WebTower9] ([MaHD])
