create database BaiKtra
go

use BaiKtra
go

create table Emp(
	eid int primary key,
	ename nvarchar(250),
	age int,
	salary float,
	did int
);

create table Dept(
	did int primary key,
	dname nvarchar(250),
	budget real,
	managerid int
	foreign key (managerid) references Emp (eid),
);

alter table Emp with check add foreign key (did) references Dept (did)
go 

create function KiemTra (@did int)
returns int
as
begin 
	declare @TongLuong real, @Budget real
	select @TongLuong = sum(Emp.salary)
	from Emp
	where Emp.did = @did
	select @Budget = Dept.budget
	from Dept
	where did = @did
	if (@Budget > @TongLuong)
		return 1
	else
		return 0
	return 0
end


