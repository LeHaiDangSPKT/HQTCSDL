--6.1) Viết hàm trả về tổng tiền lương trung bình của một phòng ban tùy ý 
--(truyền vào MaPB)
create function LuongTrungBinh (@Maphg varchar) 
returns numeric(18,0)
as
begin
	declare @avgLuong numeric (18,0)
	select @avgLuong = nv.LUONG
	from NHANVIEN nv, PHONGBAN pb
	where nv.MANQL = pb.TRPHG and 
		pb.MAPHG = @Maphg
	return @avgLuong
end

go
select dbo.LuongTrungBinh((1))

--drop function LuongTrungBinh

go
--6.2. Viết hàm trả về tổng lương nhận được của nhân viên theo dự án 
--(truyền vào MaNV và MaDA)	
create function TongLuongNV
(
	@MANV varchar(9),
	@MADA varchar(2)
)
returns numeric(18,0)
as
begin
	declare @tongLuong numeric(18,0)
	select @tongLuong = sum(nv.LUONG)
	from NHANVIEN nv, DEAN da, PHANCONG pc
	where nv.MANV = pc.MANV and
		pc.SODA = da.MADA and
		nv.MANV = @MANV and
		da.MADA = @MADA
	group by nv.MANV
	return @tongLuong

end

go

select dbo.TongLuongNV ('nv01', 'D3')
go

--6.3. Viết hàm trả về tổng tiền lương trung bình của các phòng ban

