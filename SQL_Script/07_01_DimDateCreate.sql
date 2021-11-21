--- THIẾT KẾ BẢNG DimDate cho ĐALT
--USE master 
--GO
--IF DB_ID('DALT_DW') IS NOT NULL
--	DROP DATABASE DALT_DW
--GO
--CREATE DATABASE DALT_DW
--GO
USE DALT_DW
GO

/* Cách 1 */

IF OBJECT_ID(N'dbo.DimDate', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.DimDate;
	PRINT 'Delete Table Successfully';
END;

if object_id('dbo.DimDate', 'U') is not null
begin
	raiserror (N'Object named %s already exists in database!', 16, 1, N'[dbo].[DimDate]', 5)
	return
end
else
begin
	CREATE TABLE [dbo].[DimDate] (
		SKDate INTEGER IDENTITY(1,1) NOT NULL, --PRIMARY KEY NOT NULL,
		[Date] [int] NOT NULL
		,[FullDateAlternateKey] [date] NOT NULL
		,[DateEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- D
		,[DayOfWeek] [smallint] NOT NULL DEFAULT (-1)
		,[DayOfWeekEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[DayOfMonth] [smallint] NOT NULL DEFAULT (-1)
		,[DayOfMonthEnglishName] [varchar](20) DEFAULT ('Unknown')
		,[DayOfQuarter] [smallint] NOT NULL DEFAULT (-1)
		,[DayOfQuarterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[DayOfTrimester] [smallint] NOT NULL DEFAULT (-1)
		,[DayOfTrimesterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[DayOfHalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[DayOfHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[DayOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[DayOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[Weekday] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- W
		,[Week] [int] NOT NULL DEFAULT (-1)
		,[WeekEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[WeekOfYear] [int] NOT NULL DEFAULT (-1)
		,[WeekOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- t
		,[TenDays] [int] NOT NULL DEFAULT (-1)
		,[TenDaysEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[TenDaysOfMonth] [smallint] NOT NULL DEFAULT (-1)
		,[TenDaysOfMonthEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[TenDaysOfQuarter] [smallint] NOT NULL DEFAULT (-1)
		,[TenDaysOfQuarterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[TenDaysOfTrimester] [smallint] NOT NULL DEFAULT (-1)
		,[TenDaysOfTrimesterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[TenDaysOfHalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[TenDaysOfHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[TenDaysOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[TenDaysOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		--M
		,[Month] [int] NOT NULL DEFAULT (-1)
		,[MonthEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[MonthOfQuarter] [smallint] NOT NULL DEFAULT (-1)
		,[MonthOfQuarterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[MonthOfTrimester] [smallint] NOT NULL DEFAULT (-1)
		,[MonthOfTrimesterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[MonthOfHalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[MonthOfHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[MonthOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[MonthOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- Q
		,[Quarter] [smallint] NOT NULL DEFAULT (-1)
		,[QuarterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[QuarterOfHalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[QuarterOfHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[QuarterOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[QuarterOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- T
		,[Trimester] [smallint] NOT NULL DEFAULT (-1)
		,[TrimesterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[TrimesterOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[TrimesterOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- H
		,[HalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[HalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[HalfYearOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[HalfYearOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- Y
		,[Year] [smallint] NOT NULL DEFAULT (-1)
		,[YearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- FD
		,[FiscalDay] [int] NOT NULL DEFAULT (-1)
		,[FiscalDayEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalDayOfWeek] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalDayOfWeekEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalDayOfMonth] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalDayOfMonthEnglishName] [varchar](20) DEFAULT ('Unknown')
		,[FiscalDayOfQuarter] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalDayOfQuarterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalDayOfTrimester] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalDayOfTrimesterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalDayOfHalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalDayOfHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalDayOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalDayOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- FW
		,[FiscalWeek] [int] NOT NULL DEFAULT (-1)
		,[FiscalWeekEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalWeekOfMonth] [int] NOT NULL DEFAULT (-1)
		,[FiscalWeekOfMonthEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalWeekOfQuarter] [int] NOT NULL DEFAULT (-1)
		,[FiscalWeekOfQuarterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalWeekOfTrimester] [int] NOT NULL DEFAULT (-1)
		,[FiscalWeekOfTrimesterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalWeekOfHalfYear] [int] NOT NULL DEFAULT (-1)
		,[FiscalWeekOfHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalWeekOfYear] [int] NOT NULL DEFAULT (-1)
		,[FiscalWeekOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		--FM
		,[FiscalMonth] [int] NOT NULL DEFAULT (-1)
		,[FiscalMonthEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalMonthOfQuarter] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalMonthOfQuarterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalMonthOfTrimester] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalMonthOfTrimesterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalMonthOfHalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalMonthOfHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalMonthOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalMonthOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- FQ
		,[FiscalQuarter] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalQuarterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalQuarterOfHalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalQuarterOfHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalQuarterOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalQuarterOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- FT
		,[FiscalTrimester] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalTrimesterEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalTrimesterOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalTrimesterOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- FH
		,[FiscalHalfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalHalfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,[FiscalHalfYearOfYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalHalfYearOfYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		-- FY
		,[FiscalYear] [smallint] NOT NULL DEFAULT (-1)
		,[FiscalYearEnglishName] [varchar](20) NOT NULL DEFAULT ('Unknown')
		,NgayTao DATETIME
		,NgayCapNhat DATETIME
		-- Primary Key
		,CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([SKDate] ASC)
	)


	print '[dbo].[DimDate] created successfully.'
end


/*Cách 2*/
IF OBJECT_ID(N'dbo.DimDate_02', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.DimDate_02;
	PRINT 'Delete Table Successfully';
END;

CREATE TABLE DimDate_02
(
	SKDate INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL, --PRIMARY KEY NOT NULL,
	DateKey INT NOT NULL,
	FullDateAlternateKey VARCHAR(215) NOT NULL,
	DayNumberOfWeek INT NOT NULL,
	EnglishDayNameOfWeek VARCHAR(215) NOT NULL,
	DayNumberOfMonth INT NOT NULL,
	DayNumberOfYear INT NOT NULL,
	WeekNumberOfYear INT NOT NULL,
	EnglishMonthName VARCHAR(215) NOT NULL,
	MonthNumberOfYear INT NOT NULL,
	CalendarQuarter INT NOT NULL,
	CalendarYear INT NOT NULL,
	CalendarSemester INT NOT NULL,
	FiscalQuarter INT NOT NULL,
	FiscalYear INT NOT NULL,
	FiscalSemester INT NOT NULL,
);
