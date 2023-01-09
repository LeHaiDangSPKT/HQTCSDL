create database Bai2_Sach
go

use Bai2_Sach
go

create table Tuasach(
	ma_tuasach int primary key,
	tuasach nvarchar(30),
	tacgia nvarchar(50),
	tomtat nvarchar(200),
);

create table Dausach(
	isbn int primary key,
	ma_tuasach int,
	ngonngu nvarchar(30),
	bia nvarchar(30),
	trangthai nvarchar(30),
	Foreign key (ma_tuasach) references Tuasach(ma_tuasach),
);

create table Cuonsach(
	ma_cuonsach int primary key,
	isbn int ,
	tinhtrang nvarchar(5),
	Foreign key (isbn) references Dausach(isbn),
);

