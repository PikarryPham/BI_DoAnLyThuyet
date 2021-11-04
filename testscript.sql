Use DALT_STAGE
GO


SELECT * FROM CuaHang_Stage;
SELECT * FROM LoaiCuaHang_Stage;
SELECT * FROM Nuoc_Stage;
SELECT * FROM HoaDon_Stage;

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
SELECT * FROM CuaHang_Jupiter
SELECT * FROM LoaiCuaHang_Jupiter

INSERT INTO Nuoc_Jupiter([MaNuoc]
      ,[TenNuoc]
      ,[NgayTao]
      ,[NgayCapNhat]
      ,[TrangThai])
VALUES('CDZ','VietName - Da Nang','2021-11-04 09:04:20.123',NULL,1);

SELECT GETDATE();