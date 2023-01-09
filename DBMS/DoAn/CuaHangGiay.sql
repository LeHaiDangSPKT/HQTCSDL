create database PhanMemBanGiay
go 

use PhanMemBanGiay
go

create table dbo.HANGGIAY
(
	idHangGiay int primary key,
	tenHangGiay nvarchar(150) not null,
	status int not null,
)
GO

create table dbo.LOAIGIAY
(
	idLoaiGiay int primary key,
	maLoaiGiay varchar(50) not null,
	tenLoaiGiay nvarchar(150) not null,
	idHangGiay int foreign key references dbo.HANGGIAY(idHangGiay),
	khuyenMai int not null, /* thiet lap tu 0 -> 100 */
	status int not null,
)
GO

create table dbo.GIAY
(
	idGiay int primary key,
	maGiay varchar(50) not null,
	tenGiay nvarchar(150) not null,
	idLoaiGiay int foreign key references dbo.LOAIGIAY(idLoaiGiay),
	mauSac nvarchar(20) not null,
	size int not null, /* thiet lap tu 34 -> 45 */
	soLuong int not null,
	giaBan float not null,
	khuyenMai int not null, /* thiet lap tu 0 -> 100 */
	tienKhuyenMai float not null, 
	tienSauKhuyenMai float not null, /* thiet lap trigger de tinh ra tien sau KM */
	status int not null,
)
GO

create table dbo.NHACUNGCAP
(
	idNCC int primary key,
	tenNCC nvarchar(150) not null,
	sdt varchar(20) not null,
	email varchar(150) not null,
	diaChi nvarchar(250) not null,
	status int not null,
)
GO

create table dbo.NHANVIEN
(
	idNV int primary key,
	tenNV nvarchar(150) not null,
	username varchar(50) not null,
	password varchar(500) not null,
	sdt varchar(20) not null,
	email varchar(150) not null,
	phanQuyen int not null,
	status int not null,
)
GO


create table dbo.NHAPKHO
(
	idNhapKho int primary key,
	idNV int foreign key references dbo.NHANVIEN (idNV),
	idNCC int foreign key references dbo.NHACUNGCAP(idNCC),
	ngayNhapKho date not null,
	tongSoLuong int not null,
	thanhTien float not null,
	status int not null,
)
GO

create table dbo.CHITIETPHIEUNHAPKHO
(
	idChiTietPNK int primary key,
	idNhapKho int foreign key references dbo.NHAPKHO (idNhapKho),
	idGiay int foreign key references dbo.GIAY (idGiay),
	soLuong int not null,
	donGiaGoc float not null,
	thanhTien float not null, /*  xu ly tinh toan thanh tien trong C#*/
	status int not null,
)
GO

create table dbo.KHACHHANG
(
	idKH int primary key,
	tenKH nvarchar(150) not null,
	sdt varchar(20) not null,
	diemThuong float not null,
	status int not null,
)
GO

create table dbo.HOADON
(
	idHoaDon int primary key,
	idNV int foreign key references dbo.NHANVIEN (idNV),
	idKH int foreign key references dbo.KHACHHANG (idKH),
	tongGiaBan float not null,
	diemThuong float not null,
	tongTienKM float not null,
	tongTienGiamGia float not null,
	thanhTien float not null,
	status int not null,
)
GO

create table dbo.CHITIETHOADON
(
	idChiTietHoaDon int primary key,
	idHoaDon int foreign key references dbo.HOADON(idHoaDon),
	idGiay int foreign key references dbo.GIAY (idGiay),
	soLuong int not null,
	giaBan float not null,
	khuyenMai int not null,
	tienKhuyenMai float not null,
	giaSauKhuyenMai float not null,
	status int not null,
)
GO;.
