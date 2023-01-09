CREATE DATABASE HOPDONG_BAI4
GO

-- Tạo CSDL HOPDONG
USE HOPDONG_BAI4
GO

-- tạo bảng KHACHHANG
CREATE TABLE dbo.KHACHHANG(
	MaKH char(5) PRIMARY KEY ,
	TenKH char(30) ,
	DiaChi char(50),
	DienThoai int
)
GO


-- tạo bảng HOPDONG
CREATE TABLE dbo.HOPDONG(
	SoHD int PRIMARY KEY,
	NgayHD date,
	MaKH char(5) references KHACHHANG(MaKH) ,
	SoXe char(12) ,
	TriGiaHD int,
	NgayGiaoDK date,
	NgayNgThu date,
	
)
GO

-- tạo bảng THO
CREATE TABLE dbo.THO(
	MaTho char(5) PRIMARY KEY,
	TenTho char(30) ,
	Nhom char(5),
	NhomTruong char(5) 
)
GO

Alter table THO WITH CHECK ADD FOREIGN KEY(NhomTruong) REFERENCES THO(MaTho)
Go

-- tạo bảng CONGVIEC
CREATE TABLE dbo.CONGVIEC(
	MaCV char(5) PRIMARY KEY,
	NoiDungCV char(30)
)
GO

-- tạo bảng CHITIET_HD
CREATE TABLE dbo.CHITIET_HD(
	SoHD int references HOPDONG(SoHD),
	MaCV char(5) references CONGVIEC(MaCV),
	TriGiaCV int,
	MaTho char(5) references THO(MaTho),
	KhoanTho char(20) ,
	Primary key (SoHD, MaCV)
)
GO


-- tạo bảng PHIEUTHU
CREATE TABLE dbo.PHIEUTHU(
	SoPT int,
	NgayLapPT date,
	SoHD int references HOPDONG(SoHD),
	MaKH char(5),
	HoTen char(50),
	SoTienThu int,
	Primary key (SoPT, SoHD, MaKH)
)
GO

-- Nhập dữ liệu vàn bảng KHACHHANG
-- MaKH, TenKH, DiaChi, DienThoai)
Insert into KHACHHANG Values ('KH001', 'Tran Duc Nhan', 'TPHCM_Q1', 123654)
Insert into KHACHHANG Values ('KH002', 'Ly To Nhu', 'TPHCM_Q1', 145234)
Insert into KHACHHANG Values ('KH003', 'Huynh Cam Nhu', 'TPHCM_Q7', 201452)
Insert into KHACHHANG Values ('KH004', 'Nguyen Nhu Y', 'TPHCM_Q9', 206352)
Insert into KHACHHANG Values ('KH005', 'Nguyen Hoang Bach', 'TPHCM_Q9', 206552)
Insert into KHACHHANG Values ('KH006', 'Tran Hoang Nam', 'TPHCM_Q9', 227552)
GO

-- Nhập dữ liệu vào bảng CONGVIEC
-- (MaCV, NoiDungCV)
Insert into CONGVIEC Values ('CV01', 'son xe')
Insert into CONGVIEC Values ('CV02', 'thay banh xe')
Insert into CONGVIEC Values ('CV03', 'thay binh ac quy xe')
Insert into CONGVIEC Values ('CV04', 'rua xe')
Insert into CONGVIEC Values ('CV05', 'son xe + rua xe')
Insert into CONGVIEC Values ('CV06', 'thay nhot xe')

GO



-- Nhập dữ liệu vàn bảng HOPDONG
-- (SoHD, NgayHD, MaKH, SoXe, TriGiaHD, NgayGiaoDK, NgayNgThu)
Insert into HOPDONG Values (001, '2002-12-25', 'KH001', '60-F1 9999',2200000, '2002-12-24', '2002-12-26')
Insert into HOPDONG Values (002, '2002-12-25', 'KH002', '60-FZ 0754',2500000, '2002-12-24', '2002-12-26')
Insert into HOPDONG Values (003, '2002-12-25', 'KH003', '60-B1 2479',4500000, '2002-12-24', '2002-12-26')
Insert into HOPDONG Values (004, '2002-12-26', 'KH004', '60-D8 0229',3000000, '2002-12-25', '2002-12-27')
Insert into HOPDONG Values (005, '2003-01-08', 'KH005', '60-B1 2479',4500000, '2003-01-07', '2003-01-08')
Insert into HOPDONG Values (006, '2003-01-08', 'KH006', '60-D8 0229',3000000, '2003-01-07', '2003-01-08')
GO

-- Nhập dữ liệu vào bảng THO
-- (MaTho, TenTho, Nhom, NhomTruong)
Insert into THO Values ('MT01', 'Phan Tan Phu', 'N1', 'MT01')
Insert into THO Values ('MT02', 'Phan Nhu Ngoc', 'N1', 'MT01')
Insert into THO Values ('MT03', 'Nguyen Tan Tai', 'N2', 'MT03')
Insert into THO Values ('MT04', 'Hoang Thuy Tam', 'N2', 'MT03')
GO


-- Nhập dữ liệu vàn bảng CHITIET_HD
-- (SoHD, MaCV, TriGiaCV, MaTho, KhoanTho)
Insert into CHITIET_HD Values (001, 'CV01', 2200000, 'MT01', 'KT1')
Insert into CHITIET_HD Values (002, 'CV02', 2500000, 'MT02', 'KT2')
Insert into CHITIET_HD Values (003, 'CV03', 4500000, 'MT03', 'KT3')
Insert into CHITIET_HD Values (004, 'CV04', 3000000, 'MT04', 'KT4')
Insert into CHITIET_HD Values (005, 'CV05', 4500000, 'MT01', 'KT3')
Insert into CHITIET_HD Values (006, 'CV06', 3000000, 'MT01', 'KT4')
GO


-- Nhập dữ liệu vàn bảng PHIEUTHU
-- (SoPT, NgayLapPT, SoHD, MaKH , HoTen, SoTienThu)
Insert into PHIEUTHU Values (100, '2002-12-26', 001, 'KH001', 'Nguyen Hoang Nam', 2000000)
Insert into PHIEUTHU Values (101, '2002-12-26', 002, 'KH002', 'Nguyen Ngoc Mai', 2500000)
Insert into PHIEUTHU Values (102, '2002-12-27', 003, 'KH003', 'Tran Lan Anh', 2800000)
Insert into PHIEUTHU Values (103, '2002-12-27', 004, 'KH004', 'Nguyen Nam Anh', 2200000)
Insert into PHIEUTHU Values (104, '2003-01-08', 005, 'KH005', 'Nguyen Phuc Hau', 3200000)
Insert into PHIEUTHU Values (105, '2003-01-08', 006, 'KH006', 'Cao Anh Vo', 3000000)
GO



















