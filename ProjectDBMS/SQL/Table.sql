CREATE DATABASE QLRP
GO

USE QLRP
GO

CREATE TABLE NguoiDung (
	MaND int IDENTITY(1,1) PRIMARY KEY,
	TenND nvarchar(255) not null,
	GioiTinh nvarchar(4) not null,
	NgaySinh date not null,
	SDT varchar(20) unique not null,
	CCCD varchar(20) unique not null,
	Email varchar(255) unique not null,
	TenTaiKhoan nvarchar(255) unique not null,
	MatKhau nvarchar(255) not null,
	Luong decimal not null,
)
go
CREATE TABLE VaiTro (
	MaVaiTro int identity(1,1) PRIMARY KEY,
	TenVaiTro nvarchar(255) unique not null
)
go
CREATE TABLE NguoiDung_VaiTro (
	MaND int,
	MaVaiTro int,
	CONSTRAINT FK_NguoiDung FOREIGN KEY (MaND) REFERENCES NguoiDung(MaND),
	CONSTRAINT FK_NguoiDung_VaiTro FOREIGN KEY (MaVaiTro) REFERENCES VaiTro(MaVaiTro),
	CONSTRAINT PK_NguoiDung_VaiTro PRIMARY KEY (MaND, MaVaiTro)
)
go

CREATE TABLE Phim(
	MaPhim int identity(1,1) PRIMARY KEY,
	ThoiLuong float not null,
	TenPhim nvarchar(255) unique not null,
	LuaTuoi int not null,
	NgayKhoiChieu date not null,
	NgayKetThuc date not null,
	DaoDienChinh nvarchar(255) not null
)

CREATE TABLE TheLoai (
	MaLoai int identity(1,1) PRIMARY KEY,
	TenLoai nvarchar(255) unique not null
)
CREATE TABLE Phim_TheLoai(
	MaPhim int,
	MaLoai int
	CONSTRAINT FK_Phim_TheLoai FOREIGN KEY (MaPhim) REFERENCES Phim(MaPhim),
	CONSTRAINT FK_TheLoai FOREIGN KEY (MaLoai) REFERENCES TheLoai(MaLoai),
	CONSTRAINT PK_Phim_TheLoai PRIMARY KEY (MaPhim, MaLoai)
)

CREATE TABLE DienVien(
	MaDienVien int identity(1,1) PRIMARY KEY,
	TenDienVien nvarchar(255) not null
)
CREATE TABLE Phim_DienVien(
	MaPhim int,
	MaDienVien int
	CONSTRAINT FK_Phim_DienVien FOREIGN KEY (MaPhim) REFERENCES Phim(MaPhim),
	CONSTRAINT FK_DienVien FOREIGN KEY (MaDienVien) REFERENCES DienVien(MaDienVien),
	CONSTRAINT PK_Phim_DienVien PRIMARY KEY (MaPhim, MaDienVien)
)

create table MayChieu(
	MaMay int identity(1,1) constraint pk_maychieu primary key,
	LoaiMay char(255) unique not null,
	Gia decimal not null
)
create table PhongChieu(
	MaPhong int identity(1,1) constraint pk_phongchieu primary key,
	MaMay int not null, constraint fk_phongchieu_maychieu foreign key (MaMay) references MayChieu(MaMay), 
	TenPhong char(255) not null unique, 
	TongSoGhe int not null, 
	SoCot int not null,
	SoHang int not null, 
	TrangThai int not null,
)
create table SuatChieu(
	MaSuatChieu int identity(1,1) constraint pk_suatchieu primary key,
	Gio time not null,
	Ngay date not null,
	TrangThai int not null,
	MaPhim int not null, constraint fk_suatchieu_phim foreign key (MaPhim) references Phim(MaPhim),
	MaPhong int not null, constraint fk_suatchieu_phongchieu foreign key (MaPhong) references PhongChieu(MaPhong),
	constraint unique_suatchieu unique(Gio, Ngay)
)
create table Ghe(
	MaGhe int identity(1,1) constraint pk_ghe primary key,
	GiaGhe decimal not null,
	LoaiGhe char(1) unique not null,
)

create table PhongChieu_Ghe(
	MaPhong int not null, constraint fk_phongchieu_ghe_phongchieu foreign key (MaPhong) references PhongChieu(MaPhong),
	MaGhe int not null, constraint fk_phongchieu_ghe_ghe foreign key (MaGhe) references Ghe(MaGhe), 
	SoLuong int not null,
	constraint pk_phongchieu_ghe primary key (MaPhong, MaGhe)
)

go
create table LoaiKH(
	MaLoaiKH int identity(1,1) constraint pk_loaikh primary key,
	TenLoaiKH nvarchar(255) unique not null,
	GiamGia float not null 
)
go

create table KhachHang(
	MaKH int identity(1,1) constraint pk_khach_hang primary key,
	Ten nvarchar(255) not null,
	GioiTinh nvarchar(4) null,
	NgaySinh date null, 
	DiaChi nvarchar(255) null,
	SoDienThoai varchar(10) null,
	MaLoaiKH int not null,
	Email nvarchar(255) null,
	constraint fk_kh_loaikh foreign key (MaLoaiKH) references LoaiKH(MaLoaiKH)
)
go
create table Ve(
	MaVe int identity(1,1) constraint pk_ve primary key,
	NgayMua datetime null,
	ViTriGhe char(3) not null,
	TrangThai int not null,
	MaSuatChieu int not null, constraint fk_ve_suatchieu foreign key (MaSuatChieu) references SuatChieu(MaSuatChieu), 
	MaKH int null, constraint fk_ve_khachhang foreign key (MaKH) references KhachHang(MaKH), 
	TongGia decimal not null
)

create table DichVu(
	MaDichVu int identity(1,1) constraint pk_dichvu primary key,
	TenDichVu nvarchar(255) unique not null,
	Gia decimal not null
)
go 
create table KhuyenMai(
	MaKM int identity(1,1) constraint pk_khuyenmai primary key,
	TenKM nvarchar(255) unique not null,
	GiaTriKM float not null
)
go
create table KH_DV(
	MaKH int not null,
	MaDV int not null,
	constraint fk_khdv_khachhang foreign key (MaKH) references KhachHang(MaKH),
	constraint fk_khdv_dichvu foreign key (MaDV) references DichVu(MaDichVu),
	constraint pk_khdv primary key (MaKH, MaDV)
)
go
create table HoaDon(
	MaHoaDon int identity(1,1) constraint pk_hoadon primary key,
	TongChiPhi decimal not null,
	NgayXuat date not null,
	GioXuat time not null,
	MaKH int not null,
	MaKM int not null,
	constraint fk_hoadon_khachhang foreign key (MaKH) references KhachHang(MaKH),
	constraint fk_hoadon_khuyenmai foreign key (MaKM) references KhuyenMai(MaKM)
)

