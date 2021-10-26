-- TẠO CSDL CHO DB STAGE
USE master 
GO
IF DB_ID('DALT_STAGE') IS NOT NULL
	DROP DATABASE DALT_STAGE
GO
CREATE DATABASE DALT_STAGE
GO
USE DALT_STAGE
GO

/*
	Check if table exists? Drop before creating : create
*/

IF OBJECT_ID(N'dbo.KhachHang_Stage', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.KhachHang_Stage;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.HoaDon_Stage', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.HoaDon_Stage;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.ChiTietHoaDon_Stage', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.ChiTietHoaDon_Stage;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.LoaiSanPham_Stage', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.LoaiSanPham_Stage;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Nuoc_Stage', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Nuoc_Stage;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.LoaiCuaHang_Stage', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.LoaiCuaHang_Stage;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.SanPham_Stage', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.SanPham_Stage;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.CuaHang_Stage', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.CuaHang_Stage;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE KhachHang_Stage (
	[MaKH] [varchar](4) NOT NULL,
	[TenKH] [varchar](50) NULL,
	[DiaChi] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
);

CREATE TABLE HoaDon_Stage (
	[MaHD] [varchar](4) NOT NULL,
	[MaKH] [varchar](4) NULL,
	[MaCH] [varchar](4) NULL,
	[NgayBan] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
);

CREATE TABLE ChiTietHoaDon_Stage (
	[MaChiTiet] [int] NOT NULL,
	[MaHD] [varchar](4) NULL,
	[MaSP] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
);

CREATE TABLE LoaiSanPham_Stage (
	[MaLoaiSP] [varchar](4) NOT NULL,
	[TenLoaiSP] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
);

CREATE TABLE Nuoc_Stage (
	[MaNuoc] [varchar](4) NOT NULL,
	[TenNuoc] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
);

CREATE TABLE LoaiCuaHang_Stage (
	[MaLoaiCH] [varchar](4) NOT NULL,
	[TenLoaiCH] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
);

CREATE TABLE SanPham_Stage (
	[MaSP] [varchar](4) NOT NULL,
	[TenSP] [varchar](50) NULL,
	[GiaSP] [int] NULL,
	[LoaiSP] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhap] [datetime] NULL,
	[TrangThai] [nchar](10) NULL
);

CREATE TABLE CuaHang_Stage(
	[MaCH] [varchar](4) NOT NULL,
	[TenCH] [varchar](50) NULL,
	[LoaiCH] [varchar](4) NULL,
	[Nuoc] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
);