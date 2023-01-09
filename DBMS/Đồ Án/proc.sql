-- 3.3.1.1.	Thêm tài khoản nhân viên
create proc sp_themNhanVien
	@tenNV nvarchar(150), @taikhoan varchar(50), @matkhau varchar(500), @sdt varchar(20), @mail varchar(150), @phanquyen int, @status int
as
begin 
	insert into NHANVIEN(tenNV, username, password, sdt, email, phanQuyen, status) 
	values (@tenNV ,@taikhoan ,@matkhau, @sdt, @mail, @phanquyen, @status)
end

execute sp_themNhanVien N'Nguyễn Quốc Bảo', 'bao3042', '300459', '0988720113', 'bao3042@gmail.com', '1', '1'

-- 3.3.1.2.	Thêm hóa đơn
create proc sp_Themhoadon 
	@idNV int, @idKH int, @ngayxuatdon date, @status int
as
begin 
	insert into HOADON (idNV,idKH,ngayInHoaDon,status)
	values (@idNV, @idKH,@ngayxuatdon,@status)
end

execute sp_Themhoadon '2','3','20201217','1'

-- 3.3.1.3.	 Thêm chi tiết đơn hàng (set thanhtien thành null)
create proc sp_themchitiethoadon 
	@idhoadon int, @idgiay int, @dongia int, @soluong int, @status int
as
begin
	insert into CHITIETHOADON (idHoaDon, idGiay, donGia, soLuong,status)
	values (@idhoadon, @idgiay, @dongia, @soluong, @status)
end

execute sp_themchitiethoadon '1','1','1000000','2','1'

-- 3.3.1.4.	Thêm phiếu nhập kho
create proc sp_themphieunhapkho 
	@idnv int, @idNcc int, @ngaynhapkho date, @status int
as
begin 
	insert into NHAPKHO (idNV,idNCC,ngayNhapKho,status) 
	values (@idnv ,@idNcc ,@ngaynhapkho, @status)
end

execute sp_themphieunhapkho '2','1','20201219','1'

--3.3.1.5.	 Thêm giày
create proc sp_themGiay 
	@maGiay varchar(50), @idLoaiGiay int, @mauSac nvarchar(50), @size int, @soluong int, @giaBan float, @status int 
as
begin 
	insert into GIAY (maGiay, idLoaiGiay, mauSac, size, soLuongGiay, giaBan, status) 
	values (@maGiay ,@idLoaiGiay ,@mauSac, @size, @soluong, @giaBan, @status)
end

execute sp_themGiay 'g001','2',N'đỏ','36','20','1600000','1'

--3.3.1.6.	Thêm khách hàng
create proc sp_themKhachHang
	@tenKH nvarchar(150), @sdt varchar(20), @tongtien float, @status int
as
begin
	insert into KHACHHANG(tenKH, sdt, tongTien, status) 
	values (@tenKH ,@sdt ,@tongtien, @status)
end

execute sp_themKhachHang N'Xuâng', '0988720113', '2000000', '0'

--3.3.1.7.	Thêm hãng giày
create proc sp_themHangGiay 
	@tenHG nvarchar(150), @status int
as
begin 
	insert into HANGGIAY(tenHangGiay, status) 
	values (@tenHG,@status)
end

execute sp_themHangGiay 'Bitis','1'

--3.3.1.8.	Cập nhật lại tài khoản user
create proc sp_capNhatNhanVien
	 @tenNV nvarchar(150), @taikhoan varchar(50), @matkhau varchar(500), 
	@sdt varchar(20), @mail varchar(150), @phanquyen int, @status int
as
begin 
	update NHANVIEN set username = @taikhoan where tenNV=@tenNV 
	update NHANVIEN set password = @matkhau where tenNV=@tenNV
	update NHANVIEN set sdt=@sdt where tenNV=@tenNV
	update NHANVIEN set email=@mail where tenNV=@tenNV
	update NHANVIEN set phanQuyen=@phanquyen where tenNV=@tenNV
	update NHANVIEN set status=@status where tenNV=@tenNV
end

execute sp_capNhatNhanVien N'Nguyễn Quốc Bảo', 'bao3042000', '300459', '0988720113', 'baonguyen3042000@gmail.com', '1', '0'


-- 3.3.1.9.	Cập nhật lại hóa đơn
create proc sp_capnhathoadon 
	@idhoadon int, @idnv int, @idkh int, @ngayin date, @status int
 as
 begin
	update HOADON SET idNV = @idnv, idKH =@idkh, ngayInHoaDon =@ngayin,status = @status
 end

 execute sp_capnhathoadon '1',N'2','2','20200112','1'


 --Cập nhật chi tiết hóa đơn
 create proc sp_capnhatchitiethoadon 
	@idhoadon int, @idgiay int, @dongia int, @soluong int, @status int
as
begin
	update CHITIETHOADON SET  idHoaDon= @idhoadon, idGiay =@idgiay, donGia =@dongia, soLuong = @soluong ,status = @status
end

execute sp_capnhatchitiethoadon '1','2','2200000','2','1'


--3.3.1.12.	Xóa hóa đơn (ưu tiên xóa chi tiết hóa đơn hơn vì khi chi tiết hóa đơn không có idhoadon mới xóa được khóa đơn)
create proc xoahoadon (@idhoadon int)
 as
 begin
	delete from HOADON where idHoaDon = @idhoadon
 end

 execute xoahoadon '2'


 --3.3.1.13.	Xóa chi tiết hóa đơn
 create proc xoachitiethoadon (@idchitiethoadon int)
 as
 begin
	 delete from CHITIETHOADON where idChiTietHoaDon = @idchitiethoadon
 end

 execute xoachitiethoadon '1'


 --3.3.1.14.	Lấy danh sách phiếu nhập kho theo idNhapKho
 create proc pr_loadCTNK_idNK @idNk int
as
begin
	select *
	from CHITIETNHAPKHO
	where idNhapKho=@idNk
end
execute pr_loadCTNK_idNK '1'


-- 3.3.1.15.	Thông tin sản phẩm giày có giá bán cao nhất và thấp nhất
create proc sp_maxGiaBanGiay
as
begin
	declare @giaban float
	set @giaban = (select max(giaBan) as GiaBanCaoNhat
						from GIAY)
	select *from GIAY where GIAY.giaBan = @giaban
end

execute sp_maxGiaBanGiay


-- 3.3.1.16.	Thống kê tổng danh thu
create proc pr_thongKeTongDoanhThu
as
begin
select ngayInHoaDon, sum(soLuong) as TongSoLuong, sum(thanhTien) as TongThanhTien from HOADON where status=1 group by ngayInHoaDon
end
execute pr_thongKeTongDoanhThu
