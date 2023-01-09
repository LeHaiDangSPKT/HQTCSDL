CREATE DATABASE COQUAN_BAI3
GO

USE COQUAN_BAI3
GO

CREATE TABLE dbo.COQUAN(
	MSCOQUAN int PRIMARY KEY,
	TENCOQUAN char(20) NULL,
	DIACHI char(50) NULL
)
GO


CREATE TABLE dbo.NV(
	MSNV char(6) PRIMARY KEY,
	TEN char(30) NULL,
	MSCOQUAN int,
	CONGVIEC char(20),
	LUONG int
)
GO

Insert into NV Values ('nv01', 'Nguyen Hoang Nam', '15', 'Truong Phong', 6500000)
Insert into NV Values ('nv02', 'Nguyen Ngoc Mai', '20', 'Truong Phong', 6000000)
Insert into NV Values ('nv03', 'Tran Lan Anh', '25', 'Truong Phong', 6400000)
Insert into NV Values ('nv04', 'Nguyen Nam Anh', '50', 'Truong Phong', 7000000)
Insert into NV Values ('nv05', 'Nguyen Phuc Hau', '50', 'Quan Ly', 6500000)
Insert into NV Values ('nv06', 'Cao Anh Vo', '15', 'Quan Ly', 6000000)
Insert into NV Values ('nv07', 'Mai Hoang Van', '20', 'Quan Ly', 5500000)
Insert into NV Values ('nv08', 'Tran Duc Nhan', '25', 'Quan Ly', 5000000)
Insert into NV Values ('nv09', 'Ly To Nhu', '50', 'Nhan vien', 5500000)
Insert into NV Values ('nv010', 'Huynh Cam Nhu', '50', 'Nhan Vien', 5500000)
Insert into NV Values ('nv011', 'Nguyen Nhu Y', '10', 'Truong Phong', 6500000)
Insert into NV Values ('nv012', 'Nguyen Hoang Bach', '40', 'Truong Phong', 6500000)
Insert into NV Values ('nv013', 'Tran Hoang Nam', '25', 'Nhan Vien', 4500000)
Insert into NV Values ('nv014', 'Nguyen Hoang Ngoc', '15', 'Nhan Vien', 4500000)
GO


Insert into COQUAN Values (15, 'COQUAN_01', 'Do Son')
Insert into COQUAN Values (10, 'COQUAN_02', 'Do Son')
Insert into COQUAN Values (20, 'COQUAN_03', 'TPHCM')
Insert into COQUAN Values (25, 'COQUAN_04', 'Quang Ngai')
Insert into COQUAN Values (40, 'COQUAN_05', 'Do Son')
Insert into COQUAN Values (50, 'COQUAN_01', 'Ha Noi')
GO

Alter table NV WITH CHECK ADD FOREIGN KEY(MSCOQUAN) REFERENCES COQUAN(MSCOQUAN)
GO