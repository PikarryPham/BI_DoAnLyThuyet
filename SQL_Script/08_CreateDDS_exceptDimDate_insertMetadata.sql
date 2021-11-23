/*Tao script DDS*/
Use DALT_NDS

UPDATE TrangThai
SET TenTrangThai = 'Active'
WHERE SKMaTrangThai = 1;

UPDATE TrangThai
SET TenTrangThai = 'Disabled'
WHERE SKMaTrangThai = 2;


USE DALT_DW
GO

IF OBJECT_ID(N'dbo.Fact_ABCDoanhThu', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Fact_ABCDoanhThu;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Dim_HoaDon', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_HoaDon;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Dim_KhachHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_KhachHang;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Dim_CuaHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_CuaHang;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_LoaiSanPham', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_LoaiSanPham;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_SanPham', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_SanPham;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Dim_LoaiCuaHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_LoaiCuaHang;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Dim_CuaHang', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_CuaHang;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Dim_QuocGia', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_QuocGia;
	PRINT 'Delete Table Successfully';
END;

/*----------------------- Tạo bảng Dimension ------------*/
/*---------------------- Tạo bảng Fact ---------------- */
CREATE TABLE Fact_ABCDoanhThu (
	SKDoanhThu INTEGER PRIMARY KEY NOT NULL,
	SKMaCH INTEGER NOT NULL,
	SKMaKH INTEGER NOT NULL,
	SKMaSP INTEGER NOT NULL,
	SKMaHD INTEGER NOT NULL,
	SKDate INTEGER NOT NULL,
	NgayTao DATETIME NOT NULL,
	NgayCapNhat DATETIME NOT NULL,
	GiaSP INT
);


CREATE TABLE Dim_HoaDon (
   SKMaHD INTEGER PRIMARY KEY NOT NULL,
   MaHD varchar(4) ,
   [NgayTao] datetime NULL,
   [NgayCapNhat] datetime NULL,
   LoaiHoaDon VARCHAR(5)
);

CREATE TABLE Dim_KhachHang (
  SKMaKH INTEGER PRIMARY KEY NOT NULL,
  [MaKH] varchar(4) NOT NULL,
  [TenKH] varchar(50),
  [NgayTao] datetime,
  [NgayCapNhat] datetime,
  [GioiTinh] char(1),
  [SoThich] varchar(30),
  [NgheNghiep] varchar(30),
  [SKMaQG] int
);

CREATE TABLE Dim_CuaHang (
    SKMaCH INTEGER PRIMARY KEY NOT NULL,
	[MaCH] [varchar](4) NOT NULL,
	[TenCH] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[SKMaLoaiCH] int,
	[SKMaQG] int
);

CREATE TABLE Dim_SanPham (
    SKMaSP INTEGER PRIMARY KEY NOT NULL,
	[MaSP] [varchar](4) NOT NULL,
	[TenSP] [varchar](50),
	[NgayTao] [datetime],
	[NgayCapNhap] [datetime],
	[SKMaLoaiSP] int
);

CREATE TABLE Dim_LoaiSanPham (
	SKMaLoaiSP INTEGER PRIMARY KEY NOT NULL,
	[MaLoaiSP] [varchar](4) NOT NULL,
	[TenLoaiSP] [varchar](50) ,
	[NgayTao] [datetime] ,
	[NgayCapNhat] [datetime]
);

CREATE TABLE Dim_LoaiCuaHang (
	SKMaLoaiCH INTEGER PRIMARY KEY NOT NULL,
	[MaLoaiCH] [varchar](4) NOT NULL,
	[TenLoaiCH] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL
);

CREATE TABLE Dim_QuocGia (
	SKMaQG INTEGER PRIMARY KEY NOT NULL,
	[MaQG] [varchar](4) NOT NULL,
	[TenQG] [varchar](50),
	[TenThanhPho] [varchar](100),
	[NgayTao] [datetime],
	[NgayCapNhat] [datetime]
);


---------------- Doanh Thu

IF (OBJECT_ID('FK_DoanhThu_CuaHang', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_ABCDoanhThu DROP CONSTRAINT FK_DoanhThu_CuaHang
END
ALTER TABLE Fact_ABCDoanhThu
ADD CONSTRAINT FK_DoanhThu_CuaHang
FOREIGN KEY (SKMaCH) REFERENCES Dim_CuaHang;

IF (OBJECT_ID('FK_DoanhThu_HoaDon', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_ABCDoanhThu DROP CONSTRAINT FK_DoanhThu_HoaDon
END
ALTER TABLE Fact_ABCDoanhThu
ADD CONSTRAINT FK_DoanhThu_HoaDon
FOREIGN KEY (SKMaHD) REFERENCES Dim_HoaDon;

IF (OBJECT_ID('FK_DoanhThu_KhachHang', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_ABCDoanhThu DROP CONSTRAINT FK_DoanhThu_KhachHang
END
ALTER TABLE Fact_ABCDoanhThu
ADD CONSTRAINT FK_DoanhThu_KhachHang
FOREIGN KEY (SKMaKH) REFERENCES Dim_KhachHang;

IF (OBJECT_ID('FK_DoanhThu_SanPham', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_ABCDoanhThu DROP CONSTRAINT FK_DoanhThu_SanPham
END
ALTER TABLE Fact_ABCDoanhThu
ADD CONSTRAINT FK_DoanhThu_SanPham
FOREIGN KEY (SKMaSP) REFERENCES Dim_SanPham;

IF (OBJECT_ID('FK_DoanhThu_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_ABCDoanhThu DROP CONSTRAINT FK_DoanhThu_Date
END
ALTER TABLE Fact_ABCDoanhThu
ADD CONSTRAINT FK_DoanhThu_Date
FOREIGN KEY (SKDate) REFERENCES DimDate(SKDate);

------------------------ Cửa Hàng

IF (OBJECT_ID('FK_CuaHang_LoaiCuaHang', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Dim_CuaHang DROP CONSTRAINT FK_CuaHang_LoaiCuaHang
END
ALTER TABLE Dim_CuaHang
ADD CONSTRAINT FK_CuaHang_LoaiCuaHang
FOREIGN KEY (SKMaLoaiCH) REFERENCES Dim_LoaiCuaHang;

IF (OBJECT_ID('FK_CuaHang_QuocGia', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Dim_CuaHang DROP CONSTRAINT FK_CuaHang_QuocGia
END
ALTER TABLE Dim_CuaHang
ADD CONSTRAINT FK_CuaHang_QuocGia
FOREIGN KEY (SKMaQG) REFERENCES Dim_QuocGia;

---------------------- Khách Hàng
IF (OBJECT_ID('FK_KhaDim_KhachHang_QuocGia', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Dim_KhachHang DROP CONSTRAINT FK_KhaDim_KhachHang_QuocGia
END
ALTER TABLE Dim_KhachHang
ADD CONSTRAINT FK_KhaDim_KhachHang_QuocGia
FOREIGN KEY (SKMaQG) REFERENCES Dim_QuocGia;

--------------------- Sản Phẩm
IF (OBJECT_ID('FK_KhaDim_SanPham_LoaiSanPham', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Dim_SanPham DROP CONSTRAINT FK_KhaDim_SanPham_LoaiSanPham
END
ALTER TABLE Dim_SanPham
ADD CONSTRAINT FK_KhaDim_SanPham_LoaiSanPham
FOREIGN KEY (SKMaLoaiSP) REFERENCES Dim_LoaiSanPham;

----- UPDATE METADATFLOW CHO CÁC FLOW TỪ NDS SANG DDS
USE DALT_METADATA;

INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('Dim_QuocGia_NDStoDDS','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('Dim_LoaiCuaHang_NDStoDDS','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('Dim_LoaiSanPham_NDStoDDS','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('Dim_CuaHang_NDStoDDS','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('Dim_KhachHang_NDStoDDS','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('Dim_SanPham_NDStoDDS','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('Dim_HoaDon_NDStoDDS','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('Fact_CTHD_NDStoDDS','1900-01-01',NULL);

SELECT * FROM Metadata_Table;
