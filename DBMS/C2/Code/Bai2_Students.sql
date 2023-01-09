create database Cau2_Students
go

use Cau2_Students
go

create table dbo.Students(
	sid varchar(30) primary key,
	name nvarchar(100) not null,
	login varchar(50) not null,
	age int not null,
	gpa float not null
)

create table dbo.Faculty(
	fid varchar(30) primary key,
	fname nvarchar(100) not null,
	sal float not null
)

create table dbo.Courses(
	cid varchar(30) primary key,
	cname nvarchar(100) not null,
	credits int not null
)

create table dbo.Rooms(
	rno int primary key,
	address nvarchar(200),
	capacity int not null
)

create table dbo.Enrolled(
	sid varchar(30),
	cid varchar(30), 
	grade varchar(30),
	primary key (sid, cid),
	foreign key (sid) references Students(sid),
	foreign key (cid) references Courses (cid)
	)

create table dbo.Teaches(
	fid varchar(30),
	cid varchar(30),
	primary key(fid, cid),
	foreign key (fid) references Faculty(fid),
	foreign key (cid) references Courses (cid)
)

create table dbo.Meet_In(
	cid varchar(30),
	rno int,
	primary key(cid, rno),
	time varchar(30),
	foreign key (cid) references Faculty (fid),
	foreign key (rno) references Rooms (rno)
)


