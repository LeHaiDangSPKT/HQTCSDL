create database student_cau2
go

use student_cau2
go

create table Students(
	sid char(30) primary key,
	name char(50),
	login char(100),
	age int,
	gpa float
);

create table Faculty(
	fid char(30) primary key,
	fname nvarchar(50),
	sal float
);

create table Courses(
	cid char(30) primary key,
	cname nvarchar(100),
	credits int
);

create table Rooms (
	rno int primary key,
	address nvarchar(200),
	capacity int
);

create table Enrolled(
	sid char(30),
	cid char(30),
	primary key (sid, cid),
	grade char(50),
	foreign key (sid) references Students (sid),
	foreign key (cid) references Courses (cid),
);

create table Teaches(
	fid char(30),
	cid char(30),
	primary key (fid, cid),
	foreign key (fid) references Faculty (fid),
	foreign key (cid) references Courses (cid),
);

create table Meets_In(
	cid char(30),
	rno int,
	primary key (cid, rno),
	foreign key (cid) references Courses (cid),
	foreign key (rno) references Rooms (rno),
	time char(20)
);
