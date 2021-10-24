-- TẠO CSDL CHO DB STAGE
USE master 
GO
IF DB_ID('DALT_METADATA') IS NOT NULL
	DROP DATABASE DALT_METADATA
GO
CREATE DATABASE DALT_METADATA
GO
USE DALT_METADATA
GO

/*
	Check if table exists? Drop before creating : create
*/

IF OBJECT_ID(N'dbo.Metadata_Table', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Metadata_Table;
	PRINT 'Delete Table Successfully';
END;

CREATE TABLE Metadata_Table (
	ID INTEGER IDENTITY(1,1) NOT NULL,
	Name_DataFlow VARCHAR(512),
	LSET DATETIME,
	CET DATETIME
);
TRUNCATE TABLE Metadata_Table;
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('KhachHang_Jade','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('HoaDon_Jade','1900-01-01',NULL);
INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('ChiTietHoaDon_Jade','1900-01-01',NULL);

SELECT * FROM Metadata_Table;