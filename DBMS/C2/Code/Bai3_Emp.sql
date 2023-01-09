create database Cau3_Emp
go

use Cau3_Emp
go

create table dbo.Emp(
	eid int primary key,
	ename nvarchar(250) not null,
	age int not null,
	salary float
);

create table dbo.Dept(
	did int primary key,
	dname nvarchar(250),
	budget real,
	managerid int,
	
);

create table dbo.Work (
	eid int,
	did int, 
	primary key (eid , did),
	pct_time int 
	foreign key (eid) references Emp (eid),
	foreign key (did) references Dept (did)
);

alter table Dept add foreign key (managerid) references Emp (eid)

insert into Emp values (101, 'John Doe', 32, 15000);
insert into Emp values (103, 'Toy', 34, 20000);



update Emp 
set Emp.salary = Emp.salary * 1.1

delete Dept where dname = 'Toy'