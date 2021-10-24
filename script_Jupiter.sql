-- B1. TẠO CSDL CHO DB NGUỒN CHO DB Jupiter
USE master 
GO
IF DB_ID('DALT_Jupiter') IS NOT NULL
	DROP DATABASE DALT_Jupiter
GO
CREATE DATABASE DALT_Jupiter
GO
USE DALT_Jupiter
GO

-------------------------------------------------
--------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiSanPham_Jupiter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoaiSanPham_Jupiter](
	[MaLoaiSP] [varchar](4) NOT NULL,
	[TenLoaiSP] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_LoaiSanPham_Jupiter] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nuoc_Jupiter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Nuoc_Jupiter](
	[MaNuoc] [varchar](4) NOT NULL,
	[TenNuoc] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_Nuoc_Jupiter] PRIMARY KEY CLUSTERED 
(
	[MaNuoc] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiCuaHang_Jupiter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoaiCuaHang_Jupiter](
	[MaLoaiCH] [varchar](4) NOT NULL,
	[TenLoaiCH] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_LoaiCuaHang_Jupiter] PRIMARY KEY CLUSTERED 
(
	[MaLoaiCH] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SanPham_Jupiter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SanPham_Jupiter](
	[MaSP] [varchar](4) NOT NULL,
	[TenSP] [varchar](50) NULL,
	[GiaSP] [int] NULL,
	[LoaiSP] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhap] [datetime] NULL,
	[TrangThai] [nchar](10) NULL,
 CONSTRAINT [PK_SanPham_Jupiter] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CuaHang_Jupiter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CuaHang_Jupiter](
	[MaCH] [varchar](4) NOT NULL,
	[TenCH] [varchar](50) NULL,
	[LoaiCH] [varchar](4) NULL,
	[Nuoc] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_CuaHang_Jupiter] PRIMARY KEY CLUSTERED 
(
	[MaCH] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SanPham_Jupiter_LoaiSanPham_Jupiter]') AND parent_object_id = OBJECT_ID(N'[dbo].[SanPham_Jupiter]'))
ALTER TABLE [dbo].[SanPham_Jupiter]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Jupiter_LoaiSanPham_Jupiter] FOREIGN KEY([LoaiSP])
REFERENCES [dbo].[LoaiSanPham_Jupiter] ([MaLoaiSP])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CuaHang_Jupiter_LoaiCuaHang_Jupiter]') AND parent_object_id = OBJECT_ID(N'[dbo].[CuaHang_Jupiter]'))
ALTER TABLE [dbo].[CuaHang_Jupiter]  WITH CHECK ADD  CONSTRAINT [FK_CuaHang_Jupiter_LoaiCuaHang_Jupiter] FOREIGN KEY([LoaiCH])
REFERENCES [dbo].[LoaiCuaHang_Jupiter] ([MaLoaiCH])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CuaHang_Jupiter_Nuoc_Jupiter]') AND parent_object_id = OBJECT_ID(N'[dbo].[CuaHang_Jupiter]'))
ALTER TABLE [dbo].[CuaHang_Jupiter]  WITH CHECK ADD  CONSTRAINT [FK_CuaHang_Jupiter_Nuoc_Jupiter] FOREIGN KEY([Nuoc])
REFERENCES [dbo].[Nuoc_Jupiter] ([MaNuoc])
