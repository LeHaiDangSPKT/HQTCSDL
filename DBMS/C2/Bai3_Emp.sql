create database EmpCau3
go

use EmpCau3
go

create table Emp(
	eid int not null primary key,
	ename nvarchar(250),
	age int,
	salary float
);

create table Dept(
	did int not null primary key,
	dname nvarchar(250),
	budget real,
	managerid int
	foreign key (managerid) references Emp (eid) not null,
);

create table Work (
	eid int not null,
	did int not null, 
	primary key (eid , did),
	pct_time int 
	foreign key (eid) references Emp (eid),
	foreign key (did) references Dept (did)
);


insert into Emp values (101, 'John Doe', 32, 15000);

update Emp
set Emp.salary = Emp.salary * 1.1

delete Dept
where dname = 'Toy'