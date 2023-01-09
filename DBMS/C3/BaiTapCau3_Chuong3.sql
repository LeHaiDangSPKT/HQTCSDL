--Viết hàm tính tuổi của người có năm sinh được nhập vào như một tham số của hàm
go
create function TinhTuoi 
(
	@namSinh int
)
returns int
as
begin
	declare @tuoi int;	
	set @tuoi = YEAR(GETDATE()) - @namSinh;
	return @tuoi
end
go