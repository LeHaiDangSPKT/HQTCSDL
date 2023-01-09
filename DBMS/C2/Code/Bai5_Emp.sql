create database Cau5_Emp
go

use Cau5_Emp
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
	foreign key (managerid) references Emp (eid)
	
);

create table dbo.Work (
	eid int,
	did int, 
	primary key (eid , did),
	pct_time int 
	foreign key (eid) references Emp (eid),
	foreign key (did) references Dept (did)
);


/*2.	Định nghĩa một ràng buộc mức bảng trên Dept sao cho đảm bảo tất cả người quản lý đều có tuổi lớn hơn 30 */

alter table Emp add constraint LuongToiThieu 
	check (salary >= 10000)

create function KiemTraTuoi (@managerid int)
returns int as 
begin 
	declare @tuoi int
	select @tuoi = E.age 
	from Emp E
	where E.eid = @managerid;
	if (@tuoi is null) 
		return 0;
	if (@tuoi >30)
		return 1;
	return 0;
end
alter table Dept add constraint KiemTraTuoiCS check (dbo.KiemTraTuoi(managerid) = 1)

/* 3.	Định nghĩa một assertion trên Dept sao cho đảm bảo là mọi người quản lý đều có tuổi lớn hơn 30. */
/* So sánh assertion này với ràng buộc tạo ở câu 2. Hãy giải thích cái nào tốt hơn.*/

create trigger KiemTraTuoiQL on Dept
after insert, update as
declare @newmanagerid int, @oldmanagerid int, @newage int, @did int
select @newmanagerid = ne.managerid, @oldmanagerid = ol.managerid, @did = ol.did
from inserted ne, deleted ol
where ne.managerid = ol.managerid
select @newage = Emp.age
from Emp
where Emp.eid=@newmanagerid
if (@newage < 30)
Begin
  print 'error'
  rollback
end



delete from Emp
where Emp.eid in (select Emp.eid
				  from Emp as Employ, Emp as Manager, Work, Dept
				  where Manager.eid = Dept.managerid and
						Dept.did = Work.did and
						Work.eid = Employ.eid and
						Employ.salary > Manager.salary
				  );
