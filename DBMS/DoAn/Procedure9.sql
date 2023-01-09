--1.Them giay
go
create proc pr_themgiay
@tenloaigiay nvarchar(50),@idhanggiay int,@soluonggiay int
as
begin
	insert into LOAIGIAY(tenLoaiGiay,idHangGiay,soLuongLoaiGiay)
	values (@tenloaigiay,@idhanggiay,@soluonggiay)
end
go
drop proc pr_themgiay
execute pr_themgiay 'Nike Dior','1','10'

--2.Them khach hang
go
create proc pr_themkh
@tenkh nvarchar(50),@sdt varchar(20)
as
begin
	insert into KHACHHANG(tenKH,sdt) values (@tenkh,@sdt)
end
execute pr_themkh'hieu','0906050123'

--3.cap nhat hoa don
go
create proc pr_hoadon
@idhoadon int, @idnv int, @idkh int, @ngay date
as
begin
update HOADON set idNV = @idnv, idKH = @idkh, ngayInHoaDon = @ngay where idHoaDon = @idhoadon
end
--execute pr_hoadon '1', '2','3','20201219'

--4.Thống kê tổng doanh thu
create proc pr_thongKeTongDoanhThu
as
begin
select ngayInHoaDon, sum(soLuong) as TongSoLuong, sum(thanhTien) as TongThanhTien from HOADON where status=1 group by ngayInHoaDon
end
--execute pr_thongKeTongDoanhThu

--5.Them phieu nhap kho
create proc pr_themphieunhapkho 
@idnv int ,@idNcc int, @ngaynhapkho date
as
begin 
insert into NHAPKHO(idNV,idNCC,ngayNhapKho) values (@idnv ,@idNcc ,@ngaynhapkho)
end
--execute pr_themphieunhapkho '1','1','20201219'

--6.Lấy danh sách phiếu nhập kho theo idNhapKho
go
create proc pr_loadCTNK_idNK @idNk int
as
begin
	select * from CHITIETNHAPKHO, GIAY
	where CHITIETNHAPKHO.status=1 and CHITIETNHAPKHO.idGiay = GIAY.idGiay
	and CHITIETNHAPKHO.idNhapKho = @idNk
end
--execute pr_loadCTNK_idNK '1'
--7.Proc insert chi tiết phiếu nhập kho
go
create proc pr_insertCTNK 
@idNhapKho int, @idGiay int, @soLuong int, @donGia float, @thanhTien float
as
begin
	insert into CHITIETNHAPKHO (idNhapKho, idGiay, soLuong, donGia, thanhTien)
	 values (@idNhapKho, @idGiay, @soLuong, @donGia, @thanhTien)
end

--execute pr_insertCTNK '1', '1', '10', '1000000', '0'
--8.Xoá chi tiết hoá đơn
go
create proc sp_XoaChiTietHoaDon @idChiTietHoaDon int
as
begin
update CHITIETHOADON set status=0 where idChiTietHoaDon =@idChiTietHoaDon
End

--9.Xoá toàn bộ hoá đơn
go 
create proc sp_XoaToanBoHoaDon @idHoaDon int
as
begin
update HOADON set status=0 where idHoaDon = @idHoaDon
update CHITIETHOADON set status=0 where idHoaDon = @idHoaDon
End