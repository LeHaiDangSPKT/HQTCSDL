--1.ham function tra ve san pham theo id hang giay
go
create function f_loaigiay_nsx (@idhanggiay int)
returns table 
as
return (select idLoaiGiay,maLoaiGiay,tenLoaiGiay,idHangGiay,soLuongLoaiGiay,status 
from LOAIGIAY where idHangGiay =@idhanggiay)

select * from f_loaigiay_nsx('1')

--2.ham tra thong tin nguoi dung qua sdt
go
create function f_khachhang_sdt(@sdt varchar(10))
returns table
as
return(select * from KHACHHANG where sdt =@sdt)

select* from f_khachhang_sdt('0326526984')

--3.ham tra ve tong so hoa don trong ngay --
go
create function f_tonghoadon_time (@day date)
returns int
as
begin
declare @tonghoadon int
select @tonghoadon =COUNT(idHoaDon) from HOADON where HOADON.ngayInHoaDon=@day
return @tonghoadon
end
go
select dbo.f_tonghoadon_time('20201212') as tong

--4.ham tra ve so luong don hang
go
create function f_slhoadon()
returns int
as
begin
declare @sl int 
set @sl = (select COUNT(idHoaDon) from HOADON)
return @sl
end 
select dbo.f_slhoadon() as SLDon

--5.Tính lợi nhuận trong ngày
go
create function f_loinhuan_ngay (@ngayban date)
returns float
as
begin
declare @soluonggiayban int ,@giaban float,@gianhap float,@loinhuan float,@tongloinhuan float

select @soluonggiayban =cthd.soLuong ,@giaban = cthd.donGia,@gianhap=ctnk.donGia
from CHITIETNHAPKHO as ctnk ,CHITIETHOADON as cthd ,HOADON as hd 
where cthd.idHoaDon=hd.idHoaDon and ctnk.idGiay =ctnk.idGiay and hd.ngayInHoaDon =@ngayban and cthd.status=1

set @loinhuan = @soluonggiayban * (@giaban -@gianhap)
set @tongloinhuan =SUM(@loinhuan)
return @tongloinhuan
end
go
select dbo.f_loinhuan_ngay('20201212') as tongloinhuan

--6. Tính tổng số tiền tiền khách hàng đã mua ở cửa hàng
create function [dbo].[fn_tinhtienhoadonkhachhang] ()
returns table
as
return (SELECT KHACHHANG.tenKH, sum(HOADON.thanhTien) as tongtienkhachhang  From KHACHHANG,HOADON 
		where  KHACHHANG.idKH = HOADON.idKH
		group by KHACHHANG.tenKH)
GO