-- Người thực hiện: Trần Thị Lệ Xuân   Mã SV: 18133066
-- Em cam đoạn tất cả dưới đây đều do em viết code và đều đã chạy ra kết quả

CREATE DATABASE BAI6_NHANVIEN
GO

USE BAI6_NHANVIEN
GO

--Tạo bảng PHONGBAN

CREATE TABLE dbo.PHONGBAN(
	MAPHG varchar(2) PRIMARY KEY,
	TENPHG nvarchar(20) NULL,
	TRPHG varchar(9) NULL,
	NGAYNHANCHUC smalldatetime NULL
)
GO

-- Tạo cấu trúc bảng Nhân viên
CREATE TABLE dbo.NHANVIEN(
	MANV varchar(9) PRIMARY KEY,
	HONV nvarchar(15) NULL,
	TENLOT nvarchar(30) NULL,
	TENNV nvarchar(30) NULL,
	NGSINH smalldatetime NULL,
	DCHI nvarchar(150) NULL,
	PHAI nvarchar(3) NULL,
	LUONG numeric(18,0) NULL,
	MANQL varchar(9) NULL,
	PHG varchar(2) NULL 
)
GO
-- Nhập giá trị vào bảng Nhân viên
-- (Manv,HoNV,Tenlot,TenNV,NgSinh,Dchi,Phai,Luong,MaNQL,Phong)
Insert into NHANVIEN Values ('nv01', 'Nguyen', 'Ngoc', 'Hoang', '1972-08-13', '111 Vo Van Ngan', 'Nam', 30000, 'nv02', 1)
Insert into NHANVIEN Values ('nv02', 'Nguyen', 'Quang', 'Ngoc', '1975-08-23', '111 Nguyen Van Troi', 'Nam', 25000, 'nv15', 1)
Insert into NHANVIEN Values ('nv03', 'Le', 'Thi', 'Ngoc', '1980-08-13', '111 Duong 3/2', 'Nu', 28000, 'nv15', 2)
Insert into NHANVIEN Values ('nv04', 'Le', 'Ngoc', 'Hoang', '1982-08-18', '111 Le Van Duyet', 'Nam', 15000, 'nv03', 2)
Insert into NHANVIEN Values ('nv05', 'Nguyen', 'Thi', 'Ngoc', '1992-08-13', '108 Vo Van Ngan', 'Nu', 28000, 'nv06', 3)
Insert into NHANVIEN Values ('nv06', 'Truong', 'Anh', 'Kiet', '1960-12-13', '11 Hai Ba Trung', 'Nam', 30000, 'nv15', 3)
Insert into NHANVIEN Values ('nv07', 'Le', 'Phung', 'Hieu', '1972-08-13', '11 Hau Giang', 'Nam', 10000, 'nv15', 4)
Insert into NHANVIEN Values ('nv08', 'Nguyen', 'Bao', 'Hung', '1978-08-23', '10 Tran Hung Dao', 'Nam', 20000, 'nv15', 5)
Insert into NHANVIEN Values ('nv09', 'Nguyen', 'Bao', 'Hoang', '1972-08-13', '111 Tran Hung Dao', 'Nam', 10000, 'nv15', 6)
Insert into NHANVIEN Values ('nv10', 'Le', 'Hoang', 'Ngoc', '1972-08-13', '11 Lac Long Quan', 'Nam', 10000, 'nv15', 7)
Insert into NHANVIEN Values ('nv11', 'Nguyen', 'Bao','Ngoc', '1972-08-13', '111 Minh Phung', 'Nu', 15000, 'nv15', 8)
Insert into NHANVIEN Values ('nv12', 'Nguyen', 'Ngoc', 'A', '1982-08-13', '11 Nguyen Duy Trinh', 'Nam', 10000, 'nv11', 8)
Insert into NHANVIEN Values ('nv13', 'Le', 'Quang', 'Hoang', '1979-08-23', '10 Ly Chinh Thang', 'Nam', 15000, 'nv15', 9)
Insert into NHANVIEN Values ('nv14', 'Nguyen', 'Quang', 'Hoang', '1972-08-13', '11 Le Van Thinh', 'Nam', 10000, 'nv13', 9)
Insert into NHANVIEN Values ('nv15', 'Dang', 'Tan', 'Dung', '1960-08-13', '23 Vo Van Ngan', 'Nam', 50000, NULL, 10)
GO
-- Nhập giá trị vào bảng PhongBan
-- Kiểu dữ liệu Data nhập theo dạng: 'YYYY-MM-DD' (Year-Month-Day)
-- Chú ý nhập giá trị cột TrPhong là các giá trị có trong cột Manv của bảng Nhân viên
-- (MaPB,TenPB,TrPhong,NgNhanChuc)
Insert into PHONGBAN Values ('1', 'Nghien cuu', 'nv02', '2013-12-12');
Insert into PHONGBAN Values ('2', 'To chuc', 'nv03', '2013-11-21');
Insert into PHONGBAN Values ('3', 'Vat tu', 'nv06', '2013-1-25');
Insert into PHONGBAN Values ('4', 'Dao tao', 'nv15', '2013-2-19');
Insert into PHONGBAN Values ('5', 'Kinh doanh', 'nv15', '2013-08-18');
Insert into PHONGBAN Values ('6', 'Doi ngoai', 'nv15', '2013-10-17');
Insert into PHONGBAN Values ('7', 'Xay dung', 'nv15', '2013-02-20');
Insert into PHONGBAN Values ('8', 'QL Du an', 'nv11', '2013-12-12');
Insert into PHONGBAN Values ('9', 'Ke toan', 'nv13', '2013-12-12');
Insert into PHONGBAN Values ('10', 'BGD', 'nv15', '2010-11-29');
GO
-- Thêm hai khóa ngoại cho bảng NhanVien
Alter table NHANVIEN WITH CHECK ADD FOREIGN KEY(MANQL) REFERENCES NHANVIEN(MANV)
Go
ALTER TABLE NHANVIEN  WITH CHECK ADD FOREIGN KEY(PHG) REFERENCES PHONGBAN(MAPHG)
GO
-- Thêm khoa ngoại cho bảng PHONGBAN
Alter table PHONGBAN WITH CHECK ADD FOREIGN KEY(TRPHG) REFERENCES NHANVIEN(MANV)
GO
-- Tạo cấu trúc bảng Địa điểm - Phòng
-- Cột MaPB tham chiếu đến MaPB trong bảng PhongBan nên phải có kiểu dữ liệu giống kiểu dữ liệu của cột MaPB trong bảng PhongBan
Create table DIADIEM_PHONG(
		MAPHG varchar(2) references PHONGBAN(MAPHG),
		DiaDiem varchar(20),
		Primary key (MAPHG, DiaDiem) -- khai báo khóa chính gồm 2 cột
		)
Go
-- Nhập dữ liệu cho bảng DIADIEM_PHONG
Insert into DIADIEM_PHONG Values('1', 'Tang tret - Khu A')
Insert into DIADIEM_PHONG Values('2', 'Tang 1 - Khu A')
Insert into DIADIEM_PHONG Values('3', 'Tang tret - Khu B')
Insert into DIADIEM_PHONG Values('4', 'Tang tret - Khu C')
Insert into DIADIEM_PHONG Values('5', 'Tang tret - Khu E')
Insert into DIADIEM_PHONG Values('6', 'Tang tret - Khu E')
Insert into DIADIEM_PHONG Values('7', 'Tang tret - Khu G')
Insert into DIADIEM_PHONG Values('8', 'Tang 1 - Khu H')
Insert into DIADIEM_PHONG Values('9', 'Tang 2 - Khu G')
Insert into DIADIEM_PHONG Values('10', 'Tang 3 - Khu A')
Go
-- Tạo cấu trúc bảng Dự án
-- Cột Phong là khóa ngoại tham chiếu đến cột MaPB bên bảng PhongBan
Create Table DEAN(
	MADA varchar(2) primary key,
	TENDA nvarchar(50),
	DiaDiem char(20),
	PHONG varchar(2) references PHONGBAN(MAPHG)
	)
GO

Create table PHANCONG(
	MANV varchar(9) references NHANVIEN(MANV),
	SODA varchar(2) references DEAN(MADA),
	ThoiGian numeric(18,0),
	Primary key (MANV, SODA)
	)
Go


-- Nhập dữ liệu cho bảng DEAN
Insert into DEAN Values ('D1', 'Cap thoat nuoc', 'Go Vap', '9')
Insert into DEAN Values ('D2', 'Ban chung cu', 'Thu Thiem', '5')
Insert into DEAN Values ('D3', 'Xay biet thu', 'Thu Duc', '7')
Insert into DEAN Values ('D4', 'Lien ket dao tao', 'Go Vap', '4')
Insert into DEAN Values ('D5', 'Cung cap vat tu', 'Quan 2', '3')
Insert into DEAN Values ('D6', 'Huan luyen', 'Go Vap', '4')
Go
-- Tạo cấu trúc bảng PHANCONG
-- Cột MaNV tham chiếu đến cột MaNV trong bảng NhanVien nên chúng phải có cùng kiểu dữ liệu
-- Cột MaDA tham chiếu đến cột MaDA trong bảng DUAN nên chúng phải có cùng kiểu dữ liệu

-- Nhập dữ liệu
-- Giá trị trong cột MaNV phải có ở cột MaNV trong bảng NhanVien
-- Giá trị trong cột MaDA phải có ở cột MaDA trong bảng DuAN
Insert into PHANCONG Values ('nv01', 'D1', 3)
Insert into PHANCONG Values ('nv01', 'D2', 3)
Insert into PHANCONG Values ('nv02', 'D1', 3)
Insert into PHANCONG Values ('nv02', 'D3', 3)
Insert into PHANCONG Values ('nv03', 'D4', 3)
Insert into PHANCONG Values ('nv04', 'D3', 3)
Insert into PHANCONG Values ('nv09', 'D4', 3)
Insert into PHANCONG Values ('nv01', 'D5', 3)
Insert into PHANCONG Values ('nv05', 'D5', 3)
Insert into PHANCONG Values ('nv07', 'D6', 3)
Insert into PHANCONG Values ('nv08', 'D6', 3)
Go
-- Tạo cấu trúc bảng ThanNhan
-- Cột MaNV tham chiếu đến cột MaNV bên bảng NhanVien nên chúng phải có cùng kiểu dữ liệu
Create table THANNHAN(
		MaNV_NVIEN varchar(9) references NHANVIEN(MANV),
		TenTN varchar(20),
		Phai varchar(3),
		NgaySinh smalldatetime,
		QuanHe varchar(15),
		Primary key (MaNV_NVIEN, TenTN)
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
