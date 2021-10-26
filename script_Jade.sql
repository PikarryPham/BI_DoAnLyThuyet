-- B1. TẠO CSDL CHO DB NGUỒN CHO DB JADE. TRONG ĐÓ CSDL JADE GỒM HoaDon, KhachHang, CTHD
USE master 
GO
IF DB_ID('DALT_Jade') IS NOT NULL
	DROP DATABASE DALT_Jade
GO
CREATE DATABASE DALT_Jade
GO
USE DALT_Jade
GO

-----------------------------------------------
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[ChiTietHoaDon_Jade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[ChiTietHoaDon_Jade]
GO

--
-- Dropping table HoaDon_Jade : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[HoaDon_Jade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[HoaDon_Jade]
GO

--
-- Dropping table KhachHang_Jade : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[KhachHang_Jade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[KhachHang_Jade]
GO

--
-- Dropping stored procedure sp_alterdiagram : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_alterdiagram]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_alterdiagram]
GO

--
-- Dropping stored procedure sp_creatediagram : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_creatediagram]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_creatediagram]
GO

--
-- Dropping stored procedure sp_dropdiagram : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_dropdiagram]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_dropdiagram]
GO

--
-- Dropping stored procedure sp_helpdiagramdefinition : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_helpdiagramdefinition]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_helpdiagramdefinition]
GO

--
-- Dropping stored procedure sp_helpdiagrams : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_helpdiagrams]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_helpdiagrams]
GO

--
-- Dropping stored procedure sp_renamediagram : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_renamediagram]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_renamediagram]
GO

--
-- Dropping table sysdiagrams : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sysdiagrams]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[sysdiagrams]
GO

--
-- Dropping user-defined data type sysname : 
--

--
-- Dropping user-defined function fn_diagramobjects : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[fn_diagramobjects]') AND xtype IN (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbo].[fn_diagramobjects]
GO

--
-- Dropping stored procedure sp_upgraddiagrams : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_upgraddiagrams]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_upgraddiagrams]
GO

--
-- Definition for table KhachHang_Jade : 
--

CREATE TABLE [dbo].[KhachHang_Jade] (
  [MaKH] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [TenKH] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [DiaChi] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayTao] datetime NULL,
  [NgayCapNhat] datetime NULL,
  [TrangThai] int NULL,
  [GioiTinh] char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [SoThich] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgheNghiep] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table HoaDon_Jade : 
--

CREATE TABLE [dbo].[HoaDon_Jade] (
  [MaHD] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [MaKH] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [MaCH] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayBan] datetime NULL,
  [NgayCapNhat] datetime NULL,
  [TrangThai] int NULL
)
ON [PRIMARY]
GO

--
-- Definition for table ChiTietHoaDon_Jade : 
--

CREATE TABLE [dbo].[ChiTietHoaDon_Jade] (
  [MaChiTiet] int NOT NULL,
  [MaHD] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [MaSP] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayTao] datetime NULL,
  [NgayCapNhat] datetime NULL,
  [TrangThai] int NULL
)
ON [PRIMARY]
GO

--
-- Definition for table sysdiagrams : 
--

CREATE TABLE [dbo].[sysdiagrams] (
  [name] sysname COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [principal_id] int NOT NULL,
  [diagram_id] int IDENTITY(1, 1) NOT NULL,
  [version] int NULL,
  [definition] varbinary(max) NULL
)
ON [PRIMARY]
GO

--
-- Definition for user-defined function fn_diagramobjects : 
--
GO
	CREATE FUNCTION dbo.fn_diagramobjects() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
GO

--
-- Definition for stored procedure sp_alterdiagram : 
--
GO
	CREATE PROCEDURE dbo.sp_alterdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
GO

--
-- Definition for stored procedure sp_creatediagram : 
--
GO
	CREATE PROCEDURE dbo.sp_creatediagram
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
GO

--
-- Definition for stored procedure sp_dropdiagram : 
--
GO
	CREATE PROCEDURE dbo.sp_dropdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
GO

--
-- Definition for stored procedure sp_helpdiagramdefinition : 
--
GO
	CREATE PROCEDURE dbo.sp_helpdiagramdefinition
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
GO

--
-- Definition for stored procedure sp_helpdiagrams : 
--
GO
	CREATE PROCEDURE dbo.sp_helpdiagrams
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
GO

--
-- Definition for stored procedure sp_renamediagram : 
--
GO
	CREATE PROCEDURE dbo.sp_renamediagram
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
GO

--
-- Definition for stored procedure sp_upgraddiagrams : 
--
GO
	CREATE PROCEDURE dbo.sp_upgraddiagrams
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
GO

TRUNCATE TABLE ChiTietHoaDon_Jade;
TRUNCATE TABLE KhachHang_Jade;
TRUNCATE TABLE HoaDon_Jade;