CREATE DATABASE QLNV_BAI1
GO

USE QLNV_BAI1
GO

--Tạo bảng PHONGBAN

CREATE TABLE dbo.PHONGBAN(
	MaPB int PRIMARY KEY,
	TenPB char(10) NULL,
	TrPhong char(4) NULL,
	NgNhanChuc date Null
)
GO

-- Tạo cấu trúc bảng Nhân viên
CREATE TABLE dbo.NHANVIEN(
	Manv char(4) PRIMARY KEY,
	HoNV char(10) NULL,
	Tenlot char(20) NULL,
	TenNV char(10) NULL,
	NgSinh date NULL,
	Dchi char(50) NULL,
	Phai char(3) NULL,
	Luong int NULL,
	MaNQL char(4) NULL,
	Phong int 
)
GO
-- Nhập giá trị vào bảng Nhân viên, nhập theo đúng thứ tự các thuộc tính trong bảng
-- (Manv,HoNV,Tenlot,TenNV,NgSinh,Dchi,Phai,Luong,MaNQL,Phong)
Insert into NHANVIEN Values ('nv01', 'Nguyen', 'Ngoc', 'Hoang', '1972-08-13', '111 Vo Van Ngan', 'Nam', 30000, 'NV02', 1)
Insert into NHANVIEN Values ('nv02', 'Nguyen', 'Quang', 'Ngoc', '1975-08-23', '111 Nguyen Van Troi', 'Nam', 25000, 'NV15', 1)
Insert into NHANVIEN Values ('nv03', 'Le', 'Thi', 'Ngoc', '1980-08-13', '111 Duong 3/2', 'Nu', 28000, 'NV15', 2)
Insert into NHANVIEN Values ('nv04', 'Le', 'Ngoc', 'Hoang', '1982-08-18', '111 Le Van Duyet', 'Nam', 15000, 'NV03', 2)
Insert into NHANVIEN Values ('nv05', 'Nguyen', 'Thi', 'Ngoc', '1992-08-13', '108 Vo Van Ngan', 'Nu', 28000, 'NV06', 3)
Insert into NHANVIEN Values ('nv06', 'Truong', 'Anh', 'Kiet', '1960-12-13', '11 Hai Ba Trung', 'Nam', 30000, 'NV15', 3)
Insert into NHANVIEN Values ('nv07', 'Le', 'Phung', 'Hieu', '1972-08-13', '11 Hau Giang', 'Nam', 10000, 'NV15', 4)
Insert into NHANVIEN Values ('nv08', 'Nguyen', 'Bao', 'Hung', '1978-08-23', '10 Tran Hung Dao', 'Nam', 20000, 'NV15', 5)
Insert into NHANVIEN Values ('nv09', 'Nguyen', 'Bao', 'Hoang', '1972-08-13', '111 Tran Hung Dao', 'Nam', 10000, 'NV15', 6)
Insert into NHANVIEN Values ('nv10', 'Le', 'Hoang', 'Ngoc', '1972-08-13', '11 Lac Long Quan', 'Nam', 10000, 'NV15', 7)
Insert into NHANVIEN Values ('nv11', 'Nguyen', 'Bao','Ngọc', '1972-08-13', '111 Minh Phung', 'Nu', 15000, 'NV15', 8)
Insert into NHANVIEN Values ('nv12', 'Nguyen', 'Ngoc', 'A', '1982-08-13', '11 Nguyen Duy Trinh', 'Nam', 10000, 'NV11', 8)
Insert into NHANVIEN Values ('nv13', 'Le', 'Quang', 'Hoang', '1979-08-23', '10 Ly Chinh Thang', 'Nam', 15000, 'NV15', 9)
Insert into NHANVIEN Values ('nv14', 'Nguyen', 'Quang', 'Hoang', '1972-08-13', '11 Le Van Thinh', 'Nam', 10000, 'NV13', 9)
Insert into NHANVIEN Values ('nv15', 'Dang', 'Tan', 'Dung', '1960-08-13', '23 Vo Van Ngan', 'Nam', 50000, NULL, 10)
GO
-- Nhập giá trị vào bảng PhongBan, nhập theo đúng thứ tự các thuộc tính trong bảng
-- Kiểu dữ liệu Data nhập theo dạng: 'YYYY-MM-DD' (Year-Month-Day)
-- Chú ý nhập giá trị cột TrPhong là các giá trị có trong cột Manv của bảng Nhân viên
-- (MaPB,TenPB,TrPhong,NgNhanChuc)
Insert into PHONGBAN Values (1, 'Nghien cuu', 'nv02', '2013-12-12');
Insert into PHONGBAN Values (2, 'To chuc', 'nv03', '2013-11-21');
Insert into PHONGBAN Values (3, 'Vat tu', 'nv06', '2013-1-25');
Insert into PHONGBAN Values (4, 'Dao tao', 'nv15', '2013-2-19');
Insert into PHONGBAN Values (5, 'Kinh doanh', 'nv15', '2013-08-18');
Insert into PHONGBAN Values (6, 'Doi ngoai', 'nv15', '2013-10-17');
Insert into PHONGBAN Values (7, 'Xay dung', 'nv15', '2013-02-20');
Insert into PHONGBAN Values (8, 'QL Du an', 'nv11', '2013-12-12');
Insert into PHONGBAN Values (9, 'Ke toan', 'nv13', '2013-12-12');
Insert into PHONGBAN Values (10, 'BGD', 'nv15', '2010-11-29');
GO
-- Thêm hai khóa ngoại cho bảng NhanVien
Alter table NHANVIEN WITH CHECK ADD FOREIGN KEY(MaNQL) REFERENCES NHANVIEN(Manv)
Go
ALTER TABLE NHANVIEN  WITH CHECK ADD FOREIGN KEY(Phong) REFERENCES PHONGBAN(MaPB)
GO
-- Thêm khoa ngoại cho bảng PHONGBAN
Alter table PHONGBAN WITH CHECK ADD FOREIGN KEY(TrPhong) REFERENCES NHANVIEN(Manv)
GO
-- Tạo cấu trúc bảng Địa điểm - Phòng
-- Cột MaPB tham chiếu đến MaPB trong bảng PhongBan nên phải có kiểu dữ liệu giống kiểu dữ liệu của cột MaPB trong bảng PhongBan
Create table DIADIEM_PHONG(
		MaPB int references PHONGBAN(MaPB),
		DiaDiem char(30),
		Primary key (MaPB, DiaDiem) -- khai báo khóa chính gồm 2 cột
		)
Go
-- Nhập dữ liệu cho bảng DIADIEM_PHONG
Insert into DIADIEM_PHONG Values(1, 'Tang tret - Khu A')
Insert into DIADIEM_PHONG Values(2, 'Tang 1 - Khu A')
Insert into DIADIEM_PHONG Values(3, 'Tang tret - Khu B')
Insert into DIADIEM_PHONG Values(4, 'Tang tret - Khu C')
Insert into DIADIEM_PHONG Values(5, 'Tang tret - Khu E')
Insert into DIADIEM_PHONG Values(6, 'Tang tret - Khu Bat Giac')
Insert into DIADIEM_PHONG Values(7, 'Tang tret - Khu Trung Tam')
Insert into DIADIEM_PHONG Values(8, 'Tang 1 - Khu Trung Tam')
Insert into DIADIEM_PHONG Values(9, 'Tang 2 - Khu Trung Tam')
Insert into DIADIEM_PHONG Values(10, 'Tang 3 - Khu Trung Tam')
Go
-- Tạo cấu trúc bảng Dự án
-- Cột Phong là khóa ngoại tham chiếu đến cột MaPB bên bảng PhongBan
Create Table DUAN(
	MaDA char(4) primary key,
	TenDA Char(30),
	DiaDiem char(30),
	Phong int references PHONGBAN(MaPB)
	)
GO
-- Nhập dữ liệu cho bảng DUAN
Insert into DUAN Values ('DA01', 'Cap thoat nuoc', 'Go Vap', 9)
Insert into DUAN Values ('DA02', 'Ban chung cu', 'Thu Thiem', 5)
Insert into DUAN Values ('DA03', 'Xay biet thu', 'Thu Duc', 7)
Insert into DUAN Values ('DA04', 'Lien ket dao tao', 'Go Vap', 4)
Insert into DUAN Values ('DA05', 'Cung cap vat tu', 'Quan 2', 3)
Insert into DUAN Values ('DA06', 'Huan luyen', 'Go Vap', 4)
Go
-- Tạo cấu trúc bảng PHANCONG
-- Cột MaNV tham chiếu đến cột MaNV trong bảng NhanVien nên chúng phải có cùng kiểu dữ liệu
-- Cột MaDA tham chiếu đến cột MaDA trong bảng DUAN nên chúng phải có cùng kiểu dữ liệu
Create table PHANCONG(
	MaNV char(4) references NHANVIEN(maNV),
	MaDA char(4) references DUAN(MaDA),
	ThoiGian int,
	Primary key (MaNV, MaDA)
	)
Go
-- Nhập dữ liệu
-- Giá trị trong cột MaNV phải có ở cột MaNV trong bảng NhanVien
-- Giá trị trong cột MaDA phải có ở cột MaDA trong bảng DuAN
Insert into PHANCONG Values ('nv01', 'DA01', 3)
Insert into PHANCONG Values ('nv01', 'DA02', 3)
Insert into PHANCONG Values ('nv02', 'DA01', 3)
Insert into PHANCONG Values ('nv02', 'DA03', 3)
Insert into PHANCONG Values ('nv03', 'DA04', 3)
Insert into PHANCONG Values ('nv04', 'DA03', 3)
Insert into PHANCONG Values ('nv09', 'DA04', 3)
Insert into PHANCONG Values ('nv01', 'DA05', 3)
Insert into PHANCONG Values ('nv05', 'DA05', 3)
Insert into PHANCONG Values ('nv07', 'DA06', 3)
Insert into PHANCONG Values ('nv08', 'DA06', 3)
Go
-- Tạo cấu trúc bảng ThanNhan
-- Cột MaNV tham chiếu đến cột MaNV bên bảng NhanVien nên chúng phải có cùng kiểu dữ liệu
Create table THANNHAN(
		MaNV char(4) references NhanVien(maNV),
		TenTN char(20),
		Phai char(3),
		NgaySinh date,
		QuanHe char(10),
		Primary key (MaNV, TenTN)
		)
Go
--Nhập dữ liệu
-- Giá trị trong cột MaNV phải có ở cột MaNV trong bảng NhanVien
Insert into THANNHAN Values ('nv01', 'Nguyen Ngoc Huy', 'Nam', '2018-3-26','con')
Insert into THANNHAN Values ('nv01', 'Nguyen Ngoc Hoa', 'Nu', '2020-3-26','con')
Insert into THANNHAN Values ('nv02', 'Nguyen Ngoc Huy', 'Nam', '2018-3-26','con')
Insert into THANNHAN Values ('nv02', 'Nguyen Ngoc Hoa', 'Nu', '2020-3-26','con')
Insert into THANNHAN Values ('nv15', 'Dang Ngoc Hoa', 'Nu', '2020-3-26','con')
Insert into THANNHAN Values ('nv01', 'Nguyen Nguyen Hung', 'Nam', '2020-3-26','con')
GO
