Use DALT_STAGE
GO


TRUNCATE TABLE LoaiSanPham_Stage;

SELECT * FROM CuaHang_Stage;
SELECT * FROM LoaiCuaHang_Stage;
/****** Script for SelectTopNRows command from SSMS  ******/
DELETE FROM LoaiCuaHang_Stage WHERE MaLoaiCH = '2610';
-- INSERT INTO LoaiCuaHang_Stage VALUES('2610','BlackRed',GETDATE(),GETDATE(),1);
SELECT * FROM Nuoc_Stage;
-- INSERT INTO Nuoc_Stage VALUES('ACFE','VietNam - HCMC',GETDATE(),GETDATE(),1);
SELECT * FROM HoaDon_Stage;
SELECT * FROM LoaiSanPham_Stage;
-- INSERT INTO LoaiSanPham_Stage VALUES('2610','KidsClothes',GETDATE(),GETDATE(),1);

SELECT GETDATE();

Use DALT_Jade
GO

SELECT * FROM HoaDon_Jade;

INSERT INTO HoaDon_Jade([MaHD]
      ,[MaKH]
      ,[MaCH]
      ,[NgayBan]
      ,[NgayCapNhat]
      ,[TrangThai]
)
values ('2610','G0G6','YWA4','2021-11-04 08:45:38.337',NULL,1);

Use DALT_METADATA
GO
SELECT * FROM Metadata_Table;

UPDATE Metadata_Table
SET CET = NULL 
WHERE Name_DataFlow = 'CuaHang_Jupiter';

UPDATE Metadata_Table
SET LSET = '1900-01-01' 
WHERE Name_DataFlow = 'CuaHang_Jupiter';

--UPDATE Metadata_Table
--SET CET = NULL 
--WHERE Name_DataFlow = 'HoaDon_Jade';

--UPDATE Metadata_Table
--SET LSET = '1900-01-01' 
--WHERE Name_DataFlow = 'HoaDon_Jade';

UPDATE Metadata_Table
SET CET = NULL 
WHERE Name_DataFlow = 'LoaiSanPham_Jupiter';

UPDATE Metadata_Table
SET LSET = '1900-01-01' 
WHERE Name_DataFlow = 'LoaiSanPham_Jupiter';

UPDATE Metadata_Table
SET CET = NULL 
WHERE Name_DataFlow = 'LoaiCuaHang_Jupiter';
UPDATE Metadata_Table
SET LSET = '1900-01-01' 
WHERE Name_DataFlow = 'LoaiCuaHang_Jupiter';


UPDATE Metadata_Table
SET CET = NULL 
WHERE Name_DataFlow = 'Nuoc_Jupiter';
UPDATE Metadata_Table
SET LSET = '1900-01-01' 
WHERE Name_DataFlow = 'Nuoc_Jupiter';


Use DALT_Jupiter
GO

SELECT * FROM Nuoc_Jupiter
WHERE TenNuoc LIKE '%Kazakhstan%'
SELECT * FROM CuaHang_Jupiter
SELECT * FROM LoaiCuaHang_Jupiter
SELECT * FROM LoaiSanPham_Jupiter

INSERT INTO Nuoc_Jupiter([MaNuoc]
      ,[TenNuoc]
      ,[NgayTao]
      ,[NgayCapNhat]
      ,[TrangThai])
VALUES('CDZ','VietName - Da Nang','2021-11-04 09:04:20.123',NULL,1);

SELECT GETDATE();

Use DALT_NDS
GO

SELECT *
FROM LoaiCuaHang
WHERE MaNguon  = 1;

SELECT *
FROM LoaiSanPham
WHERE MaNguon  = 1;


DELETE FROM QuocGia WHERE MaNguon  = 1;
SELECT *
FROM QuocGia
WHERE MaNguon  = 1;

--UPDATE LoaiCuaHang
--SET NgayCapNhat = GETDATE(),TenLoaiCH = ?,MaTrangThai = ? 
--WHERE MaLoaiCH = ? AND MaNguon = ?

--UPDATE LoaiSanPham
--SET NgayCapNhat = GETDATE(),TenLoaiSP = ?,MaTrangThai = ? 
--WHERE MaLoaiSP = ? AND MaNguon = ?

UPDATE QuocGia
SET NgayCapNhat = GETDATE(),TenQG = ?,MaTrangThai = ? 
WHERE MaQG = ? AND MaNguon = ?