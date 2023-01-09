use ShoeStore


-- Load danh sach kho
go
create view v_loaddanhsachkho 
as
	select *
	from NHAPKHO
	where NHAPKHO.status=1 
select distinct * from v_loaddanhsachkho


--Them phieu nhap kho

create proc pr_themphieunhapkho 
@idnv int ,@idNcc int, @ngaynhapkho date
as
begin 
insert into NHAPKHO(idNV,idNCC,ngayNhapKho) values (@idnv ,@idNcc ,@ngaynhapkho)
end

execute pr_themphieunhapkho '1','1','20201219'

-- Lấy danh sách phiếu nhập kho theo idNhapKho
go
create proc pr_loadCTNK_idNK @idNk int
as
begin
	select *
	from CHITIETNHAPKHO
	where idNhapKho=@idNk
end
execute pr_loadCTNK_idNK '1'

--Proc insert chi tiết phiếu nhập kho

create proc pr_insertCTNK 
@idgiay int ,
@soluong float ,
@giagoc float
as
begin
	insert into CHITIETNHAPKHO(idGiay,soLuong,donGia)
	 values (@idgiay,@soluong,@giagoc)
end
