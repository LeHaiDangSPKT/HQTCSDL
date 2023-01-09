--CREATE DATABASE PHANCONGGIAOVIEN_BAI5
--GO

--USE PHANCONGGIAOVIEN_BAI5
--GO

CREATE TABLE dbo.MHOC(
	MAMH char(5) PRIMARY KEY,
	TENMH char(30) NULL,
	SOTIET int NULL
)
GO

CREATE TABLE dbo.GV(
	MAGV char(5) PRIMARY KEY,
	TENGV char(30) NULL,
	MAMH char(5) NULL
)
GO



Insert into GV Values ('GV01', 'PHAN TAN PHU', 'MH01')
Insert into GV Values ('GV02', 'NGUYEN QUYNH ANH', 'MH02')
Insert into GV Values ('GV03', 'NGUYEN NGOC MAI', 'MH03')
Insert into GV Values ('GV04', 'NGUYEN TRUNG KIEN', 'MH04')
Insert into GV Values ('GV05', 'HOANG THUY TAM', 'MH05')
Insert into GV Values ('GV06', 'TRAN HANH', 'MH06')
Insert into GV Values ('GV07', 'NGUYEN SON', 'MH07')
Insert into GV Values ('GV08', 'HOANG TAM', 'MH01')
Insert into GV Values ('GV09', 'HOANG MAI LAN', 'MH02')
Insert into GV Values ('GV10', 'NGUYEN NGOC HOA', 'MH07')
GO

Insert into MHOC Values ('MH01', 'TOAN', 120)
Insert into MHOC Values ('MH02', 'VAN HOC', 120)
Insert into MHOC Values ('MH03', 'SINH HOC', 60)
Insert into MHOC Values ('MH04', 'HOA HOC', 120)
Insert into MHOC Values ('MH05', 'TIENG ANH', 100)
Insert into MHOC Values ('MH06', 'LICH SU', 30)
Insert into MHOC Values ('MH07', 'VAT LY', 120)
GO

Alter table GV WITH CHECK ADD FOREIGN KEY(MAMH) REFERENCES MHOC(MAMH)
GO

CREATE TABLE dbo.PC_COI_THI(
	MAGV char(5) references GV(MAGV),
	HK int,
	NGAY date,
	GIO time,
	PHG char(5),
	Primary key (MAGV, HK, NGAY, GIO)
)
GO

CREATE TABLE dbo.BUOITHI(
	HKY int ,
	NGAY date,
	GIO time,
	PHG char(5),
	MAMH char(5) references MHOC(MAMH),
	TGTHI char(10),
	Primary key (HKY, MAMH)
)
GO


Insert into BUOITHI Values (1, '2020-12-25', '13:00:00', 'A101', 'MH01', '120 phut')
Insert into BUOITHI Values (1, '2020-12-26', '13:30:00', 'A201', 'MH02', '90 phut')
Insert into BUOITHI Values (2, '2020-06-25', '07:00:00', 'A301', 'MH03', '45 phut')
Insert into BUOITHI Values (1, '2020-12-20', '08:00:00', 'A105', 'MH04', '60 phut')
Insert into BUOITHI Values (1, '2020-12-22', '09:00:00', 'A203', 'MH05', '60 phut')
Insert into BUOITHI Values (2, '2020-06-25', '13:50:00', 'A205', 'MH06', '45 phut')
Insert into BUOITHI Values (1, '2020-12-24', '09:00:00', 'A204', 'MH07', '60 phut')
GO

Insert into PC_COI_THI Values ('GV02', 1, '2020-12-25', '13:00:00', 'A101')
Insert into PC_COI_THI Values ('GV01', 1, '2020-12-26', '13:30:00', 'A201')
Insert into PC_COI_THI Values ('GV09', 2, '2020-06-25', '07:00:00', 'A301')
Insert into PC_COI_THI Values ('GV03', 1, '2020-12-20', '08:00:00', 'A105')
Insert into PC_COI_THI Values ('GV05', 1, '2020-12-22', '09:00:00', 'A203')
Insert into PC_COI_THI Values ('GV07', 2, '2020-06-25', '13:50:00', 'A205')
Insert into PC_COI_THI Values ('GV10', 1, '2020-12-24', '09:00:00', 'A204')
GO