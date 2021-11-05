-- TẠO CSDL CHO DB NDS
USE master 
GO
IF DB_ID('DALT_NDS') IS NOT NULL
	DROP DATABASE DALT_NDS
GO
CREATE DATABASE DALT_NDS
GO
USE DALT_NDS
GO




IF OBJECT_ID(N'dbo.TrangThai', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.TrangThai;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE TrangThai (
  SKMaTrangThai INTEGER PRIMARY KEY NOT NULL,
  TenTrangThai VARCHAR(255),
  [NgayTao] [datetime],
  [NgayCapNhat] [datetime]
);

--UPDATE TrangThai
--SET TenTrangThai = 'Unknown'
--WHERE SKMaTrangThai = 2;

INSERT INTO TrangThai VALUES(1,'Normal',GETDATE(),GETDATE());
INSERT INTO TrangThai VALUES(2,'Unknown',GETDATE(),GETDATE());

IF OBJECT_ID(N'dbo.NguonDuLieu', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.NguonDuLieu;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE NguonDuLieu (
  SKMaNguon INTEGER PRIMARY KEY NOT NULL,
  TenNguon VARCHAR(255),
  [NgayTao] [datetime],
  [NgayCapNhat] [datetime]
);

TRUNCATE TABLE NguonDuLieu;

INSERT INTO NguonDuLieu VALUES(1,'Jupiter',GETDATE(),GETDATE());
INSERT INTO NguonDuLieu VALUES(2,'Jade',GETDATE(),GETDATE());
INSERT INTO NguonDuLieu VALUES(3,'Webtower9',GETDATE(),GETDATE());

SELECT * FROM NguonDuLieu;


IF OBJECT_ID(N'dbo.ChiTietHoaDon', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.ChiTietHoaDon;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE ChiTietHoaDon (
  SKMaCTHD INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [MaHD] int,
  [MaSP] int,
  [NgayTao] datetime NULL,
  [NgayCapNhat] datetime NULL,
  [MaTrangThai] int,
  [MaNguon] int
);


IF OBJECT_ID(N'dbo.HoaDon', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.HoaDon;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE HoaDon (
  SKMaHD INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  MaHD int,
  [NgayBan] datetime NULL,
  [NgayCapNhat] datetime NULL,
  MaKH int,
  MaCH int,
  LoaiHoaDon VARCHAR(5),
  [MaTrangThai] int,
  [MaNguon] int
);

IF OBJECT_ID(N'dbo.CuaHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.CuaHang;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE CuaHang(
	SKMaCH INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[MaCH] [varchar](4) NOT NULL,
	[TenCH] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[MaLoaiCH] int,
	[MaQG] int,
	[MaTrangThai] int,
	[MaNguon] int
);

IF OBJECT_ID(N'dbo.SanPham', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.SanPham;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE SanPham(
	SKMaSP INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[MaSP] [varchar](4) NOT NULL,
	[TenSP] [varchar](50),
	[GiaSP] [int],
	[NgayTao] [datetime],
	[NgayCapNhap] [datetime],
	[MaTrangThai] int,
	[MaNguon] int,
	[MaLoaiSP] int
);

IF OBJECT_ID(N'dbo.KhachHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.KhachHang;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE KhachHang (
  SKMaKH INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [MaKH] varchar(4) NOT NULL,
  [TenKH] varchar(50),
  [NgayTao] datetime,
  [NgayCapNhat] datetime,
  [GioiTinh] char(1),
  [SoThich] varchar(30),
  [NgheNghiep] varchar(30),
  -- [ThanhPho] varchar(255),
  [MaQG] int,
  [MaTrangThai] int,
  [MaNguon] int
);

IF OBJECT_ID(N'dbo.LoaiSanPham', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.LoaiSanPham;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE LoaiSanPham(
	SKMaLoaiSP INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[MaLoaiSP] [varchar](4) NOT NULL,
	[TenLoaiSP] [varchar](50) ,
	[NgayTao] [datetime] ,
	[NgayCapNhat] [datetime] ,
	[MaTrangThai] int,
	[MaNguon] int
);



IF OBJECT_ID(N'dbo.LoaiCuaHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.LoaiCuaHang;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE LoaiCuaHang(
	SKMaLoaiCH INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[MaLoaiCH] [varchar](4) NOT NULL,
	[TenLoaiCH] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[MaTrangThai] int,
	[MaNguon] int
);

IF OBJECT_ID(N'dbo.QuocGia', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.QuocGia;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE QuocGia (
  SKMaQG INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [MaQG] [varchar](4) NOT NULL,
  [TenQG] [varchar](50),
  [TenThanhPho] [varchar](100),
  [NgayTao] [datetime],
  [NgayCapNhat] [datetime] ,
  [MaTrangThai] int,
  [MaNguon] int
);

--- FOREIGN KEY
IF (OBJECT_ID('dbo.FK_SanPham_LoaiSanPham', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.SanPham DROP CONSTRAINT FK_SanPham_LoaiSanPham
END
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_LoaiSanPham
FOREIGN KEY (MaLoaiSP) REFERENCES LoaiSanPham;

IF (OBJECT_ID('dbo.FK_SanPham_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.SanPham DROP CONSTRAINT FK_SanPham_TrangThai
END
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_TrangThai
FOREIGN KEY (MaTrangThai) REFERENCES TrangThai;

IF (OBJECT_ID('dbo.FK_SanPham_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.SanPham DROP CONSTRAINT FK_SanPham_Nguondl
END
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_Nguondl
FOREIGN KEY (MaNguon) REFERENCES NguonDuLieu;
-----------------------------------------------------

IF (OBJECT_ID('dbo.FK_CTDH_HoaDon', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.ChiTietHoaDon DROP CONSTRAINT FK_CTDH_HoaDon
END
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT FK_CTDH_HoaDon
FOREIGN KEY (MaHD) REFERENCES HoaDon;

IF (OBJECT_ID('dbo.FK_CTDH_SanPham', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.ChiTietHoaDon DROP CONSTRAINT FK_CTDH_SanPham
END
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT FK_CTDH_SanPham
FOREIGN KEY (MaSP) REFERENCES SanPham;

IF (OBJECT_ID('dbo.FK_ChiTietHoaDon_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.ChiTietHoaDon DROP CONSTRAINT FK_ChiTietHoaDon_TrangThai
END
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT FK_ChiTietHoaDon_TrangThai
FOREIGN KEY (MaTrangThai) REFERENCES TrangThai;

IF (OBJECT_ID('dbo.FK_ChiTietHoaDon_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.ChiTietHoaDon DROP CONSTRAINT FK_ChiTietHoaDon_Nguondl
END
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT FK_ChiTietHoaDon_Nguondl
FOREIGN KEY (MaNguon) REFERENCES NguonDuLieu;
-------------------------------------------------
IF (OBJECT_ID('dbo.FK_LoaiCuaHang_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.LoaiCuaHang DROP CONSTRAINT FK_LoaiCuaHang_TrangThai
END
ALTER TABLE LoaiCuaHang
ADD CONSTRAINT FK_LoaiCuaHang_TrangThai
FOREIGN KEY (MaTrangThai) REFERENCES TrangThai;

IF (OBJECT_ID('dbo.FK_LoaiCuaHang_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.LoaiCuaHang DROP CONSTRAINT FK_LoaiCuaHang_Nguondl
END
ALTER TABLE LoaiCuaHang
ADD CONSTRAINT FK_LoaiCuaHang_Nguondl
FOREIGN KEY (MaNguon) REFERENCES NguonDuLieu;
--------------------------------------------------
IF (OBJECT_ID('dbo.FK_CuaHang_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.CuaHang DROP CONSTRAINT FK_CuaHang_TrangThai
END
ALTER TABLE CuaHang
ADD CONSTRAINT FK_CuaHang_TrangThai
FOREIGN KEY (MaTrangThai) REFERENCES TrangThai;

IF (OBJECT_ID('dbo.FK_CuaHang_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.CuaHang DROP CONSTRAINT FK_CuaHang_Nguondl
END
ALTER TABLE CuaHang
ADD CONSTRAINT FK_CuaHang_Nguondl
FOREIGN KEY (MaNguon) REFERENCES NguonDuLieu;

IF (OBJECT_ID('dbo.FK_CuaHang_DiaDiem', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.CuaHang DROP CONSTRAINT FK_CuaHang_DiaDiem
END
ALTER TABLE CuaHang
ADD CONSTRAINT FK_CuaHang_DiaDiem
FOREIGN KEY (MaQG) REFERENCES QuocGia;

IF (OBJECT_ID('dbo.FK_CuaHang_LoaiCuaHang', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.CuaHang DROP CONSTRAINT FK_CuaHang_LoaiCuaHang
END
ALTER TABLE CuaHang
ADD CONSTRAINT FK_CuaHang_LoaiCuaHang
FOREIGN KEY (MaLoaiCH) REFERENCES LoaiCuaHang;
------------------------------------------------------
IF (OBJECT_ID('dbo.FK_QuocGia_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.QuocGia DROP CONSTRAINT FK_QuocGia_TrangThai
END
ALTER TABLE QuocGia
ADD CONSTRAINT FK_QuocGia_TrangThai
FOREIGN KEY (MaTrangThai) REFERENCES TrangThai;

IF (OBJECT_ID('dbo.FK_QuocGia_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.QuocGia DROP CONSTRAINT FK_QuocGia_Nguondl
END
ALTER TABLE QuocGia
ADD CONSTRAINT FK_QuocGia_Nguondl
FOREIGN KEY (MaNguon) REFERENCES NguonDuLieu;
----------------------------------------------------------
IF (OBJECT_ID('dbo.FK_KhachHang_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.KhachHang DROP CONSTRAINT FK_KhachHang_TrangThai
END
ALTER TABLE KhachHang
ADD CONSTRAINT FK__TrangThai
FOREIGN KEY (MaTrangThai) REFERENCES TrangThai;

IF (OBJECT_ID('dbo.FK_KhachHang_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.KhachHang DROP CONSTRAINT FK_KhachHang_Nguondl
END
ALTER TABLE KhachHang
ADD CONSTRAINT FK_KhachHang_Nguondl
FOREIGN KEY (MaNguon) REFERENCES NguonDuLieu;

IF (OBJECT_ID('dbo.FK_KhachHang_QuocGia', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.KhachHang DROP CONSTRAINT FK_KhachHang_QuocGia
END
ALTER TABLE KhachHang
ADD CONSTRAINT FK_KhachHang_QuocGia
FOREIGN KEY (MaQG) REFERENCES QuocGia;
--------------------------------------------------------
IF (OBJECT_ID('dbo.FK_LoaiSanPham_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.LoaiSanPham DROP CONSTRAINT FK_LoaiSanPham_TrangThai
END
ALTER TABLE LoaiSanPham
ADD CONSTRAINT FK_LoaiSanPham_TrangThai
FOREIGN KEY (MaTrangThai) REFERENCES TrangThai;

IF (OBJECT_ID('dbo.FK_LoaiSanPham_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.LoaiSanPham DROP CONSTRAINT FK_LoaiSanPham_Nguondl
END
ALTER TABLE LoaiSanPham
ADD CONSTRAINT FK_LoaiSanPham_Nguondl
FOREIGN KEY (MaNguon) REFERENCES NguonDuLieu;

IF (OBJECT_ID('dbo.FK_LoaiSP_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.LoaiSanPham DROP CONSTRAINT FK_LoaiSP_Nguondl
END
-----------------------------------------------------------------
IF (OBJECT_ID('dbo.FK_HoaDon_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.HoaDon DROP CONSTRAINT FK_HoaDon_TrangThai
END
ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_TrangThai
FOREIGN KEY (MaTrangThai) REFERENCES TrangThai;

IF (OBJECT_ID('dbo.FK_HoaDon_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.HoaDon DROP CONSTRAINT FK_HoaDon_Nguondl
END
ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_Nguondl
FOREIGN KEY (MaNguon) REFERENCES NguonDuLieu;

IF (OBJECT_ID('dbo.FK_HoaDon_KH', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.HoaDon DROP CONSTRAINT FK_HoaDon_KH
END
ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_KH
FOREIGN KEY (MaKH) REFERENCES KhachHang;

IF (OBJECT_ID('FK_HoaDon_CuaHang', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.HoaDon DROP CONSTRAINT FK_HoaDon_CuaHang
END
ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_CuaHang
FOREIGN KEY (MaCH) REFERENCES CuaHang;

--Use DALT_Jade
--GO

--SELECT * FROM KhachHang_Jade