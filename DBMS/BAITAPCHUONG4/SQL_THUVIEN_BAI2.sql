CREATE DATABASE THUVIEN_BAI2
GO

USE THUVIEN_BAI2
GO


CREATE TABLE dbo.NXB(
	MaNXB char(5) PRIMARY KEY,
	TenNXB char(50) NULL,
	DiaChi char(50) NULL,
	SDT int
)
GO


CREATE TABLE dbo.DAUSACH(
	MaSach int PRIMARY KEY,
	Tua char(50) NULL,
	MaNXB char(5) NULL
)
GO


Insert into DAUSACH Values (1, 'The Art of Computer Programming', 'AW')
Insert into DAUSACH Values (2, 'Ong Gia Va Bien Ca', 'VHVN')
Insert into DAUSACH Values (3, 'Chi Pheo', 'VHVN')
Insert into DAUSACH Values (4, 'Mechanics', 'AW')
Insert into DAUSACH Values (5, 'Thong Ke Ung Dung', 'DHQG')
Insert into DAUSACH Values (6, 'Co So Toan Hoc', 'DHQG')
Insert into DAUSACH Values (7, 'Gia Tu Vu Khi', 'VHVN')
Insert into DAUSACH Values (8, 'Lao Hac', 'VHVN')
Insert into DAUSACH Values (9, 'The C++ Programming Language', 'AW')
Insert into DAUSACH Values (10, 'Co Gai Den Tu Hom Qua', 'NXBT')
Insert into DAUSACH Values (11, 'Ao Trang', 'HD')
Insert into DAUSACH Values (12, 'Harry Potter ', 'NXBT')
Insert into DAUSACH Values (13, 'Gintama', 'KD')
Insert into DAUSACH Values (14, 'Cho Toi Xin Mot Ve Di Tuoi Tho', 'VHVN')
Insert into DAUSACH Values (15, 'Toi La BeTo', 'VHVN')
Insert into DAUSACH Values (16, 'Tham Tu Lung Doanh Conan', 'KD')
GO


Insert into NXB Values ('AW', 'Addison Wesley', 'Boston_UK', 123456)
Insert into NXB Values ('VHVN', 'Van Hoc Viet Nam', 'HaNoi_VN', 456245)
Insert into NXB Values ('DHQG', 'Dai Hoc Quoc Gia TPHCM', 'TPHCM_VN', 756241)
Insert into NXB Values ('NXBT', 'NXB Tre', 'TPHCM_VN', 756241)
Insert into NXB Values ('HD', 'Hong Duc', 'HaNoi_VN', 154785)
Insert into NXB Values ('KD', 'Kim Dong', 'TPHCM_VN', 456325)
GO


Alter table DAUSACH WITH CHECK ADD FOREIGN KEY(MaNXB) REFERENCES NXB(MaNXB)
GO


CREATE TABLE dbo.TACGIA(
	MaSach int references DAUSACH(MaSach),
	TenTacGia char(30),
	Primary key (MaSach, TenTacGia)
)
GO


Insert into TACGIA Values (1, 'Donald Knuth')
Insert into TACGIA Values (2, 'Hemingway')
Insert into TACGIA Values (3, 'Nam Cao')
Insert into TACGIA Values (4, 'C J Petersen')
Insert into TACGIA Values (5, 'Pham Van Chung')
Insert into TACGIA Values (6, 'Nguyen Gia Dinh')
Insert into TACGIA Values (7, 'Hemingway')
Insert into TACGIA Values (8, 'Nam Cao')
Insert into TACGIA Values (9, 'Stroustrup')
Insert into TACGIA Values (10, 'Nguyen Nhat Anh')
Insert into TACGIA Values (11, 'Nguyen Van Bong')
Insert into TACGIA Values (12, 'J.K.Rowling')
Insert into TACGIA Values (13, 'Hideaki Sorachi')
Insert into TACGIA Values (14, 'Nguyen Nhat Anh')
Insert into TACGIA Values (15, 'Nguyen Nhat Anh')
Insert into TACGIA Values (16, 'Aoyama Gosho')
GO


CREATE TABLE dbo.CUONSACH(
	MaCuon char(4) PRIMARY KEY,
	ViTri char(10),
	MaSach int references DAUSACH(MaSach)
)
GO


Insert into CUONSACH Values ('1A', '1A1', 1)
Insert into CUONSACH Values ('2A', '1B2', 2)
Insert into CUONSACH Values ('3A', '1C3', 3)
Insert into CUONSACH Values ('4A', '2A4',4)
Insert into CUONSACH Values ('5A', '2B2', 5)
Insert into CUONSACH Values ('6A', '2C5', 6)
Insert into CUONSACH Values ('7A', '3A3', 7)
Insert into CUONSACH Values ('8A', '3B7', 8)
Insert into CUONSACH Values ('9A', '3C8', 9)
Insert into CUONSACH Values ('10A', '4A2', 10)
Insert into CUONSACH Values ('11A', '4B4', 11)
Insert into CUONSACH Values ('12A', '4C7', 12)
Insert into CUONSACH Values ('13A', '5A3', 13)
Insert into CUONSACH Values ('14A', '5A7', 14)
Insert into CUONSACH Values ('15A', '5B8', 15)
Insert into CUONSACH Values ('16A', '5C9', 16)
GO


CREATE TABLE dbo.DOCGIA(
	MaDG char(4) PRIMARY KEY,
	TenDG char(30),
	DiaChi char(50),
	SDT int
)
GO


CREATE TABLE dbo.MUON(
	MaCuon char(4) references CUONSACH(MaCuon),
	MaDG char(4) references DOCGIA(MaDG),
	NgayMuon date,
	NgayTra date 
	Primary key (MaCuon, MaDG)
)
GO

Insert into DOCGIA Values ('DG01', 'Mai Hoang Anh', 'Bien Hoa', 112356)
Insert into DOCGIA Values ('DG02', 'Nguyen Van A', 'Q7-HCM', 222456)
Insert into DOCGIA Values ('DG03', 'Tran Hoang Bao', 'Q9-HCM', 665412)
Insert into DOCGIA Values ('DG04', 'To Ngoc An', 'Q9-HCM', 335475)
Insert into DOCGIA Values ('DG05', 'Nguyen Ngoc Anh', 'Bien Hoa', 554123)
GO


Insert into MUON Values ('1A', 'DG01', '2020-3-21', '2020-6-21')
Insert into MUON Values ('4A', 'DG02', '2020-3-15', '2020-6-15')
Insert into MUON Values ('6A', 'DG03', '2020-3-19', '2020-6-19')
Insert into MUON Values ('8A', 'DG04', '2020-3-24', '2020-6-24')
Insert into MUON Values ('9A', 'DG05', '2020-3-29', '2020-6-29')
Insert into MUON Values ('2A', 'DG01', '2020-2-15', '2020-5-15')
Insert into MUON Values ('13A', 'DG02', '2020-2-21', '2020-5-21')
Insert into MUON Values ('15A', 'DG03', '2020-3-20', '2020-6-20')
Insert into MUON Values ('16A', 'DG01', '2020-3-22', '2020-6-22')
Insert into MUON Values ('14A', 'DG01', '2020-3-22', '2020-6-22')
Insert into MUON Values ('10A', 'DG01', '2020-3-22', '2020-6-22')
Insert into MUON Values ('11A', 'DG01', '2020-3-23', '2020-6-23')
Insert into MUON Values ('12A', 'DG01', '2020-3-23', '2020-6-23')
GO
