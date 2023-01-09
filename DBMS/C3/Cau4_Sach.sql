create database Cau4_SACH
go

use Cau4_SACH
go

create table DocGia(
	ma_DocGia int primary key,
	ho nvarchar(30),
	tenlot nvarchar(30),
	ten nvarchar(30),
	ngaysinh date
);
go
create table Nguoilon(
	ma_DocGia int primary key,
	sonha int,
	duong nvarchar(30),
	quan nvarchar(30),
	dienthoai int,
	han_sd date,
	Foreign key (ma_DocGia) references DocGia(ma_DocGia)
);
go
create table Treem(
	ma_DocGia int primary key,
	ma_DocGia_nguoilon int,
	Foreign key (ma_DocGia) references DocGia(ma_DocGia),
	Foreign key (ma_DocGia_nguoilon) references Nguoilon(ma_DocGia)
);
go

create table Tuasach(
ma_tuasach int primary key,
tuasach nvarchar(30),
tacgia nvarchar(30),
tomtat nvarchar(30),
);
go

create table Dausach(
isbn int primary key,
ma_tuasach int,
ngonngu nvarchar(30),
bia nvarchar(30),
trangthai nvarchar(30),
Foreign key (ma_tuasach) references Tuasach(ma_tuasach),
);
go

create table Cuonsach(
ma_cuonsach int primary key,
isbn int ,
tinhtrang nvarchar(5),
Foreign key (isbn) references Dausach(isbn),
);
go

create table DangKy(
	isbn int,
	ma_DocGia int,
	ngay_dk date,
	ghichu nvarchar(30)
	primary key(isbn,ma_DocGia),
	Foreign key (isbn) references Dausach(isbn),
	Foreign key (ma_DocGia) references DocGia(ma_DocGia)
);
go

create table Muon(
	isbn int,
	ma_cuonsach int,
	ma_DocGia int,
	ngay_muon date,
	ngay_hethan date,
	primary key(isbn,ma_cuonsach,ma_DocGia),
	Foreign key (ma_DocGia) references DocGia(ma_DocGia),
	Foreign key (ma_cuonsach) references Cuonsach(ma_cuonsach),
	Foreign key (isbn) references Dausach(isbn)
);
go

create table QuaTrinhMuon(
	isbn int,
	ma_cuonsach int,
	ngay_muon date,
	ma_DocGia int,
	ngay_hethan date,
	ngay_tra date,
	tien_muon int,
	tien_datra int,
	tien_datcoc int,
	ghichu nvarchar(30),
	primary key(isbn,ma_cuonsach,ma_DocGia),
	Foreign key (ma_DocGia) references DocGia(ma_DocGia),
	Foreign key (ma_cuonsach) references Cuonsach(ma_cuonsach),
	Foreign key (isbn) references Dausach(isbn)
);
go