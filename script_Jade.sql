SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KhachHang_Jade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KhachHang_Jade](
	[MaKH] [varchar](4) NOT NULL,
	[TenKH] [varchar](50) NULL,
	[DiaChi] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDon_Jade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChiTietHoaDon_Jade](
	[MaChiTiet] [int] NOT NULL,
	[MaHD] [varchar](4) NULL,
	[MaSP] [varchar](4) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon_Jade] PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HoaDon_Jade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HoaDon_Jade](
	[MaHD] [varchar](4) NOT NULL,
	[MaKH] [varchar](4) NULL,
	[MaCH] [varchar](4) NULL,
	[NgayBan] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_HoaDon_Jade] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChiTietHoaDon_Jade_HoaDon_Jade]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDon_Jade]'))
ALTER TABLE [dbo].[ChiTietHoaDon_Jade]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Jade_HoaDon_Jade] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon_Jade] ([MaHD])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HoaDon_Jade_KhachHang_Jade]') AND parent_object_id = OBJECT_ID(N'[dbo].[HoaDon_Jade]'))
ALTER TABLE [dbo].[HoaDon_Jade]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Jade_KhachHang_Jade] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang_Jade] ([MaKH])
