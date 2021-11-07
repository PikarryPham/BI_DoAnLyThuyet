-- TẠO CSDL CHO DB STAGE_Webtower
USE DALT_STAGE
GO

/*
	Check if table exists? Drop before creating : create
*/

IF OBJECT_ID(N'dbo.KhachHang_STAGE_Webtower', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.KhachHang_STAGE_Webtower;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.HoaDon_STAGE_Webtower', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.HoaDon_STAGE_Webtower;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.ChiTietHoaDon_STAGE_Webtower', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.ChiTietHoaDon_STAGE_Webtower;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE KhachHang_STAGE_Webtower (
  [MaKH] varchar(4) NOT NULL,
  [TenKH] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [ThanhPho] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [QuocGia] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayTao] datetime NULL,
  [NgayCapNhat] datetime NULL,
  [TrangThai] int NULL,
  [GioiTinh] char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [SoThich] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgheNghiep] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);

CREATE TABLE HoaDon_STAGE_Webtower (
	[MaHD] [varchar](4) NOT NULL,
	[MaKH] [varchar](4) NULL,
	[MaCH] [varchar](4) NULL,
	[NgayBan] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
);

CREATE TABLE ChiTietHoaDon_STAGE_Webtower (
	[MaChiTiet] [int] NOT NULL,
	[MaHD] [varchar](4) NULL,
	[MaSP] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
);