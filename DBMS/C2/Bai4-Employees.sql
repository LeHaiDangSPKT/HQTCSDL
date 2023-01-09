create database Employees_Bai4
go
use Employees_Bai4
go

create table Employees(
	ssn int primary key, 
	phone int,
	salary float
);

create table Deparments(
	dno int primary key,
	dname nvarchar(250),
	budget char(50),
	manages int,
	foreign key (manages) references  Employees (ssn)
);

create table Works_in(
	ssn int,
	dno int,
	primary key (ssn, dno),
	foreign key (ssn) references  Employees (ssn),
	foreign key (dno) references  Deparments (dno)
);

create table Child(
	ssn int,
	name nvarchar(250),
	age int,
	primary key(ssn, name),
	foreign key (ssn) references  Employees (ssn),
);