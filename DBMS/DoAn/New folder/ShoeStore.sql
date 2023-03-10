CREATE DATABASE [ShoeStore]
GO
/****** Object:  Database [ShoeStore]    Script Date: 24/12/2020 09:10:56 ******/

GO
ALTER DATABASE [ShoeStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoeStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoeStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoeStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoeStore] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoeStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoeStore', N'ON'
GO
ALTER DATABASE [ShoeStore] SET QUERY_STORE = OFF
GO
USE [ShoeStore]
GO
/****** Object:  UserDefinedFunction [dbo].[f_loinhuan_ngay]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_loinhuan_ngay] (@ngayban date)
returns float
as
begin
declare @soluonggiayban int ,@giaban float,@gianhap float,@loinhuan float,@tongloinhuan float

select @soluonggiayban =cthd.soLuong ,@giaban = cthd.donGia,@gianhap=ctnk.donGia
from CHITIETNHAPKHO as ctnk ,CHITIETHOADON as cthd ,HOADON as hd 
where cthd.idHoaDon=hd.idHoaDon and ctnk.idGiay =ctnk.idGiay and hd.ngayInHoaDon =@ngayban and cthd.status=1

set @loinhuan = @soluonggiayban * (@giaban -@gianhap)
set @tongloinhuan =SUM(@loinhuan)
return @tongloinhuan
end
GO
/****** Object:  UserDefinedFunction [dbo].[f_slhoadon]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[f_slhoadon]()
returns int
as
begin
declare @sl int 
set @sl = (select COUNT(idHoaDon) from HOADON)
return @sl
end 
GO
/****** Object:  UserDefinedFunction [dbo].[f_tonghoadon_time]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_tonghoadon_time] (@day date)
returns int
as
begin
declare @tonghoadon int
select @tonghoadon =COUNT(idHoaDon) from HOADON where HOADON.ngayInHoaDon=@day
return @tonghoadon
end
GO
/****** Object:  Table [dbo].[NHAPKHO]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAPKHO](
	[idNhapKho] [int] IDENTITY(1,1) NOT NULL,
	[idNV] [int] NULL,
	[idNCC] [int] NULL,
	[ngayNhapKho] [date] NOT NULL,
	[soLuong] [int] NOT NULL,
	[thanhTien] [float] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNhapKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_loaddanhsachkho]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_loaddanhsachkho] 
as
	select *
	from NHAPKHO
	where NHAPKHO.status=1 
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[idKH] [int] IDENTITY(1,1) NOT NULL,
	[tenKH] [nvarchar](150) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[tongTien] [float] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[idHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[idNV] [int] NULL,
	[idKH] [int] NULL,
	[ngayInHoaDon] [date] NOT NULL,
	[soLuong] [int] NOT NULL,
	[thanhTien] [float] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_tinhtienhoadonkhachhang]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_tinhtienhoadonkhachhang] ()
returns table
as
return (SELECT KHACHHANG.tenKH, sum(HOADON.thanhTien) as tongtienkhachhang  From KHACHHANG,HOADON 
		where  KHACHHANG.idKH = HOADON.idKH
		group by KHACHHANG.tenKH)
GO
/****** Object:  Table [dbo].[LOAIGIAY]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIGIAY](
	[idLoaiGiay] [int] IDENTITY(1,1) NOT NULL,
	[maLoaiGiay] [varchar](50) NULL,
	[tenLoaiGiay] [nvarchar](150) NOT NULL,
	[idHangGiay] [int] NULL,
	[soLuongLoaiGiay] [int] NOT NULL,
	[linkImage] [varchar](500) NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLoaiGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIAY]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAY](
	[idGiay] [int] IDENTITY(1,1) NOT NULL,
	[maGiay] [varchar](50) NULL,
	[idLoaiGiay] [int] NULL,
	[mauSac] [nvarchar](20) NOT NULL,
	[size] [int] NOT NULL,
	[soLuongGiay] [int] NOT NULL,
	[giaBan] [float] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[idChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[idHoaDon] [int] NULL,
	[idGiay] [int] NULL,
	[donGia] [float] NOT NULL,
	[soLuong] [int] NOT NULL,
	[thanhTien] [float] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_giaybanduoc]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_giaybanduoc]
as 
select g.idGiay ,lg.tenLoaiGiay,hd.thanhTien,hd.soLuong
from CHITIETHOADON as hd ,LOAIGIAY as lg ,GIAY as g
where hd.idGiay = g.idGiay and g.idLoaiGiay =lg.idLoaiGiay
GO
/****** Object:  UserDefinedFunction [dbo].[f_loaigiay_nsx]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_loaigiay_nsx] (@idhanggiay int)
returns table 
as
return (select idLoaiGiay,maLoaiGiay,tenLoaiGiay,idHangGiay,soLuongLoaiGiay,status   from LOAIGIAY where idHangGiay =@idhanggiay)
GO
/****** Object:  UserDefinedFunction [dbo].[f_khachhang_sdt]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[f_khachhang_sdt](@sdt varchar(10))
returns table
as
return(select * from KHACHHANG where sdt =@sdt)
GO
/****** Object:  View [dbo].[v_khachhang_hoadon]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_khachhang_hoadon]
as
select hd.idHoaDon ,kh.idKH ,kh.tenKH,kh.sdt,kh.tongTien,kh.status
from KHACHHANG as kh ,HOADON as hd
where hd.idKH =kh.idKH
GO
/****** Object:  View [dbo].[v_thongtingiay]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_thongtingiay]
as
select LOAIGIAY.idLoaiGiay, tenLoaiGiay, maLoaiGiay,GIAY.idGiay
from LOAIGIAY,GIAY 
where LOAIGIAY.idLoaiGiay = GIAY.idLoaiGiay
GO
/****** Object:  Table [dbo].[CHITIETNHAPKHO]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETNHAPKHO](
	[idChiTietPNK] [int] IDENTITY(1,1) NOT NULL,
	[idNhapKho] [int] NULL,
	[idGiay] [int] NULL,
	[soLuong] [int] NOT NULL,
	[donGia] [float] NOT NULL,
	[thanhTien] [float] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idChiTietPNK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANGGIAY]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGGIAY](
	[idHangGiay] [int] IDENTITY(1,1) NOT NULL,
	[tenHangGiay] [nvarchar](150) NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHangGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[idNCC] [int] IDENTITY(1,1) NOT NULL,
	[tenNCC] [nvarchar](150) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[diaChi] [nvarchar](250) NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[idNV] [int] IDENTITY(1,1) NOT NULL,
	[tenNV] [nvarchar](150) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](500) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[phanQuyen] [int] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CHITIETHOADON] ON 

INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (11, 6, 1, 1500000, 4, 6000000, 1)
INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (12, 6, 2, 1500000, 2, 3000000, 1)
INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (13, 6, 10, 0, 0, 0, 0)
INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (14, 7, 2, 0, 0, 0, 0)
INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (15, 7, 1, 0, 0, 0, 0)
INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (16, 9, 1, 0, 0, 0, 0)
INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (17, 9, 1, 1500000, 10, 15000000, 1)
INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (18, 10, 1, 0, 0, 0, 0)
INSERT [dbo].[CHITIETHOADON] ([idChiTietHoaDon], [idHoaDon], [idGiay], [donGia], [soLuong], [thanhTien], [status]) VALUES (19, 10, 1, 1500000, 6, 9000000, 1)
SET IDENTITY_INSERT [dbo].[CHITIETHOADON] OFF
SET IDENTITY_INSERT [dbo].[CHITIETNHAPKHO] ON 

INSERT [dbo].[CHITIETNHAPKHO] ([idChiTietPNK], [idNhapKho], [idGiay], [soLuong], [donGia], [thanhTien], [status]) VALUES (18, 9, 1, 10, 1000000, 10000000, 1)
INSERT [dbo].[CHITIETNHAPKHO] ([idChiTietPNK], [idNhapKho], [idGiay], [soLuong], [donGia], [thanhTien], [status]) VALUES (19, 9, 2, 12, 1000000, 12000000, 1)
INSERT [dbo].[CHITIETNHAPKHO] ([idChiTietPNK], [idNhapKho], [idGiay], [soLuong], [donGia], [thanhTien], [status]) VALUES (20, 9, 10, 0, 0, 0, 0)
INSERT [dbo].[CHITIETNHAPKHO] ([idChiTietPNK], [idNhapKho], [idGiay], [soLuong], [donGia], [thanhTien], [status]) VALUES (21, 9, 3, 5, 1000000, 5000000, 1)
INSERT [dbo].[CHITIETNHAPKHO] ([idChiTietPNK], [idNhapKho], [idGiay], [soLuong], [donGia], [thanhTien], [status]) VALUES (22, 11, 1, 10, 500000, 5000000, 1)
SET IDENTITY_INSERT [dbo].[CHITIETNHAPKHO] OFF
SET IDENTITY_INSERT [dbo].[GIAY] ON 

INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (1, NULL, 1, N'Trắng', 35, 10, 1500000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (2, NULL, 1, N'Trắng', 36, 20, 1500000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (3, NULL, 1, N'Trắng', 37, 15, 1500000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (4, NULL, 1, N'Trắng', 38, 15, 1500000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (5, NULL, 1, N'Trắng', 39, 10, 150000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (6, NULL, 2, N'Trắng', 40, 10, 2000000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (7, NULL, 2, N'Trắng', 41, 10, 2000000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (8, NULL, 2, N'Trắng', 42, 10, 2000000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (9, NULL, 2, N'Trắng', 43, 10, 2000000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (10, NULL, 2, N'Trắng', 44, 10, 2000000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (11, NULL, 2, N'Trắng', 45, 10, 2000000, 1)
INSERT [dbo].[GIAY] ([idGiay], [maGiay], [idLoaiGiay], [mauSac], [size], [soLuongGiay], [giaBan], [status]) VALUES (45, N'g001', 2, N'đỏ', 36, 20, 1600000, 1)
SET IDENTITY_INSERT [dbo].[GIAY] OFF
SET IDENTITY_INSERT [dbo].[HANGGIAY] ON 

INSERT [dbo].[HANGGIAY] ([idHangGiay], [tenHangGiay], [status]) VALUES (1, N'Nike', 1)
INSERT [dbo].[HANGGIAY] ([idHangGiay], [tenHangGiay], [status]) VALUES (2, N'Addidas', 1)
INSERT [dbo].[HANGGIAY] ([idHangGiay], [tenHangGiay], [status]) VALUES (3, N'Vans', 1)
INSERT [dbo].[HANGGIAY] ([idHangGiay], [tenHangGiay], [status]) VALUES (4, N'Converse', 1)
INSERT [dbo].[HANGGIAY] ([idHangGiay], [tenHangGiay], [status]) VALUES (5, N'Fila', 1)
SET IDENTITY_INSERT [dbo].[HANGGIAY] OFF
SET IDENTITY_INSERT [dbo].[HOADON] ON 

INSERT [dbo].[HOADON] ([idHoaDon], [idNV], [idKH], [ngayInHoaDon], [soLuong], [thanhTien], [status]) VALUES (6, 1, 1, CAST(N'2020-12-12' AS Date), 6, 9000000, 1)
INSERT [dbo].[HOADON] ([idHoaDon], [idNV], [idKH], [ngayInHoaDon], [soLuong], [thanhTien], [status]) VALUES (7, 1, 1, CAST(N'2020-12-13' AS Date), 0, 0, 0)
INSERT [dbo].[HOADON] ([idHoaDon], [idNV], [idKH], [ngayInHoaDon], [soLuong], [thanhTien], [status]) VALUES (8, 1, 1, CAST(N'2020-12-14' AS Date), 0, 0, 1)
INSERT [dbo].[HOADON] ([idHoaDon], [idNV], [idKH], [ngayInHoaDon], [soLuong], [thanhTien], [status]) VALUES (9, 1, 69, CAST(N'2020-12-23' AS Date), 10, 15000000, 1)
INSERT [dbo].[HOADON] ([idHoaDon], [idNV], [idKH], [ngayInHoaDon], [soLuong], [thanhTien], [status]) VALUES (10, 1, 69, CAST(N'2020-12-23' AS Date), 6, 9000000, 1)
SET IDENTITY_INSERT [dbo].[HOADON] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([idKH], [tenKH], [sdt], [tongTien], [status]) VALUES (1, N'Nguyễn Văn A', N'0326526984', 9000000, 1)
INSERT [dbo].[KHACHHANG] ([idKH], [tenKH], [sdt], [tongTien], [status]) VALUES (2, N'Nguyễn Thị B', N'0962333621', 0, 1)
INSERT [dbo].[KHACHHANG] ([idKH], [tenKH], [sdt], [tongTien], [status]) VALUES (3, N'Trần Văn C', N'0946312497', 0, 1)
INSERT [dbo].[KHACHHANG] ([idKH], [tenKH], [sdt], [tongTien], [status]) VALUES (4, N'Lý Hiển Long', N'0389421573', 0, 1)
INSERT [dbo].[KHACHHANG] ([idKH], [tenKH], [sdt], [tongTien], [status]) VALUES (69, N'Vũ', N'0386232296', 24000000, 1)
INSERT [dbo].[KHACHHANG] ([idKH], [tenKH], [sdt], [tongTien], [status]) VALUES (71, N'Xuâng', N'0988720113', 2000000, 0)
INSERT [dbo].[KHACHHANG] ([idKH], [tenKH], [sdt], [tongTien], [status]) VALUES (72, N'hieu', N'0906050123', 0, 1)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAIGIAY] ON 

INSERT [dbo].[LOAIGIAY] ([idLoaiGiay], [maLoaiGiay], [tenLoaiGiay], [idHangGiay], [soLuongLoaiGiay], [linkImage], [status]) VALUES (1, NULL, N'Nike Air Max 90 Premium', 1, 70, NULL, 1)
INSERT [dbo].[LOAIGIAY] ([idLoaiGiay], [maLoaiGiay], [tenLoaiGiay], [idHangGiay], [soLuongLoaiGiay], [linkImage], [status]) VALUES (2, NULL, N'Nike Air Max Tailwind V SP', 1, 80, NULL, 1)
INSERT [dbo].[LOAIGIAY] ([idLoaiGiay], [maLoaiGiay], [tenLoaiGiay], [idHangGiay], [soLuongLoaiGiay], [linkImage], [status]) VALUES (3, NULL, N'ULTRA 4D', 2, 0, NULL, 1)
INSERT [dbo].[LOAIGIAY] ([idLoaiGiay], [maLoaiGiay], [tenLoaiGiay], [idHangGiay], [soLuongLoaiGiay], [linkImage], [status]) VALUES (4, NULL, N'ULTRABOOST', 2, 0, NULL, 1)
INSERT [dbo].[LOAIGIAY] ([idLoaiGiay], [maLoaiGiay], [tenLoaiGiay], [idHangGiay], [soLuongLoaiGiay], [linkImage], [status]) VALUES (6, NULL, N'Nike Dior', 1, 10, NULL, 1)
SET IDENTITY_INSERT [dbo].[LOAIGIAY] OFF
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

INSERT [dbo].[NHACUNGCAP] ([idNCC], [tenNCC], [sdt], [email], [diaChi], [status]) VALUES (1, N'Hùng Hiệp Việt', N'0439743488', N'hunghiepviet@hhv.com.vn', N'Tầng 12, số 29 Nguyễn Đình Chiểu, Phường Lê Đại Hành, Quận Hai Bà Trưng, Hà Nội', 1)
INSERT [dbo].[NHACUNGCAP] ([idNCC], [tenNCC], [sdt], [email], [diaChi], [status]) VALUES (2, N'ACFC', N'84 (28) 3825 6523', N'do.bui@acfc.com.vn', N'Tầng 6, Tòa nhà Sài Gòn Royal, 91 Pasteur, P.Bến Nghé, Q.1, TP Hồ Chí Minh', 1)
INSERT [dbo].[NHACUNGCAP] ([idNCC], [tenNCC], [sdt], [email], [diaChi], [status]) VALUES (3, N'Drake', N'1800.0080', N'support@drake.vn', N'879 Nguyễn Kiệm, P.3, Gò Vấp, HCM', 1)
INSERT [dbo].[NHACUNGCAP] ([idNCC], [tenNCC], [sdt], [email], [diaChi], [status]) VALUES (4, N'Fila Việt Nam', N'0898 516 156', N'filavietnam.vn@gmail.com', N'TP Hồ Chí Minh', 1)
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([idNV], [tenNV], [username], [password], [sdt], [email], [phanQuyen], [status]) VALUES (1, N'Nguyễn Tuấn Vũ', N'admin01', N'admin01', N'01231312125', N'admin01@shoestore.com', 0, 1)
INSERT [dbo].[NHANVIEN] ([idNV], [tenNV], [username], [password], [sdt], [email], [phanQuyen], [status]) VALUES (2, N'Nguyễn Xuân Hiệu', N'admin02', N'admin02', N'01231312122', N'admin02@shoestore.com', 0, 1)
INSERT [dbo].[NHANVIEN] ([idNV], [tenNV], [username], [password], [sdt], [email], [phanQuyen], [status]) VALUES (3, N'Trần Thị Lệ Xuân', N'user01', N'user01', N'01231312120', N'user01@shoestore.com', 1, 1)
INSERT [dbo].[NHANVIEN] ([idNV], [tenNV], [username], [password], [sdt], [email], [phanQuyen], [status]) VALUES (4, N'Trương Hùng Anh', N'user02', N'user02', N'01231312920', N'user02@shoestore.com', 1, 1)
INSERT [dbo].[NHANVIEN] ([idNV], [tenNV], [username], [password], [sdt], [email], [phanQuyen], [status]) VALUES (6, N'Nguyễn Quốc Bảo', N'bao3042', N'300459', N'0988720113', N'bao3042@gmail.com', 1, 1)
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
SET IDENTITY_INSERT [dbo].[NHAPKHO] ON 

INSERT [dbo].[NHAPKHO] ([idNhapKho], [idNV], [idNCC], [ngayNhapKho], [soLuong], [thanhTien], [status]) VALUES (9, 1, 1, CAST(N'2020-12-12' AS Date), 27, 27000000, 1)
INSERT [dbo].[NHAPKHO] ([idNhapKho], [idNV], [idNCC], [ngayNhapKho], [soLuong], [thanhTien], [status]) VALUES (10, 1, 1, CAST(N'2020-12-19' AS Date), 0, 0, 1)
INSERT [dbo].[NHAPKHO] ([idNhapKho], [idNV], [idNCC], [ngayNhapKho], [soLuong], [thanhTien], [status]) VALUES (11, 1, 1, CAST(N'2020-12-23' AS Date), 10, 5000000, 1)
SET IDENTITY_INSERT [dbo].[NHAPKHO] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_Giay]    Script Date: 24/12/2020 09:10:56 ******/
ALTER TABLE [dbo].[GIAY] ADD  CONSTRAINT [unique_Giay] UNIQUE NONCLUSTERED 
(
	[idLoaiGiay] ASC,
	[mauSac] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHITIETHOADON] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[CHITIETNHAPKHO] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[GIAY] ADD  DEFAULT ((0)) FOR [soLuongGiay]
GO
ALTER TABLE [dbo].[GIAY] ADD  DEFAULT ((0)) FOR [giaBan]
GO
ALTER TABLE [dbo].[GIAY] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[HANGGIAY] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[HOADON] ADD  DEFAULT ((0)) FOR [soLuong]
GO
ALTER TABLE [dbo].[HOADON] ADD  DEFAULT ((0)) FOR [thanhTien]
GO
ALTER TABLE [dbo].[HOADON] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[KHACHHANG] ADD  DEFAULT ((0)) FOR [tongTien]
GO
ALTER TABLE [dbo].[KHACHHANG] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[LOAIGIAY] ADD  DEFAULT ((0)) FOR [soLuongLoaiGiay]
GO
ALTER TABLE [dbo].[LOAIGIAY] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[NHACUNGCAP] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[NHANVIEN] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[NHAPKHO] ADD  DEFAULT ((0)) FOR [soLuong]
GO
ALTER TABLE [dbo].[NHAPKHO] ADD  DEFAULT ((0)) FOR [thanhTien]
GO
ALTER TABLE [dbo].[NHAPKHO] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD FOREIGN KEY([idGiay])
REFERENCES [dbo].[GIAY] ([idGiay])
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[HOADON] ([idHoaDon])
GO
ALTER TABLE [dbo].[CHITIETNHAPKHO]  WITH CHECK ADD FOREIGN KEY([idGiay])
REFERENCES [dbo].[GIAY] ([idGiay])
GO
ALTER TABLE [dbo].[CHITIETNHAPKHO]  WITH CHECK ADD FOREIGN KEY([idNhapKho])
REFERENCES [dbo].[NHAPKHO] ([idNhapKho])
GO
ALTER TABLE [dbo].[GIAY]  WITH CHECK ADD FOREIGN KEY([idLoaiGiay])
REFERENCES [dbo].[LOAIGIAY] ([idLoaiGiay])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([idKH])
REFERENCES [dbo].[KHACHHANG] ([idKH])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([idNV])
REFERENCES [dbo].[NHANVIEN] ([idNV])
GO
ALTER TABLE [dbo].[LOAIGIAY]  WITH CHECK ADD FOREIGN KEY([idHangGiay])
REFERENCES [dbo].[HANGGIAY] ([idHangGiay])
GO
ALTER TABLE [dbo].[NHAPKHO]  WITH CHECK ADD FOREIGN KEY([idNCC])
REFERENCES [dbo].[NHACUNGCAP] ([idNCC])
GO
ALTER TABLE [dbo].[NHAPKHO]  WITH CHECK ADD FOREIGN KEY([idNV])
REFERENCES [dbo].[NHANVIEN] ([idNV])
GO
/****** Object:  StoredProcedure [dbo].[pr_loadCTNK_idNK]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_loadCTNK_idNK] @idNk int
as
begin
	select * from CHITIETNHAPKHO, GIAY
	where CHITIETNHAPKHO.status=1 and CHITIETNHAPKHO.idGiay = GIAY.idGiay
	and CHITIETNHAPKHO.idNhapKho = @idNk
end
GO
/****** Object:  StoredProcedure [dbo].[pr_maxGiaBanGiay]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_maxGiaBanGiay]
as
begin
	declare @giaban float
	set @giaban = (select max(giaBan) as GiaBanCaoNhat
						from GIAY)
	select *from GIAY where GIAY.giaBan = @giaban
end
GO
/****** Object:  StoredProcedure [dbo].[pr_minGiaBanGiay]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_minGiaBanGiay]
as
begin
	declare @giaban float
	set @giaban = (select min(giaBan) as GiaBanCaoNhat
						from GIAY)
	select *from GIAY where GIAY.giaBan = @giaban
end
GO
/****** Object:  StoredProcedure [dbo].[pr_ThemChiTietHoaDon]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_ThemChiTietHoaDon] @idhoadon int, @idgiay int, @soluong int, @dongia int, @thanhTien float
as
begin
insert into CHITIETHOADON (idHoaDon, idGiay, donGia, thanhTien, soLuong)
values (@idhoadon, @idgiay, @dongia,@thanhTien, @soluong)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_themChiTietNhapKho]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_themChiTietNhapKho]
@idNhapKho int, @idGiay int, @soLuong int, @donGia float, @thanhTien float
as
begin
	insert into CHITIETNHAPKHO (idNhapKho, idGiay, soLuong, donGia, thanhTien)
	 values (@idNhapKho, @idGiay, @soLuong, @donGia, @thanhTien)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_themgiay]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_themgiay]
@tenloaigiay nvarchar(50),@idhanggiay int,@soluonggiay int
as
begin
	insert into LOAIGIAY(tenLoaiGiay,idHangGiay,soLuongLoaiGiay)
	values (@tenloaigiay,@idhanggiay,@soluonggiay)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_themHangGiay]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_themHangGiay] 
	@tenHG nvarchar(150), @status int
as
begin 
	insert into HANGGIAY(tenHangGiay, status) 
	values (@tenHG,@status)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_ThemHoaDon]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_ThemHoaDon] @idNV int, @idKH int, @ngayxuatdon date
as
begin 
insert into HOADON (idNV,idKH,ngayInHoaDon)
values (@idNV, @idKH,@ngayxuatdon)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_themkhachhang]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_themkhachhang]
@tenkh nvarchar(50),@sdt varchar(20)
as
begin
	insert into KHACHHANG(tenKH,sdt) values (@tenkh,@sdt)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_themNhanVien]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_themNhanVien]
	@tenNV nvarchar(150), @taikhoan varchar(50), @matkhau varchar(500), @sdt varchar(20), @mail varchar(150), @phanquyen int, @status int
as
begin 
	insert into NHANVIEN(tenNV, username, password, sdt, email, phanQuyen, status) 
	values (@tenNV ,@taikhoan ,@matkhau, @sdt, @mail, @phanquyen, @status)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_themphieunhapkho]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_themphieunhapkho] 
@idnv int ,@idNcc int, @ngaynhapkho date
as
begin 
insert into NHAPKHO(idNV,idNCC,ngayNhapKho) values (@idnv ,@idNcc ,@ngaynhapkho)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_thongKeTongDoanhThu]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_thongKeTongDoanhThu]
as
begin
select ngayInHoaDon, sum(soLuong) as TongSoLuong, sum(thanhTien) as TongThanhTien from HOADON where status=1 group by ngayInHoaDon
end
GO
/****** Object:  StoredProcedure [dbo].[pr_XoaChiTietHoaDon]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_XoaChiTietHoaDon] @idChiTietHoaDon int
 as
 begin
 update CHITIETHOADON set status=0 where idChiTietHoaDon =@idChiTietHoaDon
 End
GO
/****** Object:  StoredProcedure [dbo].[pr_XoaToanBoHoaDon]    Script Date: 24/12/2020 09:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pr_XoaToanBoHoaDon] @idHoaDon int
as
begin
update HOADON set status=0 where idHoaDon = @idHoaDon
update CHITIETHOADON set status=0 where idHoaDon = @idHoaDon
End
GO
/****** Object:  Trigger [dbo].[tr_insertCTHD]    Script Date: 24/12/2020 09:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger thêm chi tiết hoá đơn
create trigger [dbo].[tr_insertCTHD] on [dbo].[CHITIETHOADON]
for insert
as
begin 
	declare @soluong int, 
	@dongia float,
	@idgiay int, 
	@idChiTietHoaDon int,
	@idHoaDon int,
	@soluongthaydoi int

	select @soluong=ne.soLuong,
		@dongia=ne.donGia,
		@idgiay = ne.idGiay,
		@idChiTietHoaDon=idChiTietHoaDon,
		@idHoaDon=idHoaDon
	from inserted ne

	update GIAY
	set soLuongGiay = soLuongGiay - @soluong
	where idGiay = @idgiay

	update CHITIETHOADON
	set thanhTien=@soluong*@dongia
	where idChiTietHoaDon=@idchiTietHoaDon

	update HOADON
	set soLuong=soluong+@soluong,
		thanhTien = thanhtien+(@soluong*@dongia)
	where idHoaDon=@idHoaDon
end

--Trigger cập nhật/xoá chi tiết hoá đơn
GO
ALTER TABLE [dbo].[CHITIETHOADON] ENABLE TRIGGER [tr_insertCTHD]
GO
/****** Object:  Trigger [dbo].[tr_updateCTHD]    Script Date: 24/12/2020 09:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_updateCTHD] on [dbo].[CHITIETHOADON]
for update
as
declare @statusne int, @statusol int,
	@soluongthaydoi int,
	@idgiay int,
	@idhoadon int,
	@idChiTietHoaDon int,
	@dongia float,
	@soluongChiTietM int
select @statusne =ne.status, @statusol =ol.status, 
	@soluongthaydoi=ne.soLuong - ol.soLuong,
	@dongia=ne.dongia,
	@soluongChiTietM=ne.soluong,
	@idgiay =ne.idGiay,
	@idhoadon =ne.idHoaDon, 
	@idChiTietHoaDon=ne.idChiTietHoaDon
from deleted ol ,inserted ne
where ol.idChiTietHoaDon=ne.idChiTietHoaDon
if(@statusne=1 and @statusol=1) --update
	begin
	update CHITIETHOADON
	set thanhTien = thanhTien + @dongia*@soluongthaydoi
	where idChiTietHoaDon=@idChiTietHoaDon

	update HOADON
	set soLuong = soLuong + @soluongthaydoi ,
		thanhTien = thanhTien + @dongia*@soluongthaydoi
	where idHoaDon = @idhoadon

	update GIAY
	set soLuongGiay = soLuongGiay - @soluongthaydoi
	where idGiay=@idgiay
	end
else if(@statusol=1 and @statusne=0) --xoa
	begin
	update CHITIETHOADON
	set thanhTien = 0,
	soLuong = 0,
	donGia = 0
	where idChiTietHoaDon=@idChiTietHoaDon

	update HOADON
	set soLuong = soLuong - @soluongChiTietM ,
		thanhTien = thanhTien - @dongia*@soluongChiTietM
	where idHoaDon = @idhoadon

	update GIAY
	set soLuongGiay = soLuongGiay + @soluongChiTietM
	where idGiay=@idgiay
	end
else if(@statusol=0 and @statusne=1) --Không cho khôi phục
	begin
	update CHITIETHOADON
	set thanhTien = 0,
	soLuong = 0,
	donGia = 0
	where idChiTietHoaDon=@idChiTietHoaDon
	end
else if(@statusol=0 and @statusne=0) --Không cho tác động khi đã xoá
begin
	update CHITIETHOADON
	set thanhTien = 0,
	soLuong = 0,
	donGia = 0
	where idChiTietHoaDon=@idChiTietHoaDon
	end
GO
ALTER TABLE [dbo].[CHITIETHOADON] ENABLE TRIGGER [tr_updateCTHD]
GO
/****** Object:  Trigger [dbo].[tr_insertCTNK]    Script Date: 24/12/2020 09:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_insertCTNK] on [dbo].[CHITIETNHAPKHO]
for insert
as
begin 
	declare @soluong int, 
	@dongia float,
	@idgiay int, 
	@idChiTietPNK int,
	@idNhapKho int

	select @soluong=ne.soLuong,
		@dongia=ne.donGia,
		@idgiay = ne.idGiay,
		@idChiTietPNK=idChiTietPNK,
		@idNhapKho=idNhapKho
	from inserted ne

	update GIAY
	set soLuongGiay = soLuongGiay + @soluong
	where idGiay = @idgiay

	update CHITIETNHAPKHO
	set thanhTien=@soluong*@dongia
	where idChiTietPNK=@idChiTietPNK

	update NHAPKHO
	set soLuong=soluong+@soluong,
		thanhTien = thanhtien+(@soluong*@dongia)
	where idNhapKho=@idNhapKho
end

--Trigger cập nhật/xoá chi tiết nhập kho
GO
ALTER TABLE [dbo].[CHITIETNHAPKHO] ENABLE TRIGGER [tr_insertCTNK]
GO
/****** Object:  Trigger [dbo].[tr_updateCTNK]    Script Date: 24/12/2020 09:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[tr_updateCTNK] on [dbo].[CHITIETNHAPKHO]
for update
as
declare @statusne int, @statusol int,
	@soluongthaydoi int,
	@idgiay int,
	@idNhapKho int,
	@idChiTietPNK int,
	@dongia float,
	@soluongChiTietM int
select  @statusne =ne.status, @statusol =ol.status, 
	@soluongthaydoi=ne.soLuong - ol.soLuong,
	@dongia=ne.dongia,
	@soluongChiTietM=ne.soluong,
	@idgiay =ne.idGiay,
	@idNhapKho =ne.idNhapKho, 
	@idChiTietPNK=ne.idChiTietPNK
from deleted ol ,inserted ne
where ol.idChiTietPNK=ne.idChiTietPNK
if(@statusne=1 and @statusol=1) --update
	begin

	update CHITIETNHAPKHO
	set thanhTien = thanhTien + @dongia*@soluongthaydoi
	where idChiTietPNK=@idChiTietPNK

	update NHAPKHO
	set soLuong = soLuong + @soluongthaydoi ,
		thanhTien = thanhTien + @dongia*@soluongthaydoi
	where idNhapKho = @idNhapKho
	
	update GIAY
	set soLuongGiay = soLuongGiay + @soluongthaydoi
	where idGiay=@idgiay
	end
else if(@statusol=1 and @statusne=0) --xoa
	begin
	update CHITIETNHAPKHO
	set thanhTien = 0,
	soLuong = 0,
	donGia = 0,
	status = 0
	where idChiTietPNK=@idChiTietPNK

	update NHAPKHO
	set soLuong = soLuong - @soluongChiTietM ,
		thanhTien = thanhTien - @dongia*@soluongChiTietM
	where idNhapKho = @idNhapKho

	
	update GIAY
	set soLuongGiay = soLuongGiay - @soluongChiTietM
	where idGiay=@idgiay
	end
else if(@statusol=0 and @statusne=1) --Không cho khôi phục
begin
	update CHITIETNHAPKHO
	set thanhTien = 0,
	soLuong = 0,
	donGia = 0,
	status = 0
	where idChiTietPNK=@idChiTietPNK
end
else if(@statusol=0 and @statusne=0) --Không cho tác động khi đã xoá
begin
	update CHITIETNHAPKHO
	set thanhTien = 0,
	soLuong = 0,
	donGia = 0,
	status = 0
	where idChiTietPNK=@idChiTietPNK
end
GO
ALTER TABLE [dbo].[CHITIETNHAPKHO] ENABLE TRIGGER [tr_updateCTNK]
GO
/****** Object:  Trigger [dbo].[tg_soluongloaigiay]    Script Date: 24/12/2020 09:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tg_soluongloaigiay] ON [dbo].[GIAY]
for insert, update
as
begin
declare @idloaigiay int, @soluonggiay int, @soluongloagiay int

select @idloaigiay = ne.idLoaiGiay
from inserted ne

select @soluonggiay = sum(soLuongGiay)
from GIAY where idLoaiGiay = @idloaigiay
group by idLoaiGiay

update LOAIGIAY
set soLuongLoaiGiay = @soluonggiay
where idLoaiGiay = @idloaigiay
end
GO
ALTER TABLE [dbo].[GIAY] ENABLE TRIGGER [tg_soluongloaigiay]
GO
/****** Object:  Trigger [dbo].[tg_tongtienkhachhang]    Script Date: 24/12/2020 09:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tg_tongtienkhachhang] ON [dbo].[HOADON]
for insert, update
as
begin 
declare @idkhachhang int, @thanhtien int

select @idkhachhang = ne.idKH
from inserted ne

select @thanhtien = sum(thanhTien)
from HOADON where @idkhachhang = idKH
group by idKH

update KHACHHANG
set tongTien = @thanhtien
where idKH = @idkhachhang
end
GO
ALTER TABLE [dbo].[HOADON] ENABLE TRIGGER [tg_tongtienkhachhang]
GO
/****** Object:  Trigger [dbo].[tg_kiemtratenloaigiay]    Script Date: 24/12/2020 09:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_kiemtratenloaigiay] ON [dbo].[LOAIGIAY]
for insert, update
AS
DECLARE @tenLoaiGiay varchar (50)
SET @tenLoaiGiay = (SELECT ne.tenLoaiGiay from inserted ne)
DECLARE @d int
SET @d = (SELECT count(tenLoaiGiay) FROM LOAIGIAY WHERE tenLoaiGiay = @tenLoaiGiay)
if (@d >1)
BEGIN 
print (N' sản phẩm đã tồn tại')
rollback
end
GO
ALTER TABLE [dbo].[LOAIGIAY] ENABLE TRIGGER [tg_kiemtratenloaigiay]
GO
/****** Object:  Trigger [dbo].[tg_kiemtraemail]    Script Date: 24/12/2020 09:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tg_kiemtraemail] ON [dbo].[NHANVIEN]
For insert, update
AS
DECLARE @email varchar (50)
SELECT @email = ne.email
From inserted ne
if (@email not like '%@%')
BEGIN
Print (N'Nhập sai email. 
		Vui lòng nhập lại ')
Rollback
END
GO
ALTER TABLE [dbo].[NHANVIEN] ENABLE TRIGGER [tg_kiemtraemail]
GO
USE [master]
GO
ALTER DATABASE [ShoeStore] SET  READ_WRITE 
GO
