Use DALT_STAGE
GO

SELECT * FROM CuaHang_Stage;
SELECT * FROM LoaiCuaHang_Stage;
SELECT * FROM Nuoc_Stage;

SELECT GETDATE();

Use DALT_METADATA
GO
SELECT * FROM Metadata_Table;

UPDATE Metadata_Table
SET CET = NULL 
WHERE Name_DataFlow = 'CuaHang_Jupiter';

Use DALT_Jupiter
GO

INSERT INTO Nuoc_Jupiter([MaNuoc]
      ,[TenNuoc]
      ,[NgayTao]
      ,[NgayCapNhat]
      ,[TrangThai])
VALUES('ABC','VietNam - HCMC','2021-10-30 22:32:10.490',NULL,1);
