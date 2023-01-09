create database Bai4_Employees
go
use Bai4_Employees
go

create table dbo.Employees(
	ssn int primary key, 
	phone int,
	salary float
);

create table dbo.Deparments(
	dno int primary key,
	dname nvarchar(250),
	budget char(50),
	manages int,
	foreign key (manages) references  Employees (ssn)
);

create table dbo.Works_in(
	ssn int,
	dno int,
	primary key (ssn, dno),
	foreign key (ssn) references  Employees (ssn),
	foreign key (dno) references  Deparments (dno)
);

create table dbo.Child(
	ssn int,
	name nvarchar(250),
	age int,
	primary key(ssn, name),
	foreign key (ssn) references  Employees (ssn),
);

