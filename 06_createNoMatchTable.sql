USE DALT_NDS
GO

IF OBJECT_ID(N'dbo.NoMatch_KhachHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.NoMatch_KhachHang;
	PRINT 'Delete Table Successfully';
END;
/* Create new table */
CREATE TABLE NoMatch_KhachHang (
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

IF OBJECT_ID(N'dbo.NoMatch_HoaDon', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.NoMatch_HoaDon;
	PRINT 'Delete Table Successfully';
END;
/* Create new table */
CREATE TABLE NoMatch_HoaDon (
	[MaHD] [varchar](4) NOT NULL,
	[MaKH] [varchar](4) NULL,
	[MaCH] [varchar](4) NULL,
	[NgayBan] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
	[MaNguon] int
);

IF OBJECT_ID(N'dbo.NoMatch_CuaHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.NoMatch_CuaHang;
	PRINT 'Delete Table Successfully';
END;
/* Create new table */
CREATE TABLE NoMatch_CuaHang (
	[MaCH] [varchar](4) NOT NULL,
	[TenCH] [varchar](50) NULL,
	[LoaiCH] [varchar](4) NULL,
	[Nuoc] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
);
IF OBJECT_ID(N'dbo.NoMatch_ChiTietHoaDon', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.NoMatch_ChiTietHoaDon;
	PRINT 'Delete Table Successfully';
END;
CREATE TABLE NoMatch_ChiTietHoaDon(
	[MaChiTiet] [int] NOT NULL,
	[MaHD] [varchar](4) NULL,
	[MaSP] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
	[MaNguon] int
);
IF OBJECT_ID(N'dbo.NoMatch_SanPham', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.NoMatch_SanPham;
	PRINT 'Delete Table Successfully';
END;
CREATE TABLE NoMatch_SanPham (
	[MaSP] [varchar](4) NOT NULL,
	[TenSP] [varchar](50) NULL,
	[GiaSP] [int] NULL,
	[LoaiSP] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhap] [datetime] NULL,
	[TrangThai] [nchar](10) NULL
);


