use ShoeStore
go
-- proc Thêm hóa đơn --
go
create proc sp_Themhoadon @idNV int, @idKH int, @ngayxuatdon date, @status int
as
begin 
insert into HOADON (idNV,idKH,ngayInHoaDon,status)
values (@idNV, @idKH,@ngayxuatdon,@status)
end
execute sp_Themhoadon '2','3','20201217','1'

--pro thêm chi tiết đơn hàng (set thanhtien thành null )
use ShoeStore
go
create proc sp_themchitiethoadon @idhoadon int, @idgiay int, @dongia int, @soluong int, @status int
as
begin
insert into CHITIETHOADON (idHoaDon, idGiay, donGia, soLuong,status)
values (@idhoadon, @idgiay, @dongia, @soluong, @status)
end

execute sp_themchitiethoadon '1','1','1000000','2','1'

 --cập nhật--
 --Cập nhật lại hóa đơn
 go
 create proc sp_capnhathoadon @idhoadon int, @idnv int, @idkh int, @ngayin date, @status int
 as
 begin
 update HOADON SET idNV = @idnv, idKH =@idkh, ngayInHoaDon =@ngayin,status = @status
 End
 execute sp_capnhathoadon '1',N'2','2','20200112','1'
 --cập nhật chi tiết hóa đơn
  go
 create proc sp_capnhatchitiethoadon @idhoadon int, @idgiay int, @dongia int, @soluong int, @status int
 as
 begin
 update CHITIETHOADON SET  idHoaDon= @idhoadon, idGiay =@idgiay, donGia =@dongia, soLuong = @soluong ,status = @status
 End

 execute sp_capnhatchitiethoadon '1','2','2200000','2','1'
 --xóa
 --Xóa hóa đơn (ưu tiên xóa chi tiết hóa đơn hơn vì khi chi tiết hóa đơn không có idhoadon mới xóa dc hóa đơn)
 Go
 create proc xoahoadon (@idhoadon int)
 as
 begin
 Delete from HOADON where idHoaDon = @idhoadon
 end
 execute xoahoadon '2'
-- Xóa chi tiết hóa đơn
 Go
 create proc xoachitiethoadon (@idchitiethoadon int)
 as
 begin
 Delete from CHITIETHOADON where idChiTietHoaDon = @idchitiethoadon
 end
 execute xoachitiethoadon '1'
