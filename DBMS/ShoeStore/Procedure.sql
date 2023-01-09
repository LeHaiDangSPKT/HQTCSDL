--1.Lấy danh sách phiếu nhập kho theo idNhapKho
go
create proc pr_loadCTNK_idNK @idNk int
as
begin
	select * from CHITIETNHAPKHO, GIAY
	where CHITIETNHAPKHO.status=1 and CHITIETNHAPKHO.idGiay = GIAY.idGiay
	and CHITIETNHAPKHO.idNhapKho = @idNk
end
execute pr_loadCTNK_idNK '1'

--2.Thông tin sản phẩm giày có giá bán cao nhất và thấp nhất
create proc pr_maxGiaBanGiay
as
begin
	declare @giaban float
	set @giaban = (select max(giaBan) as GiaBanCaoNhat
						from GIAY)
	select *from GIAY where GIAY.giaBan = @giaban
end
execute pr_maxGiaBanGiay
--min
create proc pr_minGiaBanGiay
as
begin
	declare @giaban float
	set @giaban = (select min(giaBan) as GiaBanCaoNhat
						from GIAY)
	select *from GIAY where GIAY.giaBan = @giaban
end

--3. Them chi tie hoa don
create proc pr_ThemChiTietHoaDon @idhoadon int, @idgiay int, @soluong int, @dongia int, @thanhTien float
as
begin
insert into CHITIETHOADON (idHoaDon, idGiay, donGia, thanhTien, soLuong)
values (@idhoadon, @idgiay, @dongia,@thanhTien, @soluong)
end

--4. Thêm chi tiết nhập kho (chua co)
create proc pr_themChiTietNhapKho
@idNhapKho int, @idGiay int, @soLuong int, @donGia float, @thanhTien float
as
begin
	insert into CHITIETNHAPKHO (idNhapKho, idGiay, soLuong, donGia, thanhTien)
	 values (@idNhapKho, @idGiay, @soLuong, @donGia, @thanhTien)
end
execute pr_themChiTietNhapKho '9','3','5','1000000','0'
--5.Them giay
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

--6. Thêm hãng giày (De lai)
create proc pr_themHangGiay 
	@tenHG nvarchar(150), @status int
as
begin 
	insert into HANGGIAY(tenHangGiay, status) 
	values (@tenHG,@status)
end

execute pr_themHangGiay 'Bitis','1'

--7. Them hoa don
create proc pr_ThemHoaDon @idNV int, @idKH int, @ngayxuatdon date
as
begin 
insert into HOADON (idNV,idKH,ngayInHoaDon)
values (@idNV, @idKH,@ngayxuatdon)
end

--8.Them khach hang
go
create proc pr_themkhachhang
@tenkh nvarchar(50),@sdt varchar(20)
as
begin
	insert into KHACHHANG(tenKH,sdt) values (@tenkh,@sdt)
end
execute pr_themkhachhang'hieu','0906050123'



--9.Them phieu nhap kho
create proc pr_themphieunhapkho 
@idnv int ,@idNcc int, @ngaynhapkho date
as
begin 
insert into NHAPKHO(idNV,idNCC,ngayNhapKho) values (@idnv ,@idNcc ,@ngaynhapkho)
end
execute pr_themphieunhapkho '1','1','20201219'

--10.Thống kê tổng doanh thu
create proc pr_thongKeTongDoanhThu
as
begin
select ngayInHoaDon, sum(soLuong) as TongSoLuong, sum(thanhTien) as TongThanhTien from HOADON where status=1 group by ngayInHoaDon
end
execute pr_thongKeTongDoanhThu

--11.Xoá chi tiết hoá đơn
go
create proc pr_XoaChiTietHoaDon @idChiTietHoaDon int
as
begin
update CHITIETHOADON set status=0 where idChiTietHoaDon =@idChiTietHoaDon
End
execute pr_XoaChiTietHoaDon '15'
--12.Xoá toàn bộ hoá đơn (Chưa có)
go 
create proc pr_XoaToanBoHoaDon @idHoaDon int
as
begin
update HOADON set status=0 where idHoaDon = @idHoaDon
update CHITIETHOADON set status=0 where idHoaDon = @idHoaDon
End
execute pr_XoaToanBoHoaDon '7'
--13. Thêm tài khoản nhân viên
create proc pr_themNhanVien
	@tenNV nvarchar(150), @taikhoan varchar(50), @matkhau varchar(500), @sdt varchar(20), @mail varchar(150), @phanquyen int, @status int
as
begin 
	insert into NHANVIEN(tenNV, username, password, sdt, email, phanQuyen, status) 
	values (@tenNV ,@taikhoan ,@matkhau, @sdt, @mail, @phanquyen, @status)
end

execute pr_themNhanVien N'Nguyễn Quốc Bảo', 'bao3042', '300459', '0988720113', 'bao3042@gmail.com', '1', '1'
